sir = input("Propozitia: ")
sir_gresit = input("Greseala: ")
sir_corect = input("Corectura: ")

sir_a = sir
sir_b = sir

# a) 
sir_a = sir_a.replace(sir_gresit, sir_corect)
print(f"Noul sir este -- {sir_a}")

# b)

sir_b = sir_b.replace(sir_gresit, sir_corect, 2)
print(f"Noul sir dupa doar 2 modificari este -- {sir_b}")

if sir.count(sir_gresit) > 2:
    print("textul contine prea multe greseli, doar 2 au fost corectate")
