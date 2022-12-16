'''
Solutia directa ar fi cu backtracking si ar avea complexitate 2**n

Ne dam seama ca fiecare element apare de un numar par de ori.

Dar, avem grija la cazul in care este doar 1 element.

'''

n = int(input('n='))
for _ in range(n):
    x = input('x=')
