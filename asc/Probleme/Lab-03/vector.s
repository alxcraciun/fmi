.data
x: .space 4
n: .space 4
a: .space 4
ok: .byte 0
vector: .space 400
read_numar: .asciz "%ld"
fsx: .asciz "Scrieti numarul x : "
fsn: .asciz "Scrieti cate numere sa aiba vectorul : "
fsv: .asciz "Scrieti numerele din vector : "
fsr: .asciz "Numerele care sunt multipli lui %d din vector sunt : "
niciunul: .asciz "Niciunul"
print: .asciz "%ld "
endline: .asciz "\n"

.text
.global main
main:

    # citire x

    pushl $fsx
    call printf
    popl %ebx

    pushl $x
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx

    # citire numar

    pushl $fsn
    call printf
    popl %ebx

    pushl $n
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx
    

xorl %ecx, %ecx
lea vector, %edi

pusha
pushl $fsv #"Scrieti numerele din vector : "
call printf
popl %ebx
popa

;# for(ecx = 0; ecx<n; ecx++)
for_citire: 
    cmp n, %ecx
    je exit_for_citire

    pusha
    pushl $a
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx
    popa

    movl a, %eax #punem numarul in a
    movl %eax, (%edi, %ecx, 4) #punem numarul a in vactor
    incl %ecx
    jmp for_citire
exit_for_citire:

;# "Numerele care sunt multipli lui %d din vector sunt : "
push x
push $fsr
call printf 
pop %ebx
pop %ebx
;#-----------

;# for(ecx = 0; ecx < n; ecx++)
xorl %ecx, %ecx
for:
    cmp n, %ecx
    je verif
    
    ;# vector[ecx] / x
    xorl %edx,%edx
    movl (%edi,%ecx,4), %eax
    movl x, %ebx
    div %ebx

exit:
pushl $endline
call printf
popl %ebx
movl $1, %eax
xorl %ebx, %ebx
int $0x80