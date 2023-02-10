n = int(input("Zile: "))
x = float(input(f"Cursul din ziua 1 este: "))

maxim = 0
ziua_maxim = 1

for ziua in range(2, n+1):
    y = float(input(f"Cursul din ziua {ziua} este: "))
    if (y-x) > maxim:
        maxim = y - x
        ziua_maxim = ziua - 1
    x = y

print(f'Cresterea cea mai mare a fost de {round(maxim, 2)} intre zilele {ziua_maxim} și {ziua_maxim+1}')