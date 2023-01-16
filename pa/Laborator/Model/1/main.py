def citire_numere(nume_fisier):
    fisier = open(nume_fisier)
    lista = [linie.split() for linie in fisier]
    for sublista in lista:
        for i in range(len(sublista)):
            sublista[i] = int(sublista[i].strip())
    fisier.close()
    return lista

def prelucrare_lista(lista):
    for sublista in lista:
        minim = min(sublista)
        aparitii_minim = sublista.count(minim)
        while aparitii_minim > 0:
            sublista.remove(minim)
            aparitii_minim -= 1
    
L = citire_numere("numere.in")
prelucrare_lista(L)

# c)
for sublista in L:
    print(*sublista)

# d)
L = citire_numere('numere.in')

fisier_output = open('cifre.out', 'w')
k = int(input('Valoarea lui k este: '))

raspuns = []

raspuns = [elem for sublista in L for elem in sublista if len(str(elem)) == k ]
raspuns = sorted(list(set(raspuns)), key = lambda x: -x)

if raspuns == []:
    fisier_output.write('Imposibil!')
else:
    for elem in raspuns:
        fisier_output.write(str(elem) + ' ')

fisier_output.close()