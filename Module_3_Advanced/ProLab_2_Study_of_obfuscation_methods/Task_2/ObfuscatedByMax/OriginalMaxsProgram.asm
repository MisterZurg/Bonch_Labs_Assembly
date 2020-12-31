.486
.model flat, stdcall
option casemap: none
include c:/masm32/include/windows.inc
include c:/masm32/include/user32.inc
include c:/masm32/include/kernel32.inc
includelib c:/masm32/lib/user32.lib
includelib c:/masm32/lib/kernel32.lib
include c:/masm32/macros/macros.asm
uselib masm32, comctl32, ws2_32
.data
.code
start:
mov eax, -122
mov ebx, -9

add ax, 34
m5:
add ax, 6
test ax, 40
jge g12
add eax, ebx
add esp, 8
or esp, esp
g12:
sub ax, 3
jz m33
m33:
cmp eax, ebx ;сраввнение 2 числа с 0
jge m1
invoke MessageBox, 0, chr$("eax<ebx"), chr$("Info"), 0
jnl m2
cmp ax, 48
jge m5
m1: ;если 1 число меньше 2
invoke MessageBox, 0, chr$("eax>ebx"), chr$("Info"), 0
m2:
test ax, ax
jz m4
m4:
invoke ExitProcess, 0
end start