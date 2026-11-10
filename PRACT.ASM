.MODEL SMALL
.STACK 100h
.DATA

    cDescrip    DB 'Practica 1', 10, 13,'Completar las dos palabras', 10,13, 'HOL_ MUND_', 10,13, '$'
    cIngresar1  DB 10, 13, 'Ingrese la primera letra: $'
    cIngresar2  DB 10, 13, 'Ingrese la segunda letra: $'
    cPrimera    DB 10, 13, 'Se acerto una palabra "HOLA"$'
    cSeguda     DB 10, 13, 'Se acerto una palabra "MUNDO"$'
    cPrimeraF   DB 10, 13, 'No acerto la palabra "HOLA"$'
    cSegudaF    DB 10, 13, 'No acerto la palabra "MUNDO"$'
    cFinProg	DB 10, 13,'El programa ha finalizado, presiona ENTER para terminar$'

.CODE
    eInicio:
        mov ax,  @Data
        mov ds, ax

        mov ah, 09h
        mov dx, offset cDescrip
        int 21h

        mov ah, 09h
        mov dx, offset cIngresar1
        int 21h

        mov ah, 01h
        int 21h
        mov bl, al

        ;Comprobacion primera letra
        cmp bl, 'A'
        jne ePrimeraF

        mov ah, 09h
        mov dx, offset cPrimera
        int 21h
        jmp ePaso2

    ePrimeraF:
        mov ah, 09h
        mov dx, offset cPrimeraF
        int 21h

    ePaso2:
        mov ah, 09h
        mov dx, offset cIngresar2
        int 21h

        mov ah, 01h
        int 21h
        mov bl, al

        ;Comprobacion segunda letra
        cmp bl, 'O'
        jne eSegundaF

        mov ah, 09h
        mov dx, offset cSeguda
        int 21h
        jmp eFinProg

    eSegundaF:
        mov ah, 09h
        mov dx, offset cSegudaF
        int 21h
        jmp eFinProg

    eFinProg:
    mov ah, 09h
		mov dx, offset cFinProg
		int 21h

		mov ah, 08h
		int 21h

		mov ax, 4c00h
		int 21h
	END eInicio




