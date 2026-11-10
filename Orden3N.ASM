.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'promagrama que solicita ingresar tres dígitos de una cifra y los ordena',10,10,13,'$'
	cIngresar 	DB 10,0,13,'Ingresar un digito de una cifra: $'
	cEspacio 	DB ' $'
	cResultado	DB 10,10,13,'Numeros ordenados de menor a mayor: $'
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
		mov bl, al
		
		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01h
		int 21h
		mov bh, al

		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01h
		int 21h
		mov cl, al

		;Ordenamiento de numeros
        cmp bh, bl
        jb eIntercambio1
        
        jmp eComp2

        eIntercambio1:
            mov ch, bl
            mov bl, bh
            mov bh, ch
            jmp eComp2

        eComp2:
            cmp cl, bl
            jb eIntercambio2
            
            jmp eComp3

        eIntercambio2:
            mov ch, bl
            mov bl, cl
            mov cl, ch

		eComp3:
            cmp cl, bh
            jb eIntercambio3
            jmp eSalida

        eIntercambio3:
            mov ch, bh
            mov bh, cl
            mov cl, ch

		eSalida:
			mov ah,09h
			mov dx,offset cResultado
			int 21h

            mov ah,02h
			mov dl,bl
			int 21h

			mov ah,09h
			mov dx,offset cEspacio
			int 21h

			mov ah,02h
			mov dl,bh
			int 21h

			mov ah,09h
			mov dx,offset cEspacio
			int 21h

            mov ah,02h
			mov dl,cl
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