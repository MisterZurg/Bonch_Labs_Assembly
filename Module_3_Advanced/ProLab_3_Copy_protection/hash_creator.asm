.386
.model flat, stdcall
option casemap: none

include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/msvcrt.inc
include /masm32/include/kernel32.inc
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/msvcrt.lib
include common.inc

.data

path db "C:\Windows",0

time SYSTEM_TIME1 <0>

headr_hash db "hash db "
hashstring db 32 dup(0)

table db 1 ;������� �������������� ��� ����� ������
k=1
rept 254
k=k+1
db k
endm

filename db "hash.inc",0
format_check db "%u -%u ", 0dh,0ah,0

info WIN32_FILE_ATTRIBUTE_DATA1 <0>

format1 db 'Error! In create file %u',0
format2 db 'Error! In write file %u',0
format_hash db 'hash dd %u,%u'
format_time db '%u:%u:%u:%u-%u:%u:%u:%u',0dh,0ah,0

.code


;
; ���������� ����� ������
; ������ �������� - ��������� �� ��������� �������(info.ftCreationTime)

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
; ��������� ���������� � ���������� �:\Windows
; ������ �������� - ��������� �� ��������� �������(info.ftCreationTime)
;
get_info:

push ebp
mov ebp,esp
push eax

mov eax,[ebp +8h]

push eax
push 0
push offset path
call GetFileAttributesExA

pop eax

mov esp, ebp
pop ebp

retn

entry:
;��������� ���������� � ���������� �:\Windows
push offset info
call get_info
test eax,eax

;�������������� � ����,�������� ��� ������(������,����� �����������)
push offset time
push offset info.ftCreationTime
call FileTimeToSystemTime

; ������ ���� �������� ����������
xor eax, eax
mov ax, word ptr [time.wMilliseconds]
push eax
mov ax, word ptr [time.wSecond]
push eax
mov ax, word ptr [time.wMinute]
push eax
mov ax, word ptr [time.wHour]
push eax
mov ax, word ptr [time.wDay]
push eax
mov ax, word ptr [time.wDayOfWeek]
push eax
mov ax, word ptr [time.wMonth]
push eax
mov ax, word ptr [time.wYear]
push eax
mov eax, offset format_time
push eax
call crt_printf
add esp,24h

; ���������� ���� ������ ������
push offset info.ftCreationTime
call crypt_info

; ������������ ������ ��� ������ � ���� hash.inc
xor eax, eax
mov eax, dword ptr [info.ftCreationTime]
push eax
mov eax, dword ptr [info.ftCreationTime +4]
push eax
mov eax, offset format_hash
push eax
mov eax, offset hashstring
push eax
call crt_sprintf
add esp,10h

; �������� ����� hash.inc
xor ebp,ebp
push ebp
push FILE_ATTRIBUTE_NORMAL
push CREATE_ALWAYS
push ebp
push ebp
push GENERIC_WRITE
push offset filename
call CreateFileA
cmp eax,INVALID_HANDLE_VALUE
je error1
mov ebx,eax ; � eax HANDLE �����
push ebx

; ������ � ����
mov eax,esp
push ebp
push eax
push 27
push offset hashstring
push ebx
call WriteFile
test al,al
jz error1
cmp edi,[esp]
jne error2

pop ebx
push ebx
call CloseHandle ;�������� HANDLE �����

jmp exit

error2:
call GetLastError ; � ������ ������, ������� �� �� �����
push eax
mov eax, offset format2
push eax
call crt_printf
add esp, 8h

error1:
call GetLastError ; � ������ ������, ������� �� �� �����
push eax
mov eax, offset format1
push eax
call crt_printf
add esp, 8h

exit:
push 00000000h
call ExitProcess
end entry