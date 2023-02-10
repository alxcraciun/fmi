L1 = int(input('L1 = '))
L2 = int(input('L2 = '))

# Masurile Placii
a = L1
b = L2 
cmmdc = L1 % L2

while cmmdc!=0:
    a = b
    b = cmmdc
    cmmdc = a%b

print(f'Vom umple suprafata de {L1}x{L2}, folosind {L1*L2//(b**2)} placi cu latura de {b}cm')
