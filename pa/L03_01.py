'''
# a)
litere = [ chr(litera) for litera in range(ord('a'), ord('z')+1) ]
print(litere)

# b)                                                                     
Lista = [x if x%2!=0 else -x for x in range(1, int(input("\nb) n = ")))]    # if-else pus inainte de for = operator ternar
print(Lista)

# c)
ListaCitire = [int(x) for x in input("c) Numere: ").split()]
Lista2 = [x for x in ListaCitire if x%2==1]
print(Lista2)

# d)
ListaCitire = [int(x) for x in input("Numere: ").split()]
Lista2 = [ListaCitire[i] for i in range(len(ListaCitire)) if i%2==1]
print(Lista2)

# e) 
ListaCitire = [int(x) for x in input("Numere: ").split()]
Lista2 = [ListaCitire[i] for i in range(len(ListaCitire)) if (ListaCitire[i]%2) == (i%2==1) ]
print(Lista2)

# f)
ListaCitire = [int(x) for x in input("Numere: ").split()]
Lista2 = [(ListaCitire[i], ListaCitire[i+1]) for i in range(len(ListaCitire)-1)]
print(Lista2)

# g)
n = int(input('n = '))
Lista2 = [ [str(f"{i} * {j} = {i*j}") for j in range(n)] for i in range(n)]
print(*Lista2, sep = '\n')

# h) 

sir = input("Sirul: ")
Lista2 = [ sir[i:] + sir[:i] for i in range(len(sir)) ]
print(Lista2)

# i) 

n = int(input('n = '))
Lista2 = [ [i for j in range(i)] for i in range(n)]
print(*Lista2, sep = '\n')

'''






