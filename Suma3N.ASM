.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'promagrama que solicita ingresar tres dígitos de una cifra y al '
			    DB 'final muestra el resultado de la suma de los mismos',10,10,13,'$'
	cIngresar 	DB 10,0,13,'Ingresar un digito de una cifra: $'
	cResultado	DB 10,10,13,'El resultado de la suma de los digitos es $'
	cFinProg 	DB 10,10,13,'eL Programa ha finalizado,presiona enter para continuar  $'

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01h
		int 21h
        sub al, 30h
		mov bl, al
		
		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01h
		int 21h
        sub al, 30h
		mov bh, al

		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01h
		int 21h
        sub al, 30h
		mov cl, al

		add bl, bh
		add bl, cl
		
        cmp bl, 19
        ja eAcarreo2

        cmp bl, 9
        ja eAcarreo1
        
		mov ch, 0
		jmp eSalida

		eAcarreo2:
			sub bl, 14h
			mov ch, 2
			jmp eSalida

        eAcarreo1:
			sub bl, 0Ah
			mov ch, 1
			jmp eSalida

		eSalida:
			mov ah,09h
			mov dx,offset cResultado
			int 21h

            mov ah,02h
			mov dl,ch
			add dl,30h
			int 21h

			mov ah,02h
			mov dl,bl
			add dl,30h
			int 21h
            jmp eFinProg

		eFinProg:

			mov ah,09h
			mov  dx,offset cFinProg
			int 21h
		
			mov ah, 08h
		    int 21h

		    mov ax, 4c00h
		    int 21h
	END eInicio