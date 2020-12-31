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
;check_debug:
;push ebx
;push edx
;RDTSC
;xor ebx,ebx
;mov ebx,eax
;RDTSC
;sub eax, ebx
;cmp eax, 0fffh
;jnb is_debug
;xor eax,eax
;is_debug:
;pop edx
;pop ebx
;retn
start:				;работаем со стеком
	;call check_debug	;вызываем процедуру check_debug
test eax, eax		;сравниваем eax с нулём экономя байт
	jnz print_debug	;if eax!=0 goto print_debug
mov eax, 123
mov ebx, -90
add eax, ebx
test eax, eax		;сравниваем eax с 0 снова экономя байт
jz zero			;if eax==0 goto print_debug
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
