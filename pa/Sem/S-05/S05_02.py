''' O(n^2) - Algoritmul Naiv

for i in range(n-1):
    for j in range(i+1, n):         # Cautare liniară a valorii S - L[i] în L[i+1:]
        if L[i] + L[j]:
            print(L[i], L[j])  
'''


''' O(nlog2n) - Algoritmul optimizat cautare binara pereche

# Lista fiind sortata, pot folosi o cautare binara

for i in range(n-1):
    for j in range(i+1, n):         # Cautare binara a valorii S - L[i] în L[i+1:]
        if L[i] + L[j]:
            print(L[i], L[j])  
'''


''' O(n) - Algoritmul cautare folosind set

# Lista fiind sortata, pot folosi o cautare binara

for i in range(n-1):
    for j in range(i+1, n):         # Cautare folosind un set/dictionar a valorii S - L[i] în L[i+1:]
        if L[i] + L[j]:
            print(L[i], L[j])  

Extra optimizari: 
- caut pana in jumatate
- caut nr care sunt direct > S

'''


''' Metoda two pointers

L = [2,5,7,8,10,12,15,17,25]

S = 17 

L[i] + L[j] = 27 (prea mare)        # atunci mut j la stanga

L[i] + L[j-1] = 19 (prea mic)       # atunci mut i la dreapta

L[i+1] + L[j-2] = 22 (prea mare)    # atunci mut j la stanga

L[i+1] + L[j-3] = 20 (perfect)    # atunci afisez si le mut pe ambele

...

( ai grija la mijloc cand se intalnesc sa nu fie L[i] == L[j] solutie )

'''
