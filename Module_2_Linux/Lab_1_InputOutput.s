.intel_syntax noprefix
SYS_EXIT = 1				/* ���������� �������� */
SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
STDERR = 2
/* ������ ������ */
.data
/* ������ ����� ������ */
end_of_line:
.ascii "\n"

buf: 			/* �������� ��� ������� ������ 8 ������ (8 ��������) */
.space 8, 0
str:
.ascii "������� 8 ��������"


.text				/* ������ ���� */
.global _start
_start:				/* ������� ����� ��������� */
mov edx, 18			/* ������� �������������� ������ */
mov ecx, offset str
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/* ��������� �� ������������ ����� ������������������ �������� */
mov edx, 8
mov ecx, offset buf
mov ebx, STDIN
mov eax, SYS_READ
int 0x80
/* ������� 2-� ������ */
mov edx, 1
lea eax, [buf + 1]
mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
lea eax, [buf + 3]		/* ������� 4-� ������ */

mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
lea eax, [buf + 5]		/* ������� 6-� ������ */
mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/*������� ������ ����� ������ */
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/* ���������� ��������� */
mov ebx, 0
mov eax, SYS_EXIT
int 0x80