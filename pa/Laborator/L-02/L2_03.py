sir = input('Sirul de maxim 10 caractere este: ')
pasi = len(sir) // 2 # cate cuvinte vor aparea
for i in range(pasi+1):
    print(sir[i:len(sir)-i].center(10,"."))