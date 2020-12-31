;extern _ExitProcess@4:near
;extern _GetFileAttributesExA@12:near
;extern _printf:near
;extern _sprintf:near
;extern _CreateFileA@28:near
;extern _CloseHandle@4:near
;extern _GetLastError@0:near
;extern _WriteFile@20:near
;extern _FileTimeToSystemTime@8:near

FILE_ATTRIBUTE_NORMAL equ 80h
CREATE_ALWAYS 	      equ 2
INVALID_HANDLE_VALUE  equ 0ffffffffh
HEAP_ZERO_MEMORY      equ 8h

GENERIC_READ 	equ 80000000h
GENERIC_WRITE 	equ 40000000h
GENERIC_EXECUTE equ 20000000h
GENERIC_ALL 	equ 10000000h

FILE_TIME1 STRUCT
	CreationLowDateTime dd ?
	CreationHighDateTime dd ?
FILE_TIME1 ENDS

WIN32_FILE_ATTRIBUTE_DATA1 STRUCT
	dwFileAttributes dd ?
	ftCreationTime FILE_TIME1 <0>
	ftLastAccessTime FILE_TIME1 <0>
	ftLastWriteTime FILE_TIME1 <0>
	nFileSizeHigh dd ?
	nFileSizeLow dd ?
WIN32_FILE_ATTRIBUTE_DATA1 ENDS

SYSTEM_TIME1 STRUCT	
	wYear dw ?
	wMonth dw ?
	wDayOfWeek dw ?
	wDay dw ?
	wHour dw ?
	wMinute dw ?
	wSecond dw ?
	wMilliseconds dw ?
SYSTEM_TIME1 ENDS