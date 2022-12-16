n = int(input('n = '))

n1 = int(input('n1 ='))
n2 = int(input('n2 ='))

max1 = max(n1,n2) # cel mai mare
max2 = min(n1,n2) # al doilea cel mai mare

for _ in range(3, n+1):
    n1 = int(input(f'n{_} = '))
    if n1 > max1:
        max2 = max1
        max1 = n1
    elif n1 > max2:
        max2 = n1

if max1 == max2:
    print("Imposibil")
else:
    print(max1, max2)
    