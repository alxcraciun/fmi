import copy

def memorarea_datelor(nume_fisier):
    fisier = open(nume_fisier)
    lista_info = [line.split('%') for line in fisier]

    programul = {}

    for info in lista_info:
        cinema = info[0].strip()
        film = info[1].strip()
        lista_ore = [ora.strip() for ora in info[2].strip().split()]

        # if you do it directly it throws KeyError
        if programul.get(cinema) == None:
            programul[cinema] = {}
            programul[cinema][film] = lista_ore
        else:
            programul[cinema][film] = lista_ore

    fisier.close()
    return programul


def sterge_ore(structura, cinema, film, ore):
    for elem in ore:
        structura[cinema][film].remove(elem)
        if structura[cinema][film] == []:
            structura[cinema].pop(film)
    return list(structura[cinema].keys())


def cinema_film(structura, *lista_cinema, ora_minima = '00:00', ora_maxima = '23:59'):
    variante = []
    structura_aux = copy.deepcopy(structura)

    for cinema in lista_cinema:
        for film in structura_aux[cinema]:
            i = 0 
            while i < len(structura_aux[cinema][film]):
                ora = structura_aux[cinema][film][i]
                if not(ora_minima <= ora and ora <= ora_maxima):
                    structura_aux[cinema][film].pop(i)
                else:
                    i += 1
            if structura_aux[cinema][film] != []:
                variante.append(tuple([film, cinema, structura_aux[cinema][film]]))

    variante.sort(key = lambda x: (x[0], -len(x[2])))
    return variante


# a)
programul = memorarea_datelor('cinema.in')

# b)

'''
o = []
f = input('Nume film: ')
c = input('Nume cinematograf: ')
o.append(input('Ora in format <hh:mm> : '))

print(sterge_ore(programul, c, f, o))
print(programul)
'''

# c)
print(cinema_film(programul, 'Cinema 1', 'Cinema 2', ora_minima = '14:00', ora_maxima = '22:00'))