# Se citeste un string de la tastatura.
# Sa se afiseze pe ecran numarul de vocale.

.data
    cuv: .space 200
	len: .space 4
	len_voc: .long 10
	voc: .asciz "aeiouAEIOU"
	print_format: .asciz "Numarul de vocale este %ld\n"
	nr: .long 0
.text
.globl main
main:
	movl $0, len
	mov $0, %ecx
	lea voc, %esi
	lea cuv, %edi
	
citire:
    pusha 
    pushl $cuv
    call gets
    popl %ebx
    popa

lungime_sir:
	pusha
	movl $0, %eax
	pushl $cuv
	call strlen
	movl %eax, len
	popl %ebx
	popa
    
et_loop:
	cmp %ecx, len_voc	# %ecx - la ce vocala sunt
	je et_afisare
	
	mov (%esi, %ecx, 1), %al	# litera generala 
	mov $0, %ebx
	inc %ecx
	
et_loop2:
	cmp %ebx, len
	je et_loop
		
	mov (%edi, %ebx, 1), %dl	# litera curenta
	
	cmp %dl, %al
	jne et_notfound
	addl $1, nr

et_notfound:
	inc %ebx
	jmp et_loop2
	
et_afisare:
	pushl nr
	pushl $print_format
	call printf
	popl %eax
	popl %eax
	
et_exit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80