.486				                    ;В программе будут использоваться команды процессора i80x486.
.model flat, stdcall				  ;Выставляем модель памяти flat
option casemap: none
include /masm32/include/windows.inc	        ;Подключаем библиотеки
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
 
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
include /masm32/macros/macros.asm 
uselib masm32, comctl32, ws2_32

.data							  ;Секция данных
msg_title db "Title", 0
A DB 1h
x dd 0,2,4,6,8,10,12,14,16,18,20
n dd 11
buffer db 128 dup(?)
format db "%d",0

.code							  ;Секция кода
start:
mov eax, 0
mov ecx, n
mov ebx, 0
L: add eax, x[ebx]
add ebx, type x
dec ecx				              ;Уменьшаем значение операнда в памяти на 1
cmp ecx, 0				              ;Сравниваем два операнда
jne L					              ;Переход по указанной метке”L”, если результат сравнения операндов был отрицательным м они неравны друг другу.
invoke wsprintf, addr buffer, addr format, eax
invoke MessageBox, 0, addr buffer, addr msg_title, MB_OK
invoke ExitProcess, 0
end start