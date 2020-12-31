.model tiny
code segment
assume cs:code, ds:code
org 100h
start:
    mov ah,9
    mov dx,OFFSET Msg
    int 21h
    int 20h
    Msg DB 'Hello World!', 13,10,'$'
code ends
end start