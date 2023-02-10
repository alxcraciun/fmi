'''
def bkt(k):
    global s, p, nr
    for v in range(1, p):
        s[k] = v
        if p % s[k] == 0 and s[k] >= max(s[:k+1]):
            if sum(s[:k+1]) == p:
                print(*s[:k+1], sep = '+')
                nr += 1
            elif k < p-1:
                bkt(k+1)
                    
p = 6
s = [0] * p
bkt(0)
'''

'''
def bkt(k):
    global s, p, nr
    for v in range(1, p):
        s[k] = v
        if p % s[k] == 0 and s[k] >= max(s[:k+1]):
            if sum(s[:k+1]) == p and len(set(s[:k+1])) == 2:
                print(*s[:k+1], sep = '+')
                nr += 1
            elif k < p-1:
                bkt(k+1)
'''

def bkt(k):
    global s, p, nr
    for v in range(1, p):
        s[k] = v
        if p % s[k] == 0 and s[k] >= max(s):
            if sum(s) == p:
                print(*s[:k+1], sep = '+')
                nr += 1
            elif k < p-1:
                bkt(k+1)
                s[k+1] = 0
                    
nr = 0               
p = 6
s = [0] * p
bkt(0)

print('Nr. modalitati: ' + str(nr))
