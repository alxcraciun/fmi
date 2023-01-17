# Notite Laborator 

*Un vector este interpretat in memorie astfel:*
``` Assembly
long v[4] = {15, 21, 7, 30}
v: .long 15, 21, 7, 30

v[0] -> *(v+0)
v[1] -> *(v+1*4)
v[2] -> *(v+2*4)
v[3] -> *(v+3*4)        * = valoarea obtinuta la adresa de memorie 
```

> **Pentru a accesa elementele vectorului:**<br>
> Adresa de inceput + index * dimensiune_tip_date**

Reprezentarea in Assembly:

``` Assembly
// In C++ putem scrie direct: v[3] = 5

lea v, %edi   # mov $v, %edi  == Mutam ADRESA lui v in %edi
mov $3, %ecx                     
mov $5, (%edi, %ecx, 4)     
```

---

### Exemplu Long

``` cpp
n = 5
long a[5] = {1, 2, 3, 4, 5}
s = 0
for (long i = 0; i < n; i++)
	s += a[i]
```

``` Assembly
.data                         
	n: .long 5                  
	a: .long 1,2,3,4,5          
	s: .long 0                  
.text                          
.global main

main:
	mov $a, %esi
	mov $0, %ecx

et_loop:
	cmp n, %ecx
	jge et_exit
	# mov a(,%ecx,4), %ebx
	mov (%esi, %ecx, 4), %ebx
	add %ebx, s
	inc %ecx
	jmp et_loop

et_exit:
	mov $1, %eax
	xor %ebx, %ebx    # aceeasi chestie cu mov $0, $ebx
	int $0x80
```

---

### Exemplu string

```cpp
string s[7] = "Hello\n"
string t[7] 
for (long i = 0; i < n; i++)
	t[i] = s[i]
for (long i = n; i >= 1; i--)
	t[i-1] = s[i-1]
```


``` Assembly
.data                         
	n: .long 7                
	a: .asciz "Hello\n"       
	s: .space 7               
.text                          
.global main

main:
	mov $s, %esi
	mov $t, %edi
	mov n, %ecx

et_loop:
	mov %ecx, %edx
	sub $1, %edx
	#movb(%esi,%edx,1), %eax   # movb ca lucram cu bytes  
	mov($esi, %edi, 1), %al    # mergea si ala dinainte, e same stuff
	mov %al, (%edi, %edx, 1)
	looop et_loop

mov $4, %eax    # pentru afisare
mov $1, %ebx
mov $t, %ecx
mov $7, %edx
int $0x80

et_exit:
	mov $1, %eax
	xor %ebx, %ebx    
	int $0x80
```