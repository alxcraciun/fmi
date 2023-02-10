def bkt(k):
    global s, n

    for v in range(1, n+1):
        s[k] = v
        if s[k] not in s[:k]:
            if k == n:
                print(*s[1:], sep = ',')
            else:
                bkt(k+1)

n = int(input('n= '))
s = [0] * (n+1)

print('Toate permutarile de lungime ' + str(n) + ': ')
bkt(1)