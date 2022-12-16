sir = input("Propozitia: ")
sir_a = sir
sir_b = sir
sir_gresit = input("Greseala: ")
sir_corect = input("Corectura: ")

# a) 
sir_a = sir_a.replace(sir_gresit, sir_corect)
print(f"Noul sir este -- {sir_a}\n")

# b)
sir_b = sir_b.replace(sir_gresit, sir_corect, 2)
print(f"Noul sir dupa doar 2 modificari este -- {sir_b}")
