;PROGRAM VZLOM_VZLOMA
#MAKE_COM#  
ORG 100h
mov Ah, 0Eh
lea BX, a[0]
mov BYTE PTR [BX], 'b'
mov AL,a[0]
int 10h
lea BX, a[1]
mov BYTE PTR [BX], 'r'
mov AL,a[1]
int 10h
lea BX, a[2]
mov BYTE PTR [BX], 'u'
mov AL,a[2]
int 10h
lea BX, a[3]
mov BYTE PTR [BX], 'h'
mov AL,a[3]
int 10h
ret
a db 'look at this dude!',0
end 