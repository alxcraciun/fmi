'''
6. Se citește un număr natural n.
a) Să se afișeze cel mai mare număr care se poate obține cu cifrele lui n
b) Să se afișeze cel mai mic număr care se poate obține cu cifrele lui n
De exemplu, pentru n = 812383 trebuie afișate numerele 883321 și 123388.

'''

n = int(input('n = '))

if n < 10:
    print(f'Minimul este: {n}\nMaximul este: {n}')
    raise SystemExit

zero_counter = 0
minim = 10
maxim = 0
lungime = 0

# Aflu cate zero-uri sunt in numar = zero_counter
# Aflu care este cea mai mica cifra (fara zero) = minim

aux = n            
while aux > 0:
    if aux % 10 == 0:
        zero_counter += 1
    elif aux % 10 < minim:
        minim = aux % 10
    aux //= 10

# Adaug cifra cea mai mica + zero-urile 
for _ in range(zero_counter):
    minim *= 10

for cf in range(1, 10):
    aux = n
    while aux > 0:
        if aux % 10 == cf:
            maxim = 10 ** lungime * cf + maxim
            if lungime != 0:                   # sa nu pun cea mai mica cifra de 2 ori in min
                minim = minim * 10 + cf
            lungime += 1
        aux //= 10

# Adaug zero-urile la finalul numarului maxim
for _ in range(zero_counter):
    maxim *= 10

print(f'Minimul este: {minim}\nMaximul este: {maxim}')
