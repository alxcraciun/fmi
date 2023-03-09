#include <iostream>
#include "Facultate.h"

int main()
{



    return 0;
}

/*

:: - operator de rezolutie
& - operator de referinta (adresa)
* - operator de dereferentiere (pointer)
: - lista de initializare  // exact la fel ca nume = other.nume

lista de initializare nu merge decat pentru constructori
this.var e varul declarat in functie (this.var = otherVar)

l-value = r-value

r-value -> care este const si nu se poate modifica
l-value -> care nu este const (se poate modifica)

const int a = 5
- exact pe linia anterioara a este l-value
- dupa, acesta a va deveni r-value


class A
{
    this  ->  pointeaza catre adresa clasei mele A
}

facultate2 = facultate1  //  facultate2.operator=(fac1)

const ....... const
{ 
    nume = "DA"     // al doilea const nu ma lasa sa fac asta


    return nume     // primul const are grija ca ce returnez sa fie const
}

*/

/*
    .cpp  ->  se compileaza 
    .h  ->  declararea claselor

    <iostream>  ->  librarie deja implementata
    #include "Facult.h" (header files)

    in general numele ar trebui sa fie la fel cu numele clasei

    Facult::Facult()

*/