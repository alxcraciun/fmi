sir = ' ' + input("Propozitia: ") + ' '
s = ' ' + input("Cuvantul s: ") + ' ' 
t = ' ' + input("Cuvantul t: ") + ' '

print(sir, s, t)

sir = sir.replace(s,t)
sir = sir.strip()
print(f"Noua propozitie este: {sir}")