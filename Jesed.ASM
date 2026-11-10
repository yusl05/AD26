.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'programa que solicita dos numeros y calcula la diferencia de ellos',10,10,13,'$'
	cIngresar 	DB 10,0,13,'Ingresar un digito de una cifra: $'
	cResultado	DB 10,10,13,'La diferencia de los numeros es: $'
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

		;Inicializa cl en 0
		mov cl, 0
		;Ordenamiento de numeros
        cmp bh, bl
        jb eIntercambio1
        
        jmp eDiferencia

        eIntercambio1:
            mov ch, bl
            mov bl, bh
            mov bh, ch

		eDiferencia:
			cmp bl, bh
			je eSalida
			add cl, 1
			sub bh, 1
			jmp eDiferencia

		eSalida:
			mov ah,09h
			mov dx,offset cResultado
			int 21h

            mov ah, 02h
			mov dl, cl
			add dl, 30h
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