'''
sume = vector de lungime M initializat cu -1
daca sume[i] != -1 => inseamna ca suma i poate fi obtinuta din numerele date

for nr in sorted(numere):
	sume[nr] = numere[nr]
sume


dictionar 
    cheie = suma_calculabila
    valoare = lista cu numerele care dau acea suma

'''

file_input = open('date.in')
n = int(file_input.readline().strip())
lista = [ int(elem.strip()) for elem in file_input.readline().split() ] 
suma = int(file_input.readline().strip())



print(n)
print(lista)
print(suma)

file_input.close()