# Similara cu problema timpilor de asteptare

''' Dictionar
O(n*zi_max + nlog2n) ~ O(n^2)

zile = {1: None, 2: None, 3: None, 4: None, 5: None}
zi_max <= n

Paradoxal, algoritmul este optim, implementarea nu este. ()
'''

''' PriorityQueue
pq =    Test2Test -> Test2Test (planificat ziua 3) 
pq =    JustDoIt, FileSeeker -> JustDoIt (planificat ziua 4)
pq =    FileSeeker, BlackFace, BestJob -> FileSeeker (planificat ziua 2)
(etc...)
'''