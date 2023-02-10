sir = ' ' + input("Propozitia: ") + ' '
s = ' ' + input("Cuvantul s: ") + ' ' 
t = ' ' + input("Cuvantul t: ") + ' '

sir = sir.replace(s,t)
sir = sir[1:-1]
print(f"Noua propozitie este:\n{sir}")