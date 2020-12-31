use32
global main
section .code
trash:
push ebp
mov ebp,esp
push ebx
mov ebx, [ebp+8]
inc ebx
xchg eax,ebx
pop ebx
mov esp,ebp
pop ebp
retn
start_func:
mov eax, 5
add eax, 7
push eax
call trash
add esp,4
ret