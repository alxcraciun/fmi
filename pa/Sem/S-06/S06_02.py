'''
L = [30, 20, 10, 25]      
L = [50, 10, 25]        ->      50
L = [60, 25]            ->      60
L = [85]                ->      85
---------------------------------------
Totalul este:                   195
'''

# (prioritate, valoare)

from queue import PriorityQueue

''' 
Priority Queue (coada cu prioritati)
= permite operatiile de inserare a unei valori si extragerea unei valori cu prioritate minima in O(nlogn)

PriorityQueue NU sunt iterabile, sunt implementate cu arbori tip heap

PriorityQueue.put(tuplu)
PriorityQueue.get()
PriorityQueue.qsize() -> nr de elemente  

Daca elementele sunt sortate crescator/descrescator, degenereaza in O(n^2)
'''

Lista = [int(x) for x in input('Dati lungimile sirurilor: ').split()]

pq = PriorityQueue()

for elem in Lista:
    pq.put(elem)

total = 0

while pq.qsize() > 1:   # ramane un singur sir
    a = pq.get()
    b = pq.get()
    c = a + b
    total += c 
    pq.put(c)

print(total)