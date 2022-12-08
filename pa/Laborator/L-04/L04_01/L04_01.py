# dictionar.keys()
# dictionar.values()
# dictionar.items()

# ! Ai grija calea sa fie direct pe folderul L04_01 cand dai run

# a)
def creare_dictionar(*nume_fisiere):
    dictionar = {}
    for nume in nume_fisiere:
        fisier = open(nume)
        cuvinte = fisier.read().split()
        fisier.close()

        for cuv in cuvinte:
            if cuv not in dictionar:
                dictionar[cuv] = 1
            else:
                dictionar[cuv] += 1
    return dictionar


D = creare_dictionar('cuvinte1.in', 'cuvinte2.in')
print(D)

# b)
print(*sorted(D.keys()))

# c)
D2 = creare_dictionar('cuvinte1.in')
print(sorted(D2.items(), key=lambda x: -x[1]))

# d)
D3 = creare_dictionar('cuvinte2.in')
print(min(D3.items(), key=lambda x: -x[1])[0])

# e)
D41 = creare_dictionar('cuvinte1.in')
D42 = creare_dictionar('cuvinte2.in')

print(D41)
print(D42)

epsilon1 = sum([D41.get(cuv, 0) * D42.get(cuv,0) for cuv in set(D41.keys()) | set(D42.keys())])
epsilon2 = sum([(v1**2) for v1 in D41.values()])
epsilon3 = sum([(v2**2) for v2 in D42.values()])
dcos = epsilon1 / (epsilon2**0.5 * epsilon3**0.5)

print(dcos)