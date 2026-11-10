.MODEL SMALL
.STACK 100h
.DATA

	cDescrip	DB 'Programa que valida si un caracter es vocal mayuscula',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	
	cSiEsVocal	DB 10,13,'El caracter ingresado ES una vocal mayuscula$'
	cNoEsVocal	DB 10,13,'El caracter ingresado NO es una vocal mayuscula$'
	
	cFinProg	DB 10,13,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'

.CODE
	eInicio:
		; Inicialización del segmento de datos
		mov ax, @Data
		mov ds, ax

		; Imprimir descripción del programa
		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		; Imprimir mensaje de solicitud de carácter
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		; Leer carácter desde el teclado (se guarda automáticamente en AL)
		mov ah, 01h
		int 21h

		; ==========================================
		; Validación de vocales mayúsculas
		; ==========================================
		cmp al, 41h             ; Compara con 'A'
		je eEsVocalMayuscula

		cmp al, 45h             ; Compara con 'E'
		je eEsVocalMayuscula

		cmp al, 49h             ; Compara con 'I'
		je eEsVocalMayuscula

		cmp al, 4Fh             ; Compara con 'O'
		je eEsVocalMayuscula

		cmp al, 55h             ; Compara con 'U'
		je eEsVocalMayuscula

		; Si no saltó en ninguna comparación anterior, no es vocal mayúscula
		jmp eNoEsVocal

	eEsVocalMayuscula:
		mov ah, 09h
		mov dx, offset cSiEsVocal
		int 21h
		jmp eFinProg

	eNoEsVocal:
		mov ah, 09h
		mov dx, offset cNoEsVocal
		int 21h

	eFinProg:
		; Mensaje de terminación
		mov ah, 09h
		mov dx, offset cFinProg
		int 21h
		
		; Pausa silenciosa (espera una tecla para cerrar)
		mov ah, 08h             
		int 21h

		; Salida limpia al sistema operativo
		mov ax, 4c00h
		int 21h

END eInicio

END eInicio