.intel_syntax noprefix
.text
.globl _sum			/* Начало функции sum */
_sum:
push ebp			/* Сохранение стек-фрейма вызывающей функции */
mov ebp,esp
mov eax,[ebp + 8]		/* Доступ к параметрам функции осуществляется через регистр ebp */
mov eax,[ebp + 12]
mov eax,[ebp + 16]
mov eax,[ebp + 20]
mov esp,ebp			/* Восстановление стек-фрейма вызывающей функции */
pop ebp
ret				/* Выход из функции */
