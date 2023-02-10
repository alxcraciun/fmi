''' O(m*n) maxim n^2 - Numararea directa a fiecarui candidat distinct

L = [1,2,1,1,1,3,3,1]

for x in set(L):    
    L.count(x)
'''

''' O(nlogn) ~ O(nlogn) - Sortare lista, merg pe elem din mijloc si dau count pe el

L.sort() => [1,1,1,1,2,3,3]
L.count( L[len(L)/2] )

'''

''' O(n+m) - Cu dictionare
dict = { candidat: nr_voturi }
'''

''' O(n) si nu foloseste memorie multa - Algoritmul Boyer-Moore (1981)

candidat_majoritar, avantaj = 0
for vot in L:
    if avantaj == 0:
        candidat_majoritar = vot


'''

