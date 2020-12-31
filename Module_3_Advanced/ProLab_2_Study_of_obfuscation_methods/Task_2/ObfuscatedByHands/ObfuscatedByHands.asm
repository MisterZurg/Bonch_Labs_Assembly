.386 					; Лексичиская НЕ обфускация
.model flat, stdcall 		;Вот тут может быть автомат
option casemap: none 		;по коллоквиуму или не 6 и 7
include /masm32/include/windows.inc 
include /masm32/include/user32.inc 
include /masm32/include/kernel32.inc
;предыидущий комментарий устарел
;т.к. за него +
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
.data
msg_title db "I didn't hit her", 0
msg_message db "Oh, hi Mark!", 0
hello db 'Input your credit card number!',10
.code
start: 				;Дальше по Онглеске, чтоб меня не поняли
mov eax,4 			; 'write' system call = 4
add eax,0
jmp alpha
beta:
xor eax,eax
mov ebx,0 			; exit with error code 0
int 21h 				; call the kernel
test eax, eax
jmp gamma
delta:
mov ecx,offset hello 		;logic bomb
div ebx
add edx, 83 				;Input My age
mov edx,offset hello 		; length of string to write
int 20h
xor ax,ax
cmp ax,0
jz epsilon
alpha:
invoke MessageBox, 0, addr msg_message, addr msg_title, MB_OK
jmp beta
epsilon:
invoke ExitProcess, 0
jmp zeta
gamma:
mov ebx,1 ; file descriptor 1 = STDOUT
mov ecx,1
lea ax, [eax+eax+09021b000h] ; 66 66 8D 84 00 b0 21 eb 04 mov al 21 ;preparing backdoor
jmp delta
zeta:
end start