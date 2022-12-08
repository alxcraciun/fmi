# Gandeste-te ca pot aparea probleme in transmiterea de date
'''
        n   100010010000
      n-1   100010001111
  n&(n-1)   100010000000

'''

import math

k = 0
n = int(input('n='))

if n != 0:
    k += 1
    n = n & (n-1)
print(k)
