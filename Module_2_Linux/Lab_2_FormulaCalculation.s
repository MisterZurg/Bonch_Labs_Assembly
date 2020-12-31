.intel_syntax noprefix
SYS_EXIT = 1
SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
STDERR = 2
.data					/* ������ ������ */
error_msg:				/* ��������� �� ������ */
.ascii "Error reading STDIN\n"
end_of_line:				/* ������ ����� ������ */
.ascii "\n"
buf:					/* �������� ��� ������� ������ 4 ����� */
.space 4, 0
str:
.ascii "������� 4 �����"
.text					/* ������ ���� */
.global _start
_start:					/* ������� ����� ��������� */
mov edx, 15				/* ������� �������������� ������ */
mov ecx, offset str
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 4				/* ��������� �� ������������ ����� */
mov ecx, offset buf
mov ebx, STDIN
mov eax, SYS_READ
int 0x80
cmp eax, -1						/* � ������ ������ ������ ������� 
��������� � ��������� ������ */
jz error
xor eax, eax
mov al, [buf + 3]
sub al, 0
mov ebx, eax		/* �������� �������� ���������� D � ������� ebx */
 xor edx, edx				/* �������� ������� edx � ���������� � ���� 
�������� ���������� C */
mov dl, [buf + 2]
sub dl, 0
add eax, edx						/* ���������� ���������� C � D. 
��������� ����������� � �������� eax */
imul edx			/* �������� ��������� �� ���������� C */
xor ecx, ecx		/* �������� ������� ecx � ���������� � ���� �������� ���������� A */
mov cl, [buf]
sub cl, 0
imul ecx		/* �������� ��������� ����������� �������� �� ���������� A */
imul ebx		/* �������� ��������� �� ���������� D, ���������� � �������� ebx */
mov ebx, 10		/* ����� ��������� ��������� �� 10, ����� �������� � ������� �������� �������� ����������� ������� ����������� ���������� */
xor edx, edx
div ebx
add dl, 0	/* ��� ������� ������� ������������ � ������� edx. ���������� � ���� ��� ������� 0, ����� �������� ���������� ������������� ����� */
mov [buf], dl
mov edx, 1
mov ecx, offset buf
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
jmp exit
error:
mov edx, 20
mov ecx, offset error_msg
mov ebx, STDERR
mov eax, SYS_WRITE
int 0x80
exit:
mov ebx, 0
mov eax, SYS_EXIT
int 0x80