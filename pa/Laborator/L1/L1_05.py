from math import sqrt

a = int(input('a = '))
b = int(input('b = '))
c = int(input('c = '))

delta = b**2 - 4*a*c

if delta > 0: 
    x1 = (-b + sqrt(delta)) / (2*a)
    x2 = (-b - sqrt(delta)) / (2*a)
    print(f"Ecuatia {a}x^2 + {b}x + {c} are 2 solutii (delta = {delta}) \nx1 = {x1} \nx2 = {x2}")

elif delta == 0:
    x1 = -b / (2*a)
    print(f"Ecuatia {a}x^2 + {b}x + {c} are o solutie (delta = {delta}) \nx1 = x2 = {x1}")

else:
    print(f"Ecuatia {a}x^2 + {b}x + {c} nu are nicio solutie (delta = {delta})")