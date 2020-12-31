.586
.model flat, stdcall
option casemap: none
include c:/masm32/include/windows.inc
include c://masm32/include/user32.inc
include c:/masm32/include/kernel32.inc
includelib c://masm32/lib/user32.lib
includelib c:/masm32/lib/kernel32.lib
include c:/masm32/macros/macros.asm
uselib masm32, comctl32, ws2_32
.data
.code
check_debug:
    assume fs:nothing
    mov eax,dword ptr fs:[30h]
    movzx eax,byte ptr [eax+2]
    ret
start:
call check_debug
test eax, eax
jnz print_debug
mov eax, 123
mov ebx, -90
add eax, ebx
test eax, eax
jz zero
invoke MessageBox, 0, chr$("В eax не 0!"), chr$("Info"), 0
jmp lexit
zero:
invoke MessageBox, 0, chr$("В eax 0!"), chr$("Info"), 0
jmp lexit
print_debug:
    	invoke MessageBox, 0, chr$("All money is mine"), chr$("Info"), 0
lexit:
invoke ExitProcess, 0
end start
