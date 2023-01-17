# ASC - Laboratorul 1

```
High-Level  >>  (1)  >>  Low-level  >>  (2)  >>  Fisier Obiect  >>  (3)  >>  Executabil

(1) - compilator                   

(2) - assembler             

(3) - linker
```

<br>

Petru a rula incepand de la compiler <br>
```
>>  gcc file.c
```

<br>

Pentru a rula incepand de la Assambler

``` powershell
>>  gcc file.s -o file 
>>  ./file
>>  gcc --m32 program_exit.s -o program_exit
```

<br>

**ISA Procesoare**
- CISC (x86)
- RISC (ARM)

<br>

**CISC**
- nr mare de instructiuni in **header**
- instructiunile trec mai greu prin procesor

<br>

**ARM**
- nr mic de instructiuni in **header**
- instructiunile trec mai repede prin procesor

> În curs vom lucra pe arhitectura de 32 biti, vezi [documentatia](https://cs.unibuc.ro/~crusu/asc/labs.html).

<br>

## Comenzi GDB

```
>>  gdb  --  debug
>>  gcc  --  compile

>>  b main  --  adauga breakpoint pe main
>>  run -- ruleaza programul pana ajunge la breakpoint
>>  disas main -- arata comenzile din main

>>  si 4 -- nr instructiuni sarite
>>  stepi -- trece la urmatoarea instructiune 

>>  i r  --  printeaza registri
>>  p $eax  --  printeaza un registru
>>  x/x &var  --  printeaza o variabila
>>  x/4x &var  --  printeaza urm 4 octeti 

>>  c  --  continue
>>  q  --  sa iesi din gdb
```

**Extensie care afiseaza automat registrii**<br>
[github.com/longld/peda](github.com/longld/peda)





   