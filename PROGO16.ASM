.MODEL SMALL
.STACK 100h
.DATA

    cDescrip    DB 'Programa que lee tres numeros y determina cual es el mayor', 10,13, '$'
    cIngresar1  DB 10, 13, 'Ingrese el primer numero: $'
    cIngresar2  DB 10, 13, 'Ingrese el segundo numero: $'
    cIngresar3  DB 10, 13, 'Ingrese el tercer numero: $'
    cPrimer     DB 10, 13, 'El primer numero es el mayor$'
    cSegundo    DB 10, 13, 'El segundo numero es el mayor$'
    cTercero    DB 10, 13, 'El tercer numero es el mayor$'
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

        mov ah, 09h
        mov dx, offset cIngresar3
        int 21h

        mov ah, 01h
        int 21h
        mov cl, al

        ;Comporacion de primeros dos digitos
        cmp bl, bh
        ja eCompararTercero

        ;Comprobacion de segundo con tercero
        cmp bh, cl
        ja eSegundo
        jmp eTercero

    eCompararTercero:
        cmp bl, cl
        ja ePrimer
        jmp eTercero

    ePrimer:
        mov ah, 09
        mov dx, offset cPrimer
        int 21h
        jmp eFinProg

    eSegundo:
        mov ah, 09
        mov dx, offset cSegundo
        int 21h
        jmp eFinProg

    eTercero:
        mov ah, 09
        mov dx, offset cTercero
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