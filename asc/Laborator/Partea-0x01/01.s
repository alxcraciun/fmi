# Pagina 03
# ((x + y) ∗ (x − y) ∗ (x + z))/(y + z)

# You can use x/d $esp to verify Stack
# Practically, $esp moves right/left based on push/pull

.data
x: .long 2
y: .long 1
z: .long 3
e: .space 4

.text
.global main

main:               # $esp default state
movl y, %eax
addl z, %eax
pushl %eax      # (y+z)   ->   $esp-4

movl x, %eax
addl z, %eax
pushl %eax      # (y+z), (x+z)   ->  $esp-8 (relative to default)


movl x, %eax
subl y, %eax
pushl %eax      # (y+z), (x+z), (x-y)   ->  $esp-12 


movl x, %eax
addl y, %eax
pushl %eax      # (y+z), (x+z), (x-y), (x+y)   ->  $esp-16

popl %eax       # $esp-12  (adds 4)
popl %ebx       # $esp-8
mull %ebx
pushl %eax     # $esp-12     -> (y+z), (x+z), (x+y)*(x-y)

popl %eax       # $esp-8
popl %ebx       # $esp-4
mull %ebx       
pushl %eax      # $esp-8     -> (y+z), (x+y)*(x-y)*(x+z)


popl %eax       # $esp-4
popl %ebx       # $esp
divl %ebx
pushl %eax      #esp-4      -> (x+y)*(x-y)*(x+z)/(y+z)

popl e          # esp

mov $1, %eax
xor %ebx, %ebx
int $0x80
