.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'programa que imprime la tabla de multiplicar del numero 2',10,10,13,'$'
	cResultado	DB 10,10,13,'2 X $'
    cIgual      DB '= $'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado,presiona enter para continuar  $'

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

        mov bl, 00
        mov bh, 00

        mov ch, 0
        mov cl, 0

    	eCiclo:
            cmp bl, 09
            ja eAjuste

            cmp cl, 09
            ja eAjusteDiez

            mov ah,09h
			mov dx,offset cResultado
			int 21h

			mov ah, 02h
			mov dl, ch
			add dl, 30h
			int 21h

            mov ah, 02h
			mov dl, cl
			add dl, 30h
			int 21h

            mov ah,09h
			mov dx,offset cIgual
			int 21h

            mov ah, 02h
			mov dl, bh
			add dl, 30h
			int 21h

            mov ah, 02h
			mov dl, bl
			add dl, 30h
			int 21h

            add bl, 02
            
            inc cl

			cmp ch, 01
			je eFinProg

			jmp eCiclo

        eAjuste:
            sub bl, 10
            add bh, 01
            jmp eCiclo

		eAjusteDiez:
            sub cl, 10
            add ch, 01
            jmp eCiclo

		eFinProg:

			mov ah,09h
			mov  dx,offset cFinProg
			int 21h
		
			mov ah, 08h
		    int 21h

		    mov ax, 4c00h
		    int 21h
	END eInicio