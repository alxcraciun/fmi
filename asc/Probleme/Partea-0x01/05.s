# Pagina 12

.data
x: .long 23
formatString: .asciz "Numarul de afisat este: %ld\n"  # Adaugi un '\n' din cauza bufferului
.text
.global main
main:

pushl x                 # incarcam argumentele in ordinea inversa limbajului C
pushl $formatString     # Formatul sirului nu se da ca valoare, ci ca adresa in memorie ($)

call printf             # printf("Numarul de afisat este: %ld", x)

popl %ebx               # pentru fiecare push facut
popl %ebx               # facem un pop,  alegand un registru pe care nu-l utilizam

# Daca nu vrei sa pui \n la finalul stringului faci asa:

# pushl $0      -> incarci NULL pe stiva
# call fflush   -> Apelezi fflush
# popl %ebx     -> Golesti $0 de pe stiva

movl $1, %eax
xorl %ebx, %ebx
int $0x80