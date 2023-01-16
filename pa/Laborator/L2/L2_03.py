sir = input('Sirul de maxim 10 caractere este: ')

# cate cuvinte vor aparea
pasi = len(sir) // 2 

for i in range(pasi+1):
    print(sir[i:len(sir)-i].center(10," "))