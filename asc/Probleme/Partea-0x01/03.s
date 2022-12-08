# Pagina 8
# Optimizare pentru flexbilitatea stack-ului 

.data
x: .long 2
y: .long 3
s: .space 4
.text

add:
pushl %ebp          # To remember global %ebp
mov %esp, %ebp
movl 8(%ebp), %eax      # Now you remember beginning of stack (for current function)
addl 12(%ebp), %eax     # This allows you to push to $esp even inside the function `add` procedure
movl 16(%ebp),%ebx
movl %eax, 0(%ebx)
popl %ebp
ret                 # Returns to the adress remained in $esp

.global main

main:

pushl $s
pushl y
pushl x

call add            # Actually does `push($adress_of_next_line)`

popl %edx
popl %edx
popl %edx

mov $1, %eax
xor %ebx, %ebx
int $0x80