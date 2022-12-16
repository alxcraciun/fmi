''' V1
Sa aiba acelasi numar de litere
Pot sa verific fiecare litera cu un s.count()
'''

# V2: Sortam sirurile si verificam daca sunt egale

# V3: Cu vectori de frecventa sau dictionare

''' V4
Iau fiecare litera din unul si o sterg din al doilea
daca ambele siruri sunt vide => sunt anagrame
'''

''' Obs: in oricare din functii dr poate adauga la inceput instructinea

if len(s) != len(t):  # complexitate O(1)
    return False
'''


def anagrameV1(s,t):        #   O(n*d) ~= O(n)
    if len(s) != len(t):
        return False
    for c in set(s):                  #  0 <= d <= 65.536  // Daca in loc de set(s) foloseam s aveam O(n^2)
        if s.count(c) != t.count(c):
            return False
    return True


def anagrameV2(s,t):    
    return sorted(s) == sorted(t)   # complexitate O(nlog2n)


def anagrameV3(s, t):   # O(m), unde m = max(len(s), len(t), 26)
    dict_s = {chr(i):0 for i in range(ord('a'), ord('z') + 1)}
    dict_t = {chr(i):0 for i in range(ord('a'), ord('z') + 1)}
    for c in s:
        dict_s[c] += 1
    for c in t:
        dict_t[c] += 1
    return dict_s == dict_t


def anagrameV4(s,t):          # O(n^2)
    if len(s) == len(t):
        return False
    for caracter in s:
        p = t.find(caracter)
        if p != -1:
            t = t[:p]+t[p+1:]
        else:
            return False
    return True


def anagrameV5(s, t):  # O(d*n)
    ds = dt = {}
    for c in s:
        if c in ds:    # In Python NU verifici niciodata daca c e printre key =>> O(26) = O(d)
            ds[c] += 1
        else:
            ds[c] = 1
    for c in t:
        if c in dt:
            dt[c] += 1
        else:
            dt[c] = 1

def anagrameV6(s, t):  
    ds = {x:s.count(x) for x in s}  # daca ii pun set(s) se face O(d*n)
    dt = {x:t.count(x) for x in t}  # O(n^2) FOARTE INEFICIENT DE LA COUNT