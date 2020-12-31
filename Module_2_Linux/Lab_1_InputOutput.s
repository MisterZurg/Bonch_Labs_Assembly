.intel_syntax noprefix
SYS_EXIT = 1				/* Объявление констант */
SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
STDERR = 2
/* Секция данных */
.data
/* Символ конца строки */
end_of_line:
.ascii "\n"

buf: 			/* Выделяем для входных данных 8 байтов (8 символов) */
.space 8, 0
str:
.ascii "Введите 8 символов"


.text				/* Секция кода */
.global _start
_start:				/* Входная точка программы */
mov edx, 18			/* Выводим приветственною строку */
mov ecx, offset str
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/* Прочитаем со стандартного ввода последовательность символов */
mov edx, 8
mov ecx, offset buf
mov ebx, STDIN
mov eax, SYS_READ
int 0x80
/* Выводим 2-й символ */
mov edx, 1
lea eax, [buf + 1]
mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
lea eax, [buf + 3]		/* Выводим 4-й символ */

mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
lea eax, [buf + 5]		/* Выводим 6-й символ */
mov ecx, eax
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/*Выводим символ конца строки */
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
/* Завершение программы */
mov ebx, 0
mov eax, SYS_EXIT
int 0x80