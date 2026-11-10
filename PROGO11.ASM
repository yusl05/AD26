.MODEL SMALL
.STACK 100h
.DATA

	cDescrip		DB 'Programa que verifica si una calificacion es aprobatoria o no',10,13,'$'
	cIngresar		DB 'Ingresa una calificacion (0-9): $'
	cEsAprobatoria		DB 10,13,'La calificacion ES aprobatoria$'
	cNoEsAprobatoria	DB 10,13,'La calificacion NO es aprobatoria$'
	cNoValido		DB 10,13,'El caracter ingresado NO es valido$'
	cDiez			DB 10,13,'El alumno saco 10$'
	cFinProg		DB 10,13,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'

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

		; Validar si es menor a '0' (30h)
		cmp al, 30h
		jb eNoValido

		; Validar si es 10
		cmp al, 41h
		je eDiez

		; Validar si es mayor a '9' (39h)
		cmp al, 39h
		ja eNoValido

		; Si llegó aquí, es un número entre '0' y '9'
		; Validar si es mayor o igual a '6' (36h)
		cmp al, 36h
		jae eImprimirAprobatoria

		; Si es menor a '6', es reprobatoria
		jmp eImprimirReprobatoria

	eImprimirAprobatoria:
		mov ah, 09h
		mov dx, offset cEsAprobatoria
		int 21h
		jmp eFinProg

	eImprimirReprobatoria:
		mov ah, 09h
		mov dx, offset cNoEsAprobatoria
		int 21h
		jmp eFinProg
	
	eDiez:
		mov ah, 09h
		mov dx, offset cDiez
		int 21h
		jmp eFinProg

	eNoValido:
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