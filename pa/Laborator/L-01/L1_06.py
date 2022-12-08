'''
6. Se citește un număr natural n.
a) Să se afișeze cel mai mare număr care se poate obține cu cifrele lui n
b) Să se afișeze cel mai mic număr care se poate obține cu cifrele lui n
De exemplu, pentru nn = 812383 trebuie afișate numerele 883321 și 123388.

'''

''' Varianta cu siruri de caractere

n = input('n = ')

if int(n) > 10:
    maxim = ''.join(sorted(n, reverse = True)) 
    minim = maxim[::-1].lstrip('0')                                       # daca zero-urile pot fi puse primele merge asta
    print(f'Cel mai mic numar: {minim} \nCel mai mare numar: {maxim}')
else: 
    print('Cel mai mic numar: {n} \nCel mai mare numar: {n}')

'''

n = int(input('n = '))

if n < 10:
    print(f'Minimul este: {n}\nMaximul este: {n}')
    raise SystemExit

zero_counter = 0
minim = 10    # il folosesc initial sa calculez cifra minima
maxim = 0
maxim_len = 0

aux = n             # numar cate 0-uri sunt in numar
while aux > 0:
    if aux % 10 == 0:
        zero_counter += 1
    elif aux % 10 < minim:
        minim = aux % 10
    aux //= 10

for _ in range(zero_counter):
    minim *= 10

for cf in range(1, 10):
    aux = n
    while aux > 0:
        if aux % 10 == cf:
            maxim = 10**maxim_len * cf + maxim
            if maxim_len != 0:                   # sa nu pun cea mai mica cifra de 2 ori in min
                minim = minim * 10 + cf
            maxim_len += 1
        aux //= 10

for _ in range(zero_counter):
    maxim *= 10

print(f'Minimul este: {minim}\nMaximul este: {maxim}')
