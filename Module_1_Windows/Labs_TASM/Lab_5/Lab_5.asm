.model small
.data
EnterS DB "Enter String:$"
endl DB 10,13,'$'
buf db 20 dup('$')
.code
main:
mov ax, @data
mov ds, ax
mov ah, 9
mov dx, offset EnterS
int 21h
mov ah, 0ah
mov dx, offset buf
int 21h
mov ah, 9
mov dx, offset endl
int 21h
mov ah, 09
mov dx, offset buf
add dx,2
int 21h
mov ah, 9
mov dx, offset endl
int 21h
mov ax,4c00h 
int 21h
end main