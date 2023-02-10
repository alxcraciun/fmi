t = input("Subsirul t: ")
s = input("Sirul s: ")
p = s.find(t)
if p >= 0:
    while p>=0:
        print(p, end = " ")
        p = s.find(t, p+len(t))
        # in loc de p+len(t) pune p+1 si obtii aparitii suprapuse
else:
    print("Nu exista")