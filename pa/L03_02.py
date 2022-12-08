''' Lambda Functions & Sort Method

L.sort(key = str)  //  L.sort(key = lambda x: str(x))
L.sort(key = lambda x: (len(str(x)), -x))

'''

'''

# a)

# b)                                                                     

# c)

# d)

# e) 

# f)

# g)

# h) 

# i) 

'''

n = int(input('n = '))
Lista2 = [ [str(f"{i} * {j} = {i*j}") for j in range(n)] for i in range(n)]
print(*Lista2, sep = '\n')


