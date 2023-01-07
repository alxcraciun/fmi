# 134_Craciun_AlexandruEmilian_1.s

.data
fs_scanf: .asciz "%ld"    
fs_newline: .asciz "\n"
fs_printf1: .asciz "%ld "
fs_printf2: .asciz "%ld\n"

cerinta: .space 4
nr_noduri: .space 4
nr_legaturi_nod: .space 400
aux: .space 4
current_row: .space 4
current_col: .space 4

lungime_drum: .space 4
nod_sursa: .space 4
nod_destinatie: .space 4

.text

matrix_mult:
    pushl %ebp
    mov %esp, %ebp

    # matrix_mult( * matrix1, * matrix2, * matrix_result, matrix_size)
    #                ebp+8      ebp+12         ebp+16        ebp+20
    mov 8(%ebp), %esi   
    mov 12(%ebp), %edi

    # SUM() end result (%esp+0)
    # matrix_res[%esp+4][%esp+8]
    # indexul elementelor de inmultit (var) (%esp+12)

    pushl $0    
    pushl $0
    pushl $0
    subl $4, %esp

    for1_lines:
        mov 4(%esp), %eax
        cmp 20(%ebp), %eax
        je exit_for1_lines

        movl $0, 8(%esp)
        for1_columns:
            mov 8(%esp), %eax
            cmp 20(%ebp), %eax
            je next_row

            # Push SUM() end result

            movl $0, 0(%esp)
            movl $0, 12(%esp)
            for1_multiplier:
                mov 12(%esp), %eax
                cmp 20(%ebp), %eax
                je next_column

                # matrix_res[%esp+4][%esp+8] = SUM(matrix1[%esp+4][var] * matrix2[var][%esp+8])
                # var -- takes values from 0 to matrix_size (var = %esp+20)

                movl 4(%esp), %eax
                xor %edx, %edx
                movl 20(%ebp), %ecx
                mul %ecx
                add 12(%esp), %eax
                movl (%esi, %eax, 4), %ebx

                movl 12(%esp), %eax
                xor %edx, %edx
                movl 20(%ebp), %ecx
                mul %ecx
                add 8(%esp), %eax
                movl (%edi, %eax, 4), %eax

                xor %edx, %edx
                mul %ebx

                # Pop, update and store SUM
                pop %ebx
                addl %ebx, %eax
                push %eax

                movl 12(%esp), %ecx
                inc %ecx
                movl %ecx, 12(%esp)

                jmp for1_multiplier

            next_column:
            
            # Get the final SUM results
            movl 4(%esp), %eax
            movl $0, %edx

            mov 20(%ebp), %ecx
            mul %ecx
            add 8(%esp), %eax

            # Move final SUM results to matrix_res[][]
            mov 16(%ebp), %edi
            movl 0(%esp), %ebx
            movl %ebx, (%edi, %eax, 4)

            # Restore %edi on matrix
            mov 12(%ebp), %edi

            # Increment Column
            movl 8(%esp), %ecx
            inc %ecx
            movl %ecx, 8(%esp)

            jmp for1_columns

        jmp for1_columns

        next_row:

        movl 4(%esp), %ecx
        inc %ecx
        movl %ecx, 4(%esp)

        jmp for1_lines

    jmp for1_lines
    exit_for1_lines:
    addl $20, %esp
ret

.global main

main:

# Citire cerinta
pusha 
pushl $cerinta
pushl $fs_scanf
call scanf
addl $8, %esp
popa

# Citire numar noduri
pusha
pushl $nr_noduri
pushl $fs_scanf
call scanf
addl $8, %esp
popa

# void *syscall(
# %eax - SYS_mmap2, 
# %ebx - addr, 
# %ecx - mapping length,
# %edx - prot, 
# %esi - flags,
# %edi - file descriptor
# %ebp - pgoffset


alocare_dinamica: 

# DYNAMICALLY ALLOCATE MEMORY FOR MATRIX
# same algorithm will be used below to allocate memory for "Cerinta 2"

pusha
push %ebp

call getpagesize   
movl $10, %ecx
mull %ecx
movl %eax, %ebp    # offset, multiple of the page size

movl $4, %eax                   # size of an int 
movl nr_noduri, %ecx      # nr_linii
mul %ecx                        # 4 * nr_linii
mul %ecx                        # 4 * nr_linii * nr_coloane

movl %eax, %ecx     # MAPPING LENGTH
movl $192, %eax     # syscall for mmap2
movl $0, %ebx       # NULL ADRESS to randomly allocate map 
movl $3, %edx       # PROT_READ | PROT_WRITE 
movl $33, %esi      # MAP_SHARED | MAP_ANONYMOUS
movl $-1, %edi      # set file descriptor to -1
int $0x80           # system interrupt to call mmap2 

pop %ebp
movl %eax, 4(%ebp)    # store adress of matrix before restoring registers
popa            

# I used MAP_SHARED because I want matrix_mult to be able to access memory zone
# I used MAP_ANONYMOUS so no other external programs can access the memory.

# MAP_ANONYMOUS -- 0x20
# MAP_SHARED -- 0x01

# PROT_READ -- 0x01
# PROT_WRITE -- 0x10

# I set file descriptor to -1 because of MAP_ANONYMOUS since I don't want to save the memory to any file.
# Also, my matrix has at most 40 kilobytes, so it will get into 10 pagesizes (4 kilos usually)


# Citire numar legaturi
lea nr_legaturi_nod, %esi
movl $0, %ecx 

