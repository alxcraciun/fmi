.data   # doar valorile din main
    n1: .long 5
    n2: .long 6
    k: .long 3
    fs1: .asciz "%ld\n"        # constantele sunt in raw-data

.text
rest:
    pushl %ebp
    mov %esp, %ebp

    pushl %ebx      # deoarece salvam registrul calee-saved

    mov 8(%ebp), %eax       # primul argument mereu e la 8 
    mov 12(%ebp), %ebx      # al doilea argument e mereu la 12

    mov $0, %edx
    div %ebx

    # edx = restul // eax = catul => vrem ca returnarea sa se faca prin eax

    mov %edx, %eax

    popl %ebp
    ret

proc:
    push %ebp
    mov %esp, %ebp
    
    subl $4, %esp       # declaram spatiul in memorie pentru 'long x'

    mov 8(%ebp), %eax
    addl 12(%ebp), %eax

    mov %eax, -4(%ebp)      # push %eax  si nu mai pun linia 27
    pushl 16(%ebp)
    pushl -4(%ebp)
    call rest
    addl $8, %esp       # echivalent la doua pop-uri    
    
    # rest intoarce direct valoarea in %eax

    addl $4, %esp   # muti varful stivei sa scapi de %esp / similar cu pop

    popl %ebp
    ret 

.global main

main:

push k
push n2
push n1
call proc
addl $12, %esp

# proc returneaza in %eax

push $eax
push $fs1
call printf
addl $8, %esp

exit: 
mov $1, %eax
xor %ebx, %ebx
int $0x80
