.intel_syntax noprefix
SYS_EXIT = 1
SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
STDERR = 2
.data
symbol:
.byte 0
end_of_line:
.ascii "\n"
i:
.byte 0
j:
.byte 0
.text
.global _start
_start:
mov edx, 1
mov ecx, offset symbol
mov ebx, STDIN
mov eax, SYS_READ
int 0x80
mov byte ptr [i], 0
outer_loop:
mov al, [i]
shl al, 1
inc al
mov [j], al
inner_loop:					/*Анекдот*/
mov edx, 1					/*move ax, pony*/
mov ecx, offset symbol				/*jnz pony*/
mov ebx, STDOUT					/*jmp magiccastle*/
mov eax, SYS_WRITE
int 0x80
dec byte ptr [j]
cmp byte ptr [j], 0
.att_syntax
jnz inner_loop
.intel_syntax noprefix
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
inc byte ptr [i]
cmp byte ptr [i], 5
.att_syntax
jnz outer_loop
.intel_syntax noprefix
mov ebx, 0
mov eax, SYS_EXIT
int 0x80