# Citesc legaturile
for_links: 
    cmp nr_noduri, %ecx
    je exit_for_links

    pusha
    push $aux
    pushl $fs_scanf
    call scanf
    addl $8, %esp
    popa

    movl aux, %eax
    movl %eax, (%esi, %ecx, 4)  

    inc %ecx
jmp for_links
exit_for_links: 

movl $0, current_row
movl $0, current_col
lea nr_legaturi_nod, %esi

# Generare matrice adiacenta
for_lines: 
    # Verify and update current line 
    movl current_row, %ecx
    cmp nr_noduri, %ecx
    je citire_cerinta_2

    # Reset to keep track of columns
    movl $0, current_col    

    for_columns:
        movl current_row, %eax
        movl current_col, %ecx
        cmp (%esi, %eax, 4), %ecx
        je increase_row

        pusha 
        pushl $aux
        pushl $fs_scanf
        call scanf
        addl $8, %esp
        popa

        # matrix[row][column] = nr_noduri * row + column
        # aux - the just-scanned node (destination-node)

        movl current_row, %eax
        movl $0, %edx
        mull nr_noduri
        addl aux, %eax
        movl 4(%ebp), %esi
        movl $1, (%esi, %eax, 4)
        lea nr_legaturi_nod, %esi

        incl current_col
    jmp for_columns

    increase_row:
        incl current_row
        jmp for_lines

jmp for_lines
citire_cerinta_2:

# Citire lungime_drum
pusha 
pushl $lungime_drum
pushl $fs_scanf
call scanf
addl $8, %esp
popa

# Citire nod_sursa
pusha 
pushl $nod_sursa
pushl $fs_scanf
call scanf
addl $8, %esp
popa

# Citire nod_destinatie
pusha 
pushl $nod_destinatie
pushl $fs_scanf
call scanf
addl $8, %esp
popa

alocare_dinamica2: 

# Matricea Auxiliara

pusha
push %ebp

call getpagesize   
movl $10, %ecx
mull %ecx
movl %eax, %ebp    # offset, multiple of the page size

movl $4, %eax                   # size of an int 
movl nr_noduri, %ecx      # nr_linii
mul %ecx                        # 4 * nr_linii
mul %ecx                        # 4 * nr_linii * nr_coloane

movl %eax, %ecx     # MAPPING LENGTH
movl $192, %eax     # syscall for mmap2
movl $0, %ebx       # NULL ADRESS to randomly allocate map 
movl $3, %edx       # PROT_READ | PROT_WRITE 
movl $33, %esi      # MAP_SHARED | MAP_ANONYMOUS
movl $-1, %edi      # set file descriptor to -1
int $0x80           # system interrupt to call mmap2 

pop %ebp
movl %eax, 8(%ebp)    # store adress of matrix before restoring registers
popa


# Matricea rezultat finala

pusha
push %ebp

call getpagesize   
movl $10, %ecx
mull %ecx
movl %eax, %ebp    # offset, multiple of the page size

movl $4, %eax           # size of an int 
movl nr_noduri, %ecx    # nr_linii
mul %ecx                # 4 * nr_linii
mul %ecx                # 4 * nr_linii * nr_coloane

movl %eax, %ecx     # MAPPING LENGTH
movl $192, %eax     # syscall for mmap2
movl $0, %ebx       # NULL ADRESS to randomly allocate map 
movl $3, %edx       # PROT_READ | PROT_WRITE 
movl $33, %esi      # MAP_SHARED | MAP_ANONYMOUS
movl $-1, %edi      # set file descriptor to -1
int $0x80           # system interrupt to call mmap2 

pop %ebp
movl %eax, 12(%ebp)    # store adress of matrix before restoring registers
popa

generare_matrice:

# matrix_res[][] = matrix[][] ** lungime_drum
# %ecx = putearea curenta

movl $1, %ecx

# Copiez matricea in matrix_aux
# in %eax o sa tin minte 4 * (marimea matricii ** 2)
# marimea matricii este data de nr_noduri

movl $4, %eax
movl $0, %edx
mull nr_noduri
mull nr_noduri

# void * memcpy ( void * destination, const void * source, size_t num )

pusha 
pushl %eax
pushl 4(%ebp)
pushl 8(%ebp)
call memcpy
addl $12, %esp
popa 

# Inmultire repetata pana ajung la matricea finala
for_operatii:
    cmp lungime_drum, %ecx
    jge afisare_cerinta2

    # matrix_mult( * matrix1, * matrix2, * matrix_result, matrix_size)

    pusha
    pushl nr_noduri
    pushl 12(%ebp)
    pushl 4(%ebp)
    pushl 8(%ebp)
    call matrix_mult
    addl $16, %esp
    popa 

    inc %ecx

    # Copiez matrix_res in matrix_aux
    # in %eax o sa tin minte 4 * (marimea matricii ** 2)
    # marimea matricii este data de nr_noduri

    movl $4, %eax
    movl $0, %edx
    mull nr_noduri
    mull nr_noduri

    # void * memcpy ( void * destination, const void * source, size_t num )

    pusha 
    pushl %eax
    pushl 12(%ebp)
    pushl 8(%ebp)
    call memcpy
    addl $12, %esp
    popa 

jmp for_operatii

afisare_cerinta2: 

# raspuns = matrix_res[nod_sursa][nod_destinatie] 
# matrix[row][col] = nr_noduri * row + column

movl nod_sursa, %eax
movl nod_destinatie, %ecx
movl $0, %edx
mull nr_noduri
add %ecx, %eax
movl 12(%ebp), %esi
movl (%esi, %eax, 4), %ebx

pushl %ebx
pushl $fs_printf2
call printf
addl $8, %esp

exit: 
mov $1, %eax
xor %ebx, %ebx
int $0x80
