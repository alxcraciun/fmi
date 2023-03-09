'''
Se dă n, un număr întreg și v, un vector de numere întregi. 
Să se verifice daca vectorul conține doua numere care însumate sa dea n și să le afișeze. 
(Se presupune că vectorul v și variabila n sunt deja citite și stocate corespunzător). Solutia se poate scrie în orice limbaj de programare.
'''

n = int(input('n = '))
v = [0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 5]

v.sort()

i = 0
j = len(v)-1
while i < j:
    if v[i] + v[j] == n:
        if v[i] == v[j]:
            for _ in range((j-i+1)*(j-i)//2):
                print(f"({v[i]}, {v[j]})")
            break
        else:
            equal_i = 1
            equal_j = 1
            while v[i] == v[i+1]:
                i += 1
                equal_i += 1
            while v[j] == v[j-1]:
                j -= 1
                equal_j += 1
            for _ in range(equal_i * equal_j):
                print(f"({v[i]}, {v[j]})")
        i += 1
        j -= 1
    elif v[i] + v[j] < n:
        i += 1
    else:
        j -= 1