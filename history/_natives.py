import chardet, os

def GetEncoding(directory):
    #Open provinces file and get encoding to use later.
    with open(directory, 'rb') as f:
        result = chardet.detect(f.read())
        #print(result)
        return result['encoding']

def Convert(tup, di):
    for a, b in tup:
        di.setdefault(a, []).append(b)
    return di

def ToFileTerrains(province_array):
    with open(directory + "terrains.txt", "w") as f:
        # Write each line to the file
        for line in province_array:
            f.write(line + "\n")

def ToFileDicts(dict_province):
    with open(directory + "dictTuples.txt", "w") as f:
        # Write each line to the file
        for tuple in dict_province:
            f.write(tuple + " : " + dict_province.get(tuple) + "\n")

def PrintDictDict(culturesDict) :
    for culture in culturesDict :
        for terrain in culturesDict.get(culture) :
            try :
                culturesDict.get(culture).get(terrain).printSelf()
            except :
                a = 1

class Province:
    def __init__(self, terrain, pathName):
        self.terrain = terrain
        self.pathName = pathName
        self.isTribal = False
        encoding = GetEncoding(directory + "provinces/" + pathName)
        with open(directory + "provinces/" + pathName, "r", encoding=encoding) as file:
            for line in file :
                if line.split(" ")[0] == "culture" :
                    self.culture = line.split(" ")[-1].strip()
                if line.split(" ")[0] == "tribal_owner" or line.split(" ")[0] == "owner":
                    self.isTribal = True

    def printSelf(self):
        print(self.pathName + " | Terrain = " + self.terrain + " | Culture = " + self.culture + " | Tribal or Owned = " + str(self.isTribal))

class CultureTerrain:
    def __init__(self, culture, terrain, natives, hostility, ferocity):
        self.culture = culture
        self.terrain = terrain
        self.natives = natives
        self.hostility = hostility
        self.ferocity = ferocity

    def printSelf(self):
        print(self.culture + " | " + self.terrain + " | " + self.natives + " | " + self.hostility + " | " +self.ferocity)

directory = "c:/Users/Miroslav/Documents/Paradox Interactive/Europa Universalis IV/mod/_Anbennar-My-Git/history/"

#Preprocess the culturesTerrains file. Output is a dict of dicts containing CultureTerrain objects
#CultureTerrain Objects are a combination of a culture an terrain and sum up to all combinations in file.
with open(directory + "culturesTerrains.txt", "r") as file:
    culturesDict = {}
    for line in file:
        lineArr = line.split("|")
        culture = lineArr[0].strip()
        terrainsGroups = lineArr[1].strip()
        hostility = lineArr[-2].strip()
        ferocity = lineArr[-1].strip()

        terrainsDict = {}
        for index in range(int(terrainsGroups)):
            terrainSplit = lineArr[2 + index].split(":")
            natives = terrainSplit[1].strip()
            actualTerrains = terrainSplit[0].strip().split(",")
            for terrain in actualTerrains:
                terrainsDict.update({terrain.strip() : CultureTerrain(culture,terrain.strip(),natives,hostility,ferocity)})

        culturesDict.update({culture : terrainsDict})

#PrintDictDict(culturesDict)

#Preprocess the _provinces file generated from EU4 Console's logs
province_array = []
file_tuples = []
dict_province = {}
listProvinces = []

# Iterate over each file in the directory
for file_name in os.listdir((directory + "provinces/")[:-1]):
    # Check if the file is a regular file (i.e., not a directory)
    if os.path.isfile(os.path.join((directory + "provinces/")[:-1], file_name)):
        # Add the file name to the list
        dict_province.update({file_name.split("-")[-1].strip().split(".")[0] : file_name})

ToFileDicts(dict_province)

encoding = GetEncoding(directory + "_provinces.txt")

#Open same file, this time using the proper encoding.
with open(directory + "_provinces.txt", "r", encoding=encoding) as file:
    #Special characters dict
    special_chars = {"â": "a", "î": "i", "ô": "o", "è": "e", "ï": "i", "á": "a", "é": "e", "í": "i", "ó": "o", "ú": "u", "à": "a", "ù": "u", "ê": "e", "û": "u", "ç": "c"}

    for line in file:
        for special_char, regular_char in special_chars.items():
            #remove special characters and apostrophes
            line = line.replace(special_char, regular_char)
            line = line.replace("'", "")
        province = line.split(":", 3)[3].strip()
        province_split = province.split(" ")
        if dict_province.__contains__('_'.join(map(str,province_split[1:-2]))) : 
            listProvinces.append(Province(province_split[-1], dict_province.get('_'.join(map(str,province_split[1:-2])))))
        province = province_split[0] + " " + '_'.join(map(str,province_split[1:-2])) + " " + ' '.join(province_split[-2:])
        province_array.append(province)

ToFileTerrains(province_array)

for pr in listProvinces :
    #pr.printSelf()
    if pr.isTribal == True :
        continue
    else :
        natives = culturesDict.get(pr.culture).get(pr.terrain).natives
        hostility = culturesDict.get(pr.culture).get(pr.terrain).hostility
        ferocity = culturesDict.get(pr.culture).get(pr.terrain).ferocity
        if natives[-1] == "0" and natives[-2] == "0" :
            natives = int(natives)/100
        else :
            natives = float(natives)/100
        data = []
        with open(directory + "provinces/" + pr.pathName, "r") as file:
            for line in file :
                content = line.split("=")
                if content[0].strip() == "native_size" :
                    content = content[0] + "= " + str(natives)
                    data.append(content)
                elif content[0].strip() == "native_ferocity" :
                    content = content[0] + "= " + ferocity
                    data.append(content)
                elif content[0].strip() == "native_hostileness" :
                    content = content[0] + "= " + hostility
                    data.append(content)
                else :
                    data.append('='.join(content))
        with open(directory + "provinces/" + pr.pathName, "w") as file:
            file.writelines(data)
            #print("\n".join(data))
        