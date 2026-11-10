.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'promagrama que solicita ingresar dos numeros de hasta dos cifras y al '
			    DB 'final muestra el resultado de la suma usando',10,10,13,'$'
	cIngresar 	DB 10,0,13,'Ingresar el numero: $'
	cResultado	DB 10,10,13,'El resultado de la suma es: $'
	cFinProg 	DB 10,10,13,'eL Programa ha finalizado,presiona enter para continuar  $'

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01h
		int 21h
        sub al, 30h
		mov bh,al

        mov ah, 01h
		int 21h
        sub al, 30h
		mov bl,al
		
		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah, 01h
		int 21h
        sub al, 30h
		mov ch,al

        mov ah, 01h
		int 21h
        sub al, 30h
		mov cl,al
	
        add bh, ch

        cmp bh, 09
        ja eCentena
        
        add bl, cl

        cmp bl, 09
        ja eDecena

        jmp eSalida

        eDecena:
        sub bl, 10
        add bh, 01

        mov ch, 00
        jmp eSalida

        eCentena:
        sub bh, 10
        mov ch, 01    
        
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
			mov dl,bh
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