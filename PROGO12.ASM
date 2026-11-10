;Yushab Jesed Serrano López
;30 de septiembre de 2026

.MODEL SMALL
.STACK 100h
.DATA
	cDescrip 	DB 'Programa que lee un carscter y al finalizar, muestra el caracter en pantalla',10,13,'$'
	cIngresar 	DB 'Ingrese un caracter: $'
	cFinProg	DB 10,13,'El programa ha finalizado, presiona ENTER para terminar$'
	cIngresado	DB 10,13,'El caracter ingresado fue: $'

.CODE
	eInicio:
		mov ax, @Data	;mov dx, @Data
		mov ds, ax

		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01h	;lee un caracter desde el teclado
		int 21h
		mov bl, al

		mov ah, 09h
		mov dx, offset cIngresado
		int 21h

		mov ah, 02
		mov dl, bl
		int 21h

		mov ah, 09h
		mov dx, offset cFinProg
		int 21h

		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
END eInicio










		