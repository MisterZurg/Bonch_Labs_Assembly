.386
        .model flat,stdcall
  option   casemap:none
                        include C:\masm32\INCLUDE\WINDOWS.INC
                        include C:\masm32\INCLUDE\KERNEL32.INC 
                        include C:\masm32\INCLUDE\USER32.INC
                        include C:\masm32\INCLUDE\ADVAPI32.INC                                                  
                                                                     
                        includelib C:\masm32\lib\comctl32.lib
                        includelib C:\masm32\lib\user32.lib
                        includelib C:\masm32\lib\gdi32.lib
                        includelib C:\masm32\lib\kernel32.lib                
                        includelib C:\masm32\lib\user32.lib
                        includelib C:\masm32\lib\advapi32.lib                 
;###########################################################
;data--data--data--data--data--data--data--data--data--data--     PROC
;------------------------------------------------------------
.DATA

HINST            DWORD       0
VAR_LEVEL        DD          4000
BEEP_LONG     DWORD       1000
STR_HELLO                        DB     "PRIVET STOP_ONE",0
STR_BYTE_HELLO               BYTE   "BYTE HELLO",0

;##############################################################
;code--code--code--code--code--code--code--code--code--code-- PROC
;---------------------------------------------------------------------------------------------------
.CODE
START:  

            invoke         MessageBox ,\
            		   0 ,\
            		   addr  STR_BYTE_HELLO    ,\
            		   offset  STR_HELLO    ,\
            		   0
            		 
            invoke         Sleep   ,   2000 
            invoke         Beep   ,   VAR_LEVEL  ,   BEEP_LONG      
            
EXIT:     
             invoke               ExitProcess        ,       0
;++++++++++++++++++++++++++++++++++++++++++++
END  START
