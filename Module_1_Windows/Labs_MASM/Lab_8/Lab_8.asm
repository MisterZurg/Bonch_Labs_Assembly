.486
.model flat, stdcall
option casemap:none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\user32.lib
;10
.data
msg_title db "((A-B)/(J*(B+D)))", 0
A db 23
B db 3
J db 2
D db 5

buffer db 128 dup(?)
format db "%d",0

.code
start:
                    ;������� � ����� ����� �������� ����������
mov al, B           ;�������� �������� B � AL
add al, D           ;(B+D) 
mul J               ;�������� ��� ��� ���� J*(B+D) 
mov cl,al           ;�������� �������� �������� al � cl

mov al, A           ;�������� �������� A � AL
sub al, B           ;(A-B)
mov dl,0            ;��� ���� ���� �� ������ �� ����
div cl              ;��������� ������� ((A-B)/(J*(B+D)))

invoke wsprintf, addr buffer, addr format, al
invoke MessageBox, 0, addr buffer, addr msg_title, MB_OK
invoke ExitProcess, 0
end start