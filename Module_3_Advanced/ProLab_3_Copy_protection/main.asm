.386

.model flat, stdcall

option casemap: none

include /masm32/include/windows.inc

include /masm32/include/user32.inc

include /masm32/include/kernel32.inc

includelib /masm32/lib/user32.lib

includelib /masm32/lib/kernel32.lib

include common.inc

.data

;----------------------

path db "C:\Windows",0

table db 1 ;таблица преобразований для шифра цезаря

k=1

rept 254

k=k+1

db k

endm

;----------------------------

szTitle db "(с) Джейсон Стетхем",0                     ;Заголовок защиты

info WIN32_FILE_ATTRIBUTE_DATA1 <0>

error_license db "Я вам запрещаю копировать эту программу в связи с законом РФ 'Об авторском праве и смежных правах' от 09.07.1993 N 5351-1!",0              ;Сообщение защиты

format_time db '%u:%u:%u:%u-%u:%u:%u:%u',0dh,0ah,0

format_hash db 'hash dd %u,%u'

msg_title db "Я умер 2.0", 0           ;Заголовок нашей программы

msg_message db "ВИКА НЕ ДЕРИ ОНО ПРАВИЛЬНО РАБОТАЕТ!", 0          ;Сообщение нашей  программы

.CONST

include hash.inc

.code

public entry

check_license:

push ebp

mov ebp,esp

push offset info

call get_info

;---------------------------------

get_info:

push ebp

mov ebp,esp

push eax

mov eax,[ebp +8h]

push eax

push 0

push offset path

call GetFileAttributesEx

pop eax

mov esp, ebp

pop ebp

call m1

;----------------------------------

m1:

test eax,eax

push offset info.ftCreationTime

call crypt_info

;-------------------------------------

crypt_info:

push ebp

mov ebp,esp

push eax

mov eax,[ebp +8h]

pusha

mov ebx, offset table

mov ecx, 8

mov esi, eax

mov edi, eax

cld

a1: lodsb

xlat

mov [edi], al

inc edi

loop a1

popa

pop eax

mov esp, ebp

pop ebp

call m2

;--------------------------------------------

m2:

mov eax, dword ptr [info.ftCreationTime]

cmp eax, [hash+4]

jnz not_license

mov eax, dword ptr [info.ftCreationTime +4]

cmp eax, [hash]

jnz not_license

xor eax,eax

not_license:

mov esp,ebp

pop ebp

retn

entry:

call check_license

test eax, eax

jnz print_error

push 0

invoke MessageBox, 0, addr msg_message, addr msg_title, MB_OK

jmp exit

print_error:

push 0

invoke MessageBox, 0, addr error_license, addr szTitle, 0

exit:

push 0

invoke ExitProcess, 0

end entry