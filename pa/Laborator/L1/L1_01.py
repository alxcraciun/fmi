n = int(input("n = "))
aux = n
rev_n = 0
cf = 0

while aux > 0:
    rev_n = rev_n * 10 + aux%10
    aux//=10

if n == rev_n:
    print("Numarul este palindrom")
else:
    print("Numarul nu este palindrom")