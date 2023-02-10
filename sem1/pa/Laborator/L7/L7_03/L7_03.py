'''
M[i][j] = lungimea subsirului comun maximal dintre 
	prefixul de lungime i al lui s
	si prefixul de lungime j al lui t

daca i = 0 sau j = 0 => M[i][j] = 0
altfel (pentru i intre 1 si len(s) si pentru j intre 1 si len(t))
	daca s[i] == t[j] => M[i][j] = 1+M[i-1][j-1]
altfel (s[i] != t[j]):
	M[i][j] = max{ M[i-1][j], M[i][j-1]}

lungime subsir maxim dintre s si t => M[len(s)][len(t)]
'''

s = input('Primul cuvant: ')
t = input('Al doilea cuvant: ')

n = len(s) + 1
m = len(t) + 1

matrix = [[0] * m for _ in range(n)]


# Am bordat matricea st + sus ca ca sa nu-mi iasa la linia 28

for i in range(1, n):
    for j in range(1, m):
        if s[i-1] == t[j-1]:
            matrix[i][j] = 1 + matrix[i-1][j-1]
        else:
            matrix[i][j] = max(matrix[i-1][j], matrix[i][j-1])

for linie in matrix:
    print(*linie)

raspuns = []

i = n-1
j = m-1

while matrix[i][j] != 0:
    if s[i-1] == t[j-1]:
        raspuns.append(s[i-1])
        i -= 1
        j -= 1
    elif matrix[i-1][j] == matrix[i][j]:
        i -= 1
    elif matrix[i][j-1] == matrix[i][j]:
        j -= 1

print(raspuns)

raspuns.reverse()
raspuns = "".join(raspuns)
print(raspuns)