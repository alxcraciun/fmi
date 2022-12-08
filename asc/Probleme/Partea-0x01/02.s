# Pagina 06
# Procedura face x+y si ii adauga in s

# Varianta va fi imbunatatita in 03 (cu %esp flexibil in functie, folosind %ebp)

.data
x: .long 2
y: .long 3
s: .space 4

.text

add:
movl 4(%esp), %eax          # this means $esp+4
addl 8(%esp), %eax
movl 12(%esp),%ebx
movl %eax, 0(%ebx)          
ret

.global main

# Use `p &s` to print adress of s

main:
pushl $s       # Use x/x $esp to check (hexa_type) adress of s in stack
pushl y
pushl x
call add
popl %edx
popl %edx
popl %edx

mov $1, %eax
xor %ebx, %ebx
int $0x80