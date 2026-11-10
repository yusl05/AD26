;Yushab Jesed Serrano López
;30 de septiembre de 2026

.MODEL SMALL
.STACK 100h
.DATA
	cDescrip 	DB 'Programa que lee un carscter y al finalizar, muestra el caracter en pantalla',10,13,'$'
	cIngresar1 	DB 10,13,'Ingrese el primer caracter: $'
	cIngresar2 	DB 10,13,'Ingrese el segundo caracter: $'
	cFinProg	DB 10,13,'El programa ha finalizado, presiona ENTER para terminar$'
	cIngresado1	DB 10,13,'El primer caracter ingresado fue: $'
	cIngresado2	DB 10,13,'El segundo caracter ingresado fue: $'
	

.CODE
	eInicio:
		mov ax, @Data	;mov dx, @Data
		mov ds, ax

		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar1
		int 21h

		mov ah, 01h	;lee primer caracter desde el teclado
		int 21h
		mov bl, al
		
		mov ah, 09h
		mov dx, offset cIngresar2
		int 21h

		mov ah, 01h	;lee segundo caracter desde el teclado
		int 21h
		mov bh, al
		
		mov ah, 09h
		mov dx, offset cIngresado1
		int 21h

		mov ah, 02
		mov dl, bl
		int 21h

		mov ah, 09h
		mov dx, offset cIngresado2
		int 21h

		mov ah, 02
		mov dl, bh
		int 21h

		mov ah, 09h
		mov dx, offset cFinProg
		int 21h

		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
END eInicio