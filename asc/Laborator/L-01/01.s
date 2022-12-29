.data 
str1: .ascii "abc"
str2: .ascii "1"
.text
.global main
main: 
movl $4, %eax
movl $1, %ebx
movl $str1, %ecx
movl $4, %edx
int $0x80


exit:
mov $1, %eax
xor %ebx, %ebx
int $0x80