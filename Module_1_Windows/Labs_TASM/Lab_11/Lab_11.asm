.model small
.stack 100h
.data
str1 db 'Input X:$'
str2 db 'Input Y:$'
str00 db 'Tochka v pustom pole!$'
str10 DB 'Tochka na linii!$'
str11 DB 'Tochka popala na liniju i Michael Kryg!$'
str12 DB 'Vladimirski Central ...$'
str13 DB 'Tochka popala na prjamougolnik$'
str14 DB 'Tochka na prjamougolnik i Michael Kryg!$'
str0 db 13,10,'$'
X db ?
Y db ?
.code
King_crimson_no_noryoku:
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,str1
int 21h
mov ah,01h
int 21h
sub al,48d
mov X,al
mov ah,09h
lea dx,str0
int 21h
mov ah,09h
lea dx,str2
int 21h
mov ah,01h
int 21h
sub al,48d
mov Y,al
mov ah,09h
lea dx,str0
int 21h
cmp X, 3			;Сравниваем X=3
je Hit_the_line
ja Hit_the_right
jb J_Hit_the_left
jmp exit
J_Hit_the_left:
	jmp Hit_the_left
	jmp exit
Hit_the_line:
	mov bx,0
	mov cx,0
	mov bl, X
	mov cl, Y
	sub bl,4d
	sub cl,5d
	mov X,bl
	mov Y,cl
	mov bl,0
	mov cl,0
	mov al,X
	mov ah,0
	imul X
	mov X,al
	mov ah,0
	mov al,Y
	imul Y
	mov Y,al
	mov ah,0
	mov al,X
	add al,Y
	mov dl,al
	add dl,48d
	cmp dl,'9'
	je Print_Line_and_Cycle
	jb Print_Line_and_Cycle
	ja Print_the_line
	jmp exit
Print_Line_and_Cycle:
	mov ah,09h
	lea dx,str11
	int 21h	
	jmp exit
Print_the_line:
	mov ah,09h
	lea dx,str10
	int 21h
	jmp exit
Hit_the_right:
	cmp X,5
	jb JJ_Hit_the_left
	ja Check_Rectangle
	je Check_Rectangle
	jmp exit
JJ_Hit_the_left:
	jmp Hit_the_left
	jmp exit
Check_Rectangle:
	cmp X,8
	ja Print_Empty_Field
	jb Check_Rectangle_Y
	je Check_Rectangle_Y
	jmp exit
Check_Rectangle_Y:
	cmp Y,5
	ja Hit_the_left
	jb Hit_Cycle_and_Rectangle
	je Hit_Cycle_and_Rectangle
	jmp exit
Hit_Cycle_and_Rectangle:
mov bx,0
mov cx,0
mov bl, X
mov cl, Y
sub bl,4d
sub cl,5d
mov X,bl
mov Y,cl
mov bl,0
mov cl,0
mov al,X
mov ah,0
imul X
mov X,al
mov ah,0
mov al,Y
imul Y
mov Y,al
mov ah,0
mov al,X
add al,Y
mov dl,al
add dl,48d
cmp dl,'9'
je Print_Cycle_and_Rectangle
jb Print_Cycle_and_Rectangle
ja Print_the_Rectangle
jmp exit
Print_Cycle_and_Rectangle:
mov ah,09h
lea dx,str14
int 21h
jmp exit
Print_Empty_Field:
mov ah,09h
lea dx,str00
int 21h
jmp exit
Print_the_Rectangle:
mov ah,09h
lea dx,str13
int 21h
jmp exit
Hit_the_left:
mov bx,0
mov cx,0
mov bl, X
mov cl, Y
sub bl,4d
sub cl,5d
mov X,bl
mov Y,cl
mov bl,0
mov cl,0
mov al,X
mov ah,0
imul X
mov X,al
mov ah,0
mov al,Y
imul Y
mov Y,al
mov ah,0
mov al,X
add al,Y
mov dl,al
add dl,48d
cmp dl,'9'
je Print_the_Cycle
jb Print_the_Cycle
ja Print_Empty_Field
jmp exit
Print_the_Cycle:
mov ah,09h
lea dx,str12
int 21h
jmp exit
exit:
mov ah,4ch
int 21h
end King_crimson_no_noryoku