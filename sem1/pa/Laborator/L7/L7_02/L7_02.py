'''
lung[i] = lungimea maxima a unui subsir care se termina pe pozitia i
initializam lung cu n 0-uri
lung[0] =1
lung[i] = 1 + max {0, lung[j] }, i de la 1 la n-1, j de la 0 la i-1  si  sufix(cuv[j]) = prefix(cuv[i]) 

pred[i] = pozitia cuvantului anterior ales in subsirul care se termina pe pozitia i
initializam pred cu n de -1
Raspunsul:
Cautam in lung pozitia celei mai mari lungimi => pozitia i
de la i => pred[i] => pred[pred[i]] => …. pana cand pred[i] = -1

'''

fisier_input = open('date.in') 

cuvinte = [ cuv.strip() for cuv in fisier_input.read().split() ] 

lungime = [0] * len(cuvinte)
lungime[0] = 1

pred = [-1] * len(cuvinte)

for i in range(1, len(cuvinte)):
    maxi = 0
    for j in range(0, i):
        if cuvinte[j][-2:] == cuvinte[i][0:2]:
            if lungime[j] > maxi:
                maxi = max(maxi,  lungime[j])
                pred[i] = j
    lungime[i] = 1 + maxi


print(lungime)

poz_max = lungime.index(max(lungime))

rez = [cuvinte[poz_max]]

while pred[poz_max] != -1:
    poz_max = pred[poz_max]
    rez.append(cuvinte[poz_max])

rez.reverse()

fisier_output = open('date.out', 'w')
rez = ' '.join(rez)
fisier_output.write(rez)
fisier_output.close()


