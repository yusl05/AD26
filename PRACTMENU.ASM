.MODEL SMALL
.STACK 100h
.DATA

    cDescrip    DB 'Practica 2', 10, 13,'MENU YJSL', 10,13, '$'
    cMenu       DB '1. ADIVINA EL NUMERO', 10, 13, '2. SUMA', 10, 13, '3. resta ', 10, 13, '4. SALIR', 10, 13, '$'
    cIngresar   DB 10, 13, 'Ingrese el numero de la opcion que desee seleccionar: $'
    cInvalido   DB 10, 13, 'El caracter ingresado es invalido, porfavor escriba uno de lus numeros de las opciones$'
    cAdivina    DB 10, 13, 'Selecciono adivina el numero$'
    cSuma       DB 10, 13, 'Selecciono suma$'
    cResta      DB 10, 13, 'Selecciono resta$'
    cFinProg	DB 10, 13,'El programa ha finalizado, presiona ENTER para terminar$'

.CODE
    eInicio:
        mov ax,  @Data
        mov ds, ax

        mov ah, 09h
        mov dx, offset cDescrip
        int 21h

        mov ah, 09h
        mov dx, offset cMenu
        int 21h

        mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01h
		int 21h
		mov bl, al

        ;leer las opciones
        ;Adivina un numero
        cmp bl, '1'
        je eAdivina

        ;Suma
        cmp bl, '2'
        je eAdivina

        ;Resta
        cmp bl, '3'
        je eAdivina

        ;Salir
        cmp bl, '4'
        je eFinProg

        mov ah, 09h
        mov dx, offset cInvalido
        int 21h
        jmp eFinProg

        eAdivina:
            mov ah, 09h
            mov dx, offset cAdivina
            int 21h
            jmp eFinProg
        
        eSuma:
            mov ah, 09h
            mov dx, offset cSuma
            int 21h
            jmp eFinProg

        eResta:
            mov ah, 09h
            mov dx, offset cResta
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

