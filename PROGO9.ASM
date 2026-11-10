.MODEL SMALL
.STACK 100h
.DATA

	cDescrip	DB 'Programa que valida si un caracter es mayuscula, minuscula o  un número',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	cEsMayuscla	DB 10,13,'El caracter ingresado ES mayuscula$'
	cEsMinuscula	DB 10,13,'El caracter ingresado ES minuscula$'
	cEsNumero	DB 10,13,'El caracter ingresado ES un numero$'
	cNoValido	DB 10,13,'El caracter ingresado NO es una letra ni un numero$'
	cFinProg	DB 10,13,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'

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

		mov ah, 01h
		int 21h

		cmp al, 30h	       ;Comprueba con 1 y 9
		jb eCheckMayus
		cmp al, 39h
		jbe eEsNumero

	eCheckMayus:
		cmp al, 41h            ; Compueba con 'A' y 'Z'
		jb eCheckMinus
		cmp al, 5Ah
		jbe eEsMayuscula

	eCheckMinus:
		cmp al, 61h             ; Compueba con 'a' y 'z'
		jb eNoEsLetra
		cmp al, 7Ah
		jbe eEsMinuscula

		jmp eNoEsLetra

	eEsNumero:
		mov ah, 09h
		mov dx, offset cEsNumero
		int 21h
		jmp eFinProg

	eEsMayuscula:
		mov ah, 09h
		mov dx, offset cEsMayuscla
		int 21h
		jmp eFinProg

	eEsMinuscula:
		mov ah, 09h
		mov dx, offset cEsMinuscula
		int 21h
		jmp eFinProg

	eNoEsLetra:
		mov ah, 09h
		mov dx, offset cNoValido
		int 21h

	eFinProg:
		mov ah, 09h
		mov dx, offset cFinProg
		int 21h
		
		mov ah, 08h             
		int 21h

		mov ax, 4c00h
		int 21h

END eInicio