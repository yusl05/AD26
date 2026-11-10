;23 de septiembre 2026
;Programa de ensamblador, que lee un caracter desde el teclado

.MODEL SMALL
.STACK 20H
.DATA
	cDescrip	DB 'Programa que lee un caracter',10,10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	cFinProg	DB 10,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'
.CODE
	eInicio:
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01
		int 21h
		
		mov ah, 09h
		mov dx, offset cFinProg
		int 21h

		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
	END eInicio
	