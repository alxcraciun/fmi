"""  Proprietati ^

v^v = 0
v^0 = v
comutativa
asociativa
element neutru = 0

"""

y = 0
n = int(input('n='))

for _ in range(n):
    x = int(input('x='))
    y = x ^ y

print(y)
