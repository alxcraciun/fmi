L1 = int(input('L1 = '))
L2 = int(input('L2 = '))

a = L1
b = L2 # lungimea placii
cmmdc = L1 % L2

while cmmdc!=0:
    # print(a,b,cmmdc)
    a = b
    b = cmmdc
    cmmdc = a%b

print(f'Folosind {L1*L2//(b**2)} de lungimea {b} vom umple suprafata de {L1}x{L2}')
