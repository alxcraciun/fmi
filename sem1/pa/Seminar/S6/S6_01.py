''' 
n = 8
L = (10, 17, 7, 10, 5, 21, 8, 37)  =>  (5, 7, 8, 10, 10, 17, 21, 37)
D = 6

Date Intrare:
6 
10 17 7 10 5 21 8 37

Teorema:    
    In orice sol optima, fie cuplam L[0] cu L[1], fie L[0] nu se utilizeaza.

Demonstratie Greedy:
    a) L[0] nu se cupleaza cu L[1] => L[0] nu se cupleaza cu nicio valoare L[i], i >= 2
       => L[0] nu se utilizeaza. 

    b) L[0] se cupleaza cu L[1] 

    1) Sol optima contine (L[0], L[1]) => OK, se reia inductiv

    2) Sol optima nu contine (L[0], L[1])

    2.1) 
        sol optima contine (L[0], L[k]) cu k >= 2 si arat ca 
        pot inlocui (L[0], L[k]) cu perechea cu (L[0], L[1])

        L[k] - L[0] <= D
        L[1] <= L[k]  | - L[0]
        L[1] - L[0] <= L[k] - L[0] <= D     =>  pot forma perechea (L[0], L[1])

    2.2) 
        sol optima contine (L[0], L[p]) si (L[1], L[q]) cu p,q >= 2 si p < q
        si arat ca pot inlocui cele 2 perechi cu (L[0], L[1]) si (L[p], L[q])

        Pentru (L[0], L[1]) folosesc demonstratia de la 2.1)

        L[p] - L[0] <= D    =>  L[p] <= L[0] + D
        L[q] - L[1] <= D    =>  L[q] <= L[1] + D

        --------------------------------------- (scadere)

        L[q] - L[p] <= L[1] - L[0] <= D     => Se poate forma (L[p], L[q])
'''

# Complexitate O(nlogn)

D = float(input("Distanta maxima: "))
Lista = [float(x) for x in input("Elementele listei: ").split()]
Lista = [tuple([i+1, x]) for i, x in enumerate(Lista)]              # Lista = [(x+1, Lista[x]) for x in range(len(Lista))]

Lista.sort(key = lambda t: t[1])

Sol = []
index = 0

while index < len(Lista) - 1:
    if Lista[index+1][1] - Lista[index][1] <= D:
        Sol.append((Lista[index][0], Lista[index+1][0]))
        index += 2
    else:
        index += 1

print(Sol)