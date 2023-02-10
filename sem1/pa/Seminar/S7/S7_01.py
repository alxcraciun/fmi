'''
lsb = [0, 0, 0, 1, 1, 1, 1, 1, 1]

poz = 3     # pozitia primului 1

Pp ca lista are si 0 si 1 

Nu se recomanda sa se inlocuiasca indicii cu slice-uri:
    ocupa memorie
    crearea slice-ului NU este O(1) este O(lungime_lista)


Problema extra:

lsb = [1, 5, 5, 5, 8, 8, 8, 21, 37, 37]

de cate ori apare elementul k in lista?

k = 8
nr = 3 (ori)

'''

def func(lsb : list, st: int, dr: int):
    def helper(lsb: list):
        if lsb[-1] == 0:
            return -1
        elif lsb[0] == 1:
            return 0
        else:
            return func(lsb, 0, len(lsb)-1)

    mij = (st+dr) // 2
    if lsb[mij] == 1:
        if lsb[mij-1] == 0:
            return mij
        else:
            return func(lsb, st, mij-1)
    else:
        if lsb[mij-1] == 1:
            return mij +1
        else:
            return func(lsb, mij+1, dr)