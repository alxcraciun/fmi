'''
n perechi de forma (x,y)
x < y

L = [ (12,15), (6,8), (5,7), (20,30), (9,11), (13,18) ]


(5,7), (9,11), (12,15), (20,30)

De obicei, Greedy si PD se exclud, dar
aici se poate implementa cu ambele. 

sorted(L) = [ (5,7), (6,8), (9,11), (12,15),  (13,18), (20,30) ]

~ de la dr la stanga completez ~
Lmax[i] = 1 + max(Lmax[j]) cu prop ca L[i][1] < L[j][0]

Lmax = [4, 4, 3, 2, 2, 1]       lungimea maxima 
Succ = [2, 2, 3, 5, 5, -1]      poz celui la care a fost alipit


'''

f = open('input.txt')
L = []
for linie in f:
    t = linie.split()
    L.append((int(t[0]), int(t[1])))

f.close()

L.sort(key = lambda t: t[1])

n = len(L)
Lmax = [1] * n
Succ = [-1] * n

for i in range(n-2, -1, -1):
    for j in range (i-1, n):
        if L[j][0] > L[i][1] and 1 + Lmax[j] > Lmax[i]:
            Lmax[i] = 1 + Lmax[j]
            Succ[i] = j

# pentru a gasi direct pozitia maxima
pmax = Lmax.index(max(Lmax))

print(Lmax[pmax])

while pmax != -1:
    print(L[pmax])
    pmax = Succ[pmax]


