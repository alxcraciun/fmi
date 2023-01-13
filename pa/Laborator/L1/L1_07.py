# Distanta initiala va fi x*n
# Apoi sare cu p% mai putin decat x, de inca (m-n) ori.

x = int(input('x = '))  
n = int(input('n = '))
p = int(input('p = '))  
m = int(input('m = '))
print(f'Greierele a parcurs {x*n + (x*(100-p)/100)*(m-p)} cm')




