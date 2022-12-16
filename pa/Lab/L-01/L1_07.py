'''
7. Un greiere se deplasează efectuând câte o săritură, lungimea inițială a săriturii fiind de x cm.

După fiecare n sărituri, lungimea săriturii greierului se micșorează cu p procente. Cunoscându-
se valorile x, n, p, precum și numărul de sărituri m pe care le face greierele, să se scrie un 
program care să afișeze distanța parcursă de greiere. 

De exemplu, pentru x = 20, n = 10, p = 10 și m = 20 
distanța parcursă de greiere este egală cu 380 cm, deoarece primele 10 sărituri
efectuate au, fiecare, lungimea de 20 cm, iar următoarele 10 au, fiecare, lungimea de 18 cm.
'''

x = int(input('x = '))  # Distanta initiala va fi x*n
n = int(input('n = '))
p = int(input('p = '))  # Apoi sare cu p% mai putin decat x, de inca (m-n) ori.
m = int(input('m = '))
print(f'Greierele a parcurs {x*n + (x*(100-p)/100)*(m-p)} cm')




