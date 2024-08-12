import os
import ctypes
import sys

def calc_hash(key):
    res = ctypes.c_uint32(-0x7ee3623b).value

    for i in range(len(key)):
        res = ctypes.c_uint32(ord(key[i]) ^ ctypes.c_uint32(res * 0x1000193).value).value

    return res


def load_vanilla_hashes():
    vanilla_hashes = {}

    if os.path.exists('vanilla_hashes.txt'):
        with open('vanilla_hashes.txt', 'r', encoding="utf-8-sig", errors="ignore") as file:
            text = file.readlines()
            for line in text:
                if len(line) == 0:
                    continue

                line = line.strip()
                [hash, keys] = line.split(':')
                vanilla_hashes[int(hash)] = keys.split(';')
    return vanilla_hashes


colors = {
    "RED": '\033[0;31m',
    "GREEN": '\033[0;32m',
    "YELLOW": '\033[1;33m',
    "BLUE": '\033[0;34m',
    "CYAN": '\033[0;36m',
    "NC": '\033[0m'
}


vanilla_hashes = load_vanilla_hashes()
path = 'localisation'

hashes = {}
errors = []

for file_name in os.listdir(path):
    with open(os.path.join(path, file_name), 'r', encoding="utf-8-sig", errors="ignore") as file:
        text = file.readlines()
        for i in range(0, len(text)):
            line = text[i].split('#')[0].strip()
            if line == '':
                continue

            key = line.split(':')[0]

            if key == 'l_english':
                continue

            hash = calc_hash(key)
            if hash not in hashes:
                hashes[hash] = [(file_name, key)]

                # Only include different keys from vanilla, duplicates are allowed due to overriding
                if hash in vanilla_hashes:
                    found_collision = False
                    for vanilla_key in vanilla_hashes[hash]:
                        if key != vanilla_key:
                            hashes[hash].append(('Vanilla', vanilla_key))
                            found_collision = True
                    if found_collision:
                        errors.append(hash)
            else:
                hashes[hash].append((file_name, key))

                if hash not in errors:
                    errors.append(hash)


warning_text = ''
error_text = ''

for error in errors:
    text = ''
    color = 'YELLOW'
    for i in range(1, len(hashes[error])):
        if hashes[error][0][1] != hashes[error][i][1]:
            color = 'RED'
            break

    text = f'{colors[color]}Collision:{colors["NC"]}\n'
    for pair in hashes[error]:
        text += f'{colors[color]}{pair[1]} in {pair[0]}{colors["NC"]}\n'
    text += '\n'

    if color == 'RED':
        error_text += text
    else:
        warning_text += text

if len(warning_text) > 0:
    print(f"{colors['YELLOW']}WARNINGS:{colors['NC']}")
    print(f'{warning_text}')
    print('\n')

if len(error_text) > 0:
    print(f"{colors['RED']}ERRORS:{colors['NC']}")
    print(f'{error_text}')

if len(error_text) > 0:
    sys.exit(1)
