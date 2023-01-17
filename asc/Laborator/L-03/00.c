#include <stdio.h>
#include <string.h>

long nota;
int grupa;
char nume[100];  // char &nume

int main()
{
    // pusha  = push all registers

    scanf("%ld", &nota);
    scanf("%d\n", &grupa);
    gets(nume)   //  fgets(nume, 100, stdin);
    
    // popa = push all registers

    printf("Studentul %s din grupa %d a obtinut nota %ld\n", nume, grupa, nota);

    return 0;
}