.386  	                          ;работаем с 32-битными регистрами, создаем программу под Windows
.model stdcall, flat	              ;необходимая модель памяти под Винду	
option casemap:none		        ;различать большие и малые буковки

includelib C:\masm32\lib\kernel32.lib
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\user32.lib
include C:\masm32\include\user32.inc
include C:\masm32\include\windows.inc
include C:\masm32\include\gdi32.inc
includelib C:\masm32\lib\gdi32.lib
.data				               ;сегмент данных
hwnd dd 0
hInst dd 0
szTitleName db 'Title', 0
szClassName db 'Приложение Win32', 0
msg MONMSGSTRUCT <?>
wc WNDCLASS <?>
ps PAINTSTRUCT <?>

.code				               ;сегмент кода
Main PROC
invoke GetModuleHandle, 0 	         ;получение значения баз. адреса,
mov hInst, eax 			         ;по которому загружен модуль.
mov wc.style, CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
mov wc.lpfnWndProc, offset WndProc     ;адрес оконной процедуры
mov wc.cbClsExtra, 0
mov wc.cbWndExtra, 0
mov eax, hInst                         ;дескриптор приложения
mov wc.hInstance, eax                  ;в поле hInstance
invoke LoadIcon, 0, IDI_APPLICATION
mov wc.hIcon, eax                      ;дескриптор значка в поле hIcon
invoke LoadCursorA, 0, IDC_ARROW
mov wc.hCursor, eax                    ;дескриптор курсора в поле hCursor
mov wc.hbrBackground, WHITE_BRUSH      ;цвет бекграунда окна белый
mov dword ptr wc.lpszMenuName, 0       ;главного меню нет
mov dword ptr wc.lpszClassName, offset szClassName  ;имя класса окна
invoke RegisterClassA, offset wc                    ;регистрация класас окна
invoke CreateWindowEx, 0, offset szClassName, offset szTitleName, \
WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, \
CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, hInst, 0
mov hwnd, eax 				   ;создание окна
invoke ShowWindow, hwnd, SW_SHOWNORMAL ;показ окна
invoke UpdateWindow, hwnd 	         ;перерисовывка содержимого окна
cycle1: 					   ;цикл сообщений
invoke GetMessage, offset msg, 0, 0, 0
cmp ax, 0
je end_c
invoke TranslateMessage, offset msg    ;трансляция ввода с клавиатуры
invoke DispatchMessage, offset msg     ;отправляем сообщение
                                       ;оконной процедуре
jmp cycle1
end_c:
invoke ExitProcess, 0 			   ;выход из приложения
Main ENDP
WndProc PROC USES ebx edi esi, _hwnd:DWORD, _wmsg:DWORD, _wparam:DWORD, _lparam:DWORD
local _hdc:DWORD
cmp _wmsg, WM_DESTROY
je wmdestroy
cmp _wmsg, WM_PAINT
je wmpaint
invoke DefWindowProcA, _hwnd, _wmsg, _wparam, _lparam   ;обраб. по умолчанию
jmp exit_proc
wmpaint:
invoke BeginPaint, _hwnd, offset ps                     ;получаем контекст устройства
mov _hdc, eax
invoke Rectangle, _hdc, 170, 120, 310, 260 ;тело
invoke Rectangle, _hdc, 120, 120, 170, 140 ;левая рука
invoke Rectangle, _hdc, 310, 120, 360, 140 ;правая рука
invoke Rectangle, _hdc, 170, 260, 190, 310 ;левая нога
invoke Rectangle, _hdc, 290, 260, 310, 310 ;правая нога
invoke Rectangle, _hdc, 210, 80, 270, 120  ;голова
invoke Rectangle, _hdc, 220, 85, 225, 90   ;левый глаз
invoke Rectangle, _hdc, 250, 85, 255, 90   ;правый глаз
invoke Rectangle, _hdc, 225, 105, 255, 120 ;рот
invoke EndPaint, _hdc, offset ps 	;освобождаем контекст
mov eax, 0 					;возвращаемое значение – 0
jmp exit_proc
wmdestroy:
invoke PostQuitMessage, 0 		;послать сообщение WM_QUIT
mov eax, 0 					;возвращаемое значение – 0
exit_proc:
ret
WndProc ENDP
END Main