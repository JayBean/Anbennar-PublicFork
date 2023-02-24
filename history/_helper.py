lines = []
lines.append("set_prov_vars = {")
for x in range(6745)[1:]: ## insert max_provinces from default.map
    lines.append(f"\t{x} = {{ set_variable = {{ which = prov_id value = {x} }} }}")
lines.append("}")

directory = "c:/Users/Miroslav/Documents/Paradox Interactive/Europa Universalis IV/mod/_Anbennar-My-Git/history/"
with open(directory + "genCode.txt", "w") as file:
    for line in lines:
        file.write(line + "\n")