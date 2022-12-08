# Notite ASC

## Curs 10

\> Buffer Overflow Attack

Următoarele sunt 3 sunt tehnici ce au adus progres major tehnologic.

<br>

### Pipelining

- True Dependence - nu stie cat e valoarea anterioara (RAW)
- Anti-Dependence - vrei sa te asiguri ca instructiunea 2 sa fie schimbata (WAR)
- Output Dependence - vrei sa te asiguri ca se da output in ordinea corecta (WAW)

> **Machine Learning: Eager Execution** <br>
> executa secvente ulterioare, chiar daca nu are nevoie de ele

Pipelining-ul este la nivelul UNUI SINGUR CORE, nu ai cum sa stii cate lucruri va putea face in paralel.
Astfel, e actually un paralelism la nivel de instructiune si depinde si de algoritmul folosit.

Cand faci call de o functie, nu poate face pipelining.


<br>

### Branch Prediction

Cand iei un loop si-l desfaci in instructiuni. (Loop Unrolling)

Predictia
=> Guido Van Rossum about Python 3.11 "guessing the adding-type"

Pe sistemele software, aceste procese se intampla in masinile virtuale / interpretoare.

<br>

### Out of order execution
