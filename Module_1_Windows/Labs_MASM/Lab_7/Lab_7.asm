.486
.model flat, stdcall
option casemap: none
include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
include /masm32/macros/macros.asm
uselib masm32, comctl32, ws2_32
.data
.code
start:
mov eax, 123
mov ebx, -90
add eax, ebx
test eax, eax
jz zero
invoke MessageBox, 0, chr$("В eax не 0!"), chr$("Info"), 0
jmp lexit
zero:
invoke MessageBox, 0, chr$("В eax 0!"), chr$("Info"), 0
lexit:
invoke ExitProcess, 0 
end start