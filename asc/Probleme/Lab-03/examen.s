.data
    n: .space 4
    k: .space 4
    a: .space 4

    vector: .space 400
    fsk: .asciz "Scrieti numarul k : "
    fsn: .asciz "Scrieti cate numere sa aiba vectorul : "
    fsv: .asciz "Scrieti numerele din vector : "
    read_numar: .asciz "%ld"

    afisare_bool: .space 4
    afisare1: .asciz "Elementele vectorului sunt distincte 2 cate 2\n"
    afisare2: .asciz "Elementele vectorului nu sunt distincte 2 cate 2, primul dublat este %ld\n"

    primul_dublat: .space 4
.text
.global main
main:

    # citire n

    pushl $fsn
    call printf
    popl %ebx

    pushl $n
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx

    # citire k

    pushl $fsk
    call printf
    popl %ebx

    pushl $k
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx
    
# citire vector

xorl %ecx, %ecx
lea vector, %edi

pusha
pushl $fsv #"Scrieti numerele din vector : "
call printf
popl %ebx
popa

# for(ecx = 0; ecx < n; ecx++)
for_citire: 
    cmp n, %ecx
    je exit_citire

    pusha
    pushl $a
    pushl $read_numar
    call scanf
    popl %ebx
    popl %ebx
    popa

    movl a, %eax #punem numarul a in %eax
    movl %eax, (%edi, %ecx, 4) #punem numarul a in vector

    incl %ecx
    jmp for_citire

exit_citire:

// xorl %ecx, %ecx
// xorl %ebx, %ebx
// # for(ecx = 0; ecx < n; ecx++)

// cmp n, %ecx
// je alegere_afisare


// # Aleg tipul de afisare



alegere_afisare:

    cmp $1, $afisare_bool
    je exit_afisare1

    cmp $2, $afisare_bool
    je exit_afisare2


exit_afisare1:
    pushl $afisare1
    call printf
    popl %ebx
    jmp exit

exit_afisare2:
    pushl $primul_dublat
    pushl $afisare2
    call printf
    popl %ebx
    popl %ebx
    jmp

exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80