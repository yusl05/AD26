.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'Yushab Jesed Serrano Lopez - Investigacion',10,10,13,' $'
    cIngresaP	DB 10,10,13,'Ingrese la cantidad de productos: $'
	cSinRec		DB 10,10,13,'Sin reconocimiento$'
    cJunior		DB 10,10,13,'La categoria obtenida fue Junior$'
    cSenior     DB 10,10,13,'La categoria obtenida fue Senior$'
    cHonorifico DB 10,10,13,'La categoria obtenida fue Honorifico$'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado, presiona enter para continuar  $'

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cIngresaP
		int 21h

		mov ah,01h
		int 21h
        sub al, 30h
		mov bh, al

		mov ah,01h
		int 21h
        sub al, 30h
		mov bl, al

        cmp bh, 01
		jae eHonorifico

		cmp bl, 03
		jbe eSinRec

		cmp bl, 06
		jbe eJunior

		cmp bl, 09
		jbe eSenior

        eSinRec:
			mov ah, 09h
			mov dx, offset cSinRec
			int 21h
            jmp eFinProg
		
		eJunior:
			mov ah, 09h
			mov dx, offset cJunior
			int 21h
            jmp eFinProg

		eSenior:
			mov ah, 09h
			mov dx, offset cSenior
			int 21h
            jmp eFinProg

		eHonorifico:
			mov ah, 09h
			mov dx, offset cHonorifico
			int 21h
            jmp eFinProg

		eFinProg:
			mov ah, 09h
			mov dx,offset cFinProg
			int 21h
		
			mov ah, 08h
		    int 21h

		    mov ax, 4c00h
		    int 21h
	END eInicio