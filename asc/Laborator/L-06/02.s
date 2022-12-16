.data

x: .long 4
fs1: .asciz "\n"
fs2: .asciz "%ld"

.text

proc: 
pushl %ebp
mov %esp, %ebp

push 8(%ebp)
push $fs2
call printf
pop %ebx
pop %ebx

cmp $0, 8(%ebp)
je salt

mov 8(%ebp), %eax
subl $1, %eax
push %eax
call proc
pop %ebx

salt: 
pop %ebp
ret 

.global main

main:
push x
call proc
pop %ebx

pushl $fs1      # afisari de \n, nu cu fflush !!!
call printf
pop %ebx

exit: 
mov $1, %eax
xor %ebx, %ebx
int $0x80