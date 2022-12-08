# Se da un numar a de la tastatura
# Sa se afiseze toti divizorii acestuia pe ecran

.data 
a: .space 4
div: .space 4
ScanfFormat: .asciz "%ld"
fs1: .asciz "%ld %d\n"

.text
.global main


main:
movl $1, %eax
xor %ebx, %ebx
int $0x80