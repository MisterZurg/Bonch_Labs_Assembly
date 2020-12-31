.486				                    ;� ��������� ����� �������������� ������� ���������� i80x486.
.model flat, stdcall				  ;���������� ������ ������ flat
option casemap: none
include /masm32/include/windows.inc	        ;���������� ����������
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
 
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
include /masm32/macros/macros.asm 
uselib masm32, comctl32, ws2_32

.data							  ;������ ������
msg_title db "Title", 0
A DB 1h
x dd 0,2,4,6,8,10,12,14,16,18,20
n dd 11
buffer db 128 dup(?)
format db "%d",0

.code							  ;������ ����
start:
mov eax, 0
mov ecx, n
mov ebx, 0
L: add eax, x[ebx]
add ebx, type x
dec ecx				              ;��������� �������� �������� � ������ �� 1
cmp ecx, 0				              ;���������� ��� ��������
jne L					              ;������� �� ��������� �����L�, ���� ��������� ��������� ��������� ��� ������������� � ��� ������� ���� �����.
invoke wsprintf, addr buffer, addr format, eax
invoke MessageBox, 0, addr buffer, addr msg_title, MB_OK
invoke ExitProcess, 0
end start