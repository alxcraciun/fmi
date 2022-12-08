sir = input("Sirul este: ")
new_sir = sir.replace(sir[0], "")
print(f"Dupa stergerea literei '{sir[0]}', sirul obtinut este \" {new_sir} \" de lungime {len(new_sir)}")

# print("Dupa stergerea literei '{}', sirul obtinut este \"{}\" de lungime {}".format(sir[0], new_sir, len(new_sir)))