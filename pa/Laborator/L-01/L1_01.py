n = int(input("n = "))
aux = n
revn = 0
cf = 0

while aux > 0:
    cf += 1
    aux//=10

aux = n

for _ in range(cf):
    revn = revn*10 + aux%10
    aux//=10

print(revn)