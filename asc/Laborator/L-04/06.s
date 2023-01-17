# Pagina 14

.data
x: .space 4                     # nu stim momentan valoarea citita, dar stim cat ocupa
formatString: .asciz "%ld"
.text
.global main

main:

citire:
pusha
pushl $x        # incarcam in stiva NU x, ci ADRESA lui x, ($x)
pushl $formatString
call scanf
popl %ebx
popl %ebx
popa

restul:
movl $1, %eax
xorl %ebx, %ebx
int $0x80
