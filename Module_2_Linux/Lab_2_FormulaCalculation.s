.intel_syntax noprefix
SYS_EXIT = 1
SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
STDERR = 2
.data					/* Секция данных */
error_msg:				/* Сообщение об ошибке */
.ascii "Error reading STDIN\n"
end_of_line:				/* Символ конца строки */
.ascii "\n"
buf:					/* Выделяем для входных данных 4 байта */
.space 4, 0
str:
.ascii "Введите 4 цифры"
.text					/* Секция кода */
.global _start
_start:					/* Входная точка программы */
mov edx, 15				/* Выводим приветственною строку */
mov ecx, offset str
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 1
mov ecx, offset end_of_line
mov ebx, STDOUT
mov eax, SYS_WRITE
int 0x80
mov edx, 4				/* Прочитаем со стандартного ввода */
mov ecx, offset buf
mov ebx, STDIN
mov eax, SYS_READ
int 0x80
cmp eax, -1						/* В случае ошибки чтения выводим 
сообщение и завершаем работу */
jz error
xor eax, eax
mov al, [buf + 3]
sub al, 0
mov ebx, eax		/* Копируем значение переменной D в регистр ebx */
 xor edx, edx				/* Обнуляем регистр edx и записываем в него 
значение переменной C */
mov dl, [buf + 2]
sub dl, 0
add eax, edx						/* Складываем переменные C и D. 
Результат сохраняется в регистре eax */
imul edx			/* Умножаем результат на переменную C */
xor ecx, ecx		/* Обнуляем регистр ecx и записываем в него значение переменной A */
mov cl, [buf]
sub cl, 0
imul ecx		/* Умножаем результат предыдущего действия на переменную A */
imul ebx		/* Умножаем результат на переменную D, сохранённую в регистре ebx */
mov ebx, 10		/* Делим результат выражения на 10, чтобы получить в остатке значение младшего десятичного разряда полученного результата */
xor edx, edx
div ebx
add dl, 0	/* При делении остаток записывается в регистр edx. Прибавляем к нему код символа 0, чтобы получить символьное представление числа */
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