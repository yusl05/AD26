.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'programa que imprime numeros de dos en dos',10,10,13,'$'
	cIngresa	DB 'Ingrese un numero: ',10,10,13,'$'
    cEspacio    DB ' $'
    cSalto      DB '',10,10,13,'$'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado, presiona enter para continuar  $'
	vNum DB 0

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cIngresa
		int 21h

		mov ah,01h
		int 21h
        sub al, 30h
		mov vNum, al

        mov bl, 00
        mov bh, 00

		mov cl, 00

    	eCiclo:
			cmp cl, 01
			je eFinProg

            cmp bl, 09
            ja eAjuste

            mov ah,09h
			mov dx,offset cEspacio
			int 21h

            mov ah, 02h
			mov dl, bh
			add dl, 30h
			int 21h

            mov ah, 02h
			mov dl, bl
			add dl, 30h
			int 21h

            mov ah, 09h
            mov dx, offset cEspacio
            int 21h

            add bl, vNum

			cmp bh, 09
			je eCompBl

			jmp eCiclo

        eAjuste:
            sub bl, 10
            add bh, 01
            jmp eCiclo
            mov ah, 09h
            mov dx, offset cSalto
            int 21h

		eCompBl:
            cmp bl, 08
            je eAjusteDec
            jmp eCiclo

		eAjusteDec
			sub bl, 08
			sub bh, 09
			inc cl
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