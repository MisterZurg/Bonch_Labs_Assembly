.intel_syntax noprefix
.text
.globl _sum			/* ������ ������� sum */
_sum:
push ebp			/* ���������� ����-������ ���������� ������� */
mov ebp,esp
mov eax,[ebp + 8]		/* ������ � ���������� ������� �������������� ����� ������� ebp */
mov eax,[ebp + 12]
mov eax,[ebp + 16]
mov eax,[ebp + 20]
mov esp,ebp			/* �������������� ����-������ ���������� ������� */
pop ebp
ret				/* ����� �� ������� */
