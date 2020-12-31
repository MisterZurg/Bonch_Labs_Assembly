.386
.model flat, stdcall
option casemap: none
include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
.data
msg_title db "I didn't hit her", 0
msg_message db "Oh, hi Mark!", 0
.code
start:
invoke MessageBox, 0, addr msg_message, addr msg_title, MB_OK
invoke ExitProcess, 0
end start