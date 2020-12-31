;PROGRAM VZLOM_VZLOMA
#MAKE_COM# 
ORG 100h
MOV AH, 0Eh 
MOV AL, 'Z' 
INT 10h 
MOV AL, 'a' 
INT 10h 
MOV AL, 'k'
INT 10h 
MOV AL, 'h'
INT 10h 
MOV AL, 'a' 
INT 10h 
MOV AL, 'r' 
INT 10h   
MOV AL, 'o' 
INT 10h                
MOV AL, 'v' 
INT 10h    
MOV AL, 0AH   ; "\n"
INT 10H
MOV AL, 0DH   ; "cursor to the beginning" 
INT 10H       
MOV AL, 'D' 
INT 10h 
MOV AL, 'e' 
INT 10h 
MOV AL, 'n'
INT 10h 
MOV AL, 'i'
INT 10h 
MOV AL, 's' 
INT 10h                        
MOV AL, 0AH   ; "\n"
INT 10H
MOV AL, 0DH   ; "cursor to the beginning" 
INT 10H                                   
MOV AL, 'A' 
INT 10h 
MOV AL, 'r' 
INT 10h 
MOV AL, 't'
INT 10h 
MOV AL, 'u'
INT 10h 
MOV AL, 'r' 
INT 10h 
MOV AL, 'o' 
INT 10h   
MOV AL, 'v' 
INT 10h                
MOV AL, 'i' 
INT 10h
MOV AL, 'c' 
INT 10h
MOV AL, 'h' 
INT 10h   
RET 