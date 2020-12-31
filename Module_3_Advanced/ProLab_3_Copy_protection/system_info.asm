.386
.model flat, stdcall
option casemap:none
include common.inc

;extern _ExitProcess@4:near
;extern _GetFileAttributesExA@12:near
;extern _printf:near
;extern _sprintf:near
;extern _CreateFileA@28:near
;extern _CloseHandle@4:near
;extern _GetLastError@0:near
;extern _WriteFile@20:near
;extern _FileTimeToSystemTime@8:near

include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib

.data

path db "C:\Windows",0

time SYSTEM_TIME1 <0>

headr_hash db "hash db"

hashstring db 32 dup(0)

format1 db 'Error! In creat file %u',0

format_hash db 'hash dd %u,%u'

table db 1 ;таблица преобразований для шифра цезаря

k=1
rept 254
k=k+1
db k
endm

.code

public get_info
public crypt_info

;
; реализация шифра цезаря
; первый параметр - указатель на структуру времени(info.ftCreationTime)
;

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

retn

;

; получение информации о директории С:\Windows

; первый параметр - указатель на структуру времени(info.ftCreationTime)

;

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

retn

start:

end start