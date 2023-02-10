'''
10:00-11:20 
09:30-12:10 
08:20-09:50 
11:30-14:00 
12:10-13:10 
11:15-13:15 
15:00-15:30

Numar minim de sali: 3

Sala 1:
11:15-13:15 Spectacol 6

Sala 2:
08:20-09:50 Spectacol 3
10:00-11:20 Spectacol 1
11:30-14:00 Spectacol 4

Sala 3:
09:30-12:10 Spectacol 2
12:10-13:10 Spectacol 5
15:00-15:30 Spectacol 7

'''


import queue

def cheieOraInceput(sp):
    return sp[1]


fin = open("spectacole.txt")

lsp = []
crt = 1

for linie in fin:
    aux = linie.split("-")
    lsp.append((crt, aux[0].strip(), aux[1].strip()))
    crt = crt + 1

fin.close()

lsp.sort(key=cheieOraInceput)

sali = queue.PriorityQueue()
sali.put((lsp[0][2], list((lsp[0],))))

for k in range(1, len(lsp)):
    min_timp_final = sali.get()

    if lsp[k][1] >= min_timp_final[0]:
        min_timp_final[1].append(lsp[k])
        sali.put((lsp[k][2], min_timp_final[1]))

    else:
        sali.put(min_timp_final)
        sali.put((lsp[k][2], list((lsp[k],))))

fout = open("programare.txt", "w")
fout.write("Numar minim de sali: " + str(sali.qsize()) + "\n")

scrt = 1

while not sali.empty():
    sala = sali.get()
    fout.write("\nSala " + str(scrt) + ":\n")
    for sp in sala[1]:
        fout.write("\t"+sp[1]+"-"+sp[2]+" Spectacol " + str(sp[0]) + "\n")
    scrt += 1

fout.close()
