# Fisier CSV

'''
Popa Ion,151,5,3,4,0,3
Popescu Ana,152,3,4,3
Mihai Ion,151,5,5,2,4


L = [
    ("Popa Ion", 151, (5,3,2,4)), 
    ("Popescu Ana", 152, (3,4,3))...
    ]
'''

def citire_date(nume_fisier : str):
    f = open(nume_fisier)
    for line in f:
        aux = line.split(',')
        t = tuple([aux[0], aux[1], tuple(int(x) for x in aux[2:])])
    f.close()

def status_promovare(L, minim_credite):
    for index in range(len(L)):
        s = sum(L[index][2])
        if 0 not in L[index][2] and s >= minim_credite:
            L[index] += (True,)
        else:
            L[index] += (False,)

L = []

nume_fisier = input("Nume fisier: ")
minim_credite = int(input("Numar minim credite: "))

citire_date(nume_fisier)
status_promovare(L, minim_credite)
print(L)


L.sort(key = lambda t: (t[1], t[0]))                        # a)
L.sort(key = lambda t: (-t[3], t[0]))                       # b)
L.sort(key = lambda t: (-sum(t[2]), t[1], t[0]))            # c)
L.sort(key = lambda t: (t[1], -t[3], -sum(t[2]), t[0]))     # d)