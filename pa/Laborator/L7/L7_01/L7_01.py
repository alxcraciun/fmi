'''
v[i] = suma maxima a unei subsecvente care se termina pe pozitia i
lung[i] = lungime maxima a unei subsecvente care se termina pe pozitia i

n = lungime sir dat
Initializam v cu n valori de 0
v[i] = max {nr[i], v[i-1]+nr[i]}

Raspunsul:
Cautam in v pozitia celei mai mari sume => pozitia i
De la i catre stanga, cat timp suma_curenta > nr[i], inseamna ca nr[i] face parte din rezultat, fac suma_curenta -= nr[i]

L = [ 1 -2 3 -1 5 2 -6 1 3 ] 
Sum = [1, -1, 4, 3, 5, 7, -1, 8, 11]

'''

def raspuns(lista_init: list, lista_fin: list, i: int):
    if lista_init[i] == lista_fin[i]:
        yield lista_init[i]
    else:
        yield raspuns(lista_init, lista_fin, i-1)

fisier = open('date.in')
L = [ int(elem) for elem in fisier.read().split()]

Sum = [0] * len(L)

marime = len(L)

Sum[0] = L[0]
for i in range(1, marime):
    Sum[i] = max(L[i], L[i] + Sum[i-1])

# generator = raspuns(L, Sum, Sum.index(max(Sum)))

# while not generator:
#     print(generator.next())

fisier.close()


'''
# Coding Rooms
    
f=open("date.in")

Lnr=[int(x) for x in f.read().split()]
print(Lnr)

f.close()

v=[0]*len(Lnr)

v[0]=Lnr[0]

for i in range(1,len(Lnr)):
    v[i]=max(Lnr[i], v[i-1]+Lnr[i])

print(v)

poz=v.index(max(v))
print(poz)

suma_curenta=v[poz]

rez=[]

while suma_curenta > 0:
    rez.append(Lnr[poz])
    suma_curenta-=Lnr[poz]
    poz-=1

rez.reverse()
print(rez)   

g=open("date.out", "w")

rezultat=" ".join(str(x) for x in rez)

g.write(rezultat)
'''