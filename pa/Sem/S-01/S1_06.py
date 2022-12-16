'''
    n        1101111000110111001
  n << 1    11011110001101110010
n & (n<<1)  01001110000100110000

Repetam operatia pana ajungem la n 

'''

n = int(input('n='))
k = 0

while n!=0:
    n = n & (n<<1)
    k+=1

print(k)

