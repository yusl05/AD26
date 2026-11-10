.MODEL SMALL
.STACK 20h
.DATA
    cSaludo1 DB 'U2: Programacion Basica',10,13,'$'
    cSaludo2 DB 'Yushab Jesed Serrano López',10,13,'$'
    cSaludo3 DB 'Hola mundo en ensamblador',10,13,'$' 
.CODE
	eInicio:
		mov ax, @Data
		mov ds, ax

		mov dx, offset cSaludo1
		mov ah, 09h
		int 21h

		mov dx, offset cSaludo2
		mov ah, 09h
		int 21h

		mov dx, offset cSaludo3
		mov ah, 09h
		int 21h		

		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
	END eInicio