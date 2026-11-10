.MODEL SMALL
.STACK 100h
.DATA

    cDescrip    DB 'Practica 1', 10, 13,'Completar las dos palabras', 10,13, 'HOL_ MUND_', 10,13, '$'
    cIngresar1  DB 10, 13, 'Ingrese la primera letra: $'
    cIngresar2  DB 10, 13, 'Ingrese la segunda letra: $'
    cPrimera    DB 10, 13, 'Se acerto una palabra "HOLA"$'
    cSeguda     DB 10, 13, 'Se acerto una palabra "MUNDO"$'
    cNinguna    DB 10, 13, 'No se acerto ninguna$'
    cTodas      DB 10, 13, 'Se acertaron ambas palabras!$'

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

        mov ah, 09h
        mov dx, offset cIngresar2
        int 21h

        mov ah, 01h
        int 21h
        mov bh, al

        ;Comprobacion primera letra
        cmp bl, 'A'
        jne eVerificarSegunda
        ;Comprobacion segunda letra
        cmp bh, 'O'
        jne ePrimera

        ;Si las dos letras fueron correctas
        mov ah, 09
        mov dx, offset cTodas
        int 21h
        jmp eFinProg

    eVerificarSegunda:
        cmp bh, 'O'
        je eSegunda
        jmp eNinguna

    ePrimera:
        mov ah, 09
        mov dx, offset cPrimera
        int 21h
        jmp eFinProg

    eSegunda:
        mov ah, 09
        mov dx, offset cSeguda
        int 21h
        jmp eFinProg

    eNinguna:
        mov ah, 09
        mov dx, offset cNinguna
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




