''' V1

k = 0
n = int(input())

while n % 2 == 0:
    n = n//2
    k += 1

if n == 1:
    print(k)
else:
    print("NU")

'''

''' V2

# Mai rapida, deoarece operatiile pe bit sunt mai rapide

n = int(input('n='))
k = 0

while n&1==0:   # merge fara paranteze datorita prioritatii operatorilor
    n = n>>1
    k+=1
    if n == 1:
        print(k)
    else:
        print('Nu')

'''

''' V3

import math
n = int(input())
if n & (n-1) == 0:   # anuleaza cel mai din dreapta bit = 1
    k = int(math.log2(n))
    print(f"{n} = 2**{k}")
else:
    print(n)
    
'''