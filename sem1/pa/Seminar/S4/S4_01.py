''' Forma Matricei
1 
2 15 
3 10 15 
4 3 2 1

Linia 0: [1]
Linia 1: [2, 0]
.
.
.
Linia k: [k+1, 0, ..., 0]
'''

def matrice(n):
    M = [ [k+1] + [0] * k for k in range(n-1) ] + [ [k for k in range(n, 0, -1)] ]
    for i in range(n-2, 0, -1):
        for j in range(0, i+1):     # diagonala principala
            M[i][j] = M[i+1][j] + M[i][j-1] + M[i+1][j-1]  # jos - stanga - diagonala
    return M

def afisare(M):
    lmax = max([max(lin) for lin in M])
    nrc = len(str(lmax))
    for lin in M: 
        for elem in lin:
            print(str(elem).rjust(nrc), end = ' ')
        print()

M = matrice(4)
print(M)
