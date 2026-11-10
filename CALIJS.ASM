.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'Yushab Jesed Serrano Lopez - Programa que captura calificaciones',10,10,13,' $'
	cIngresa	DB 10,10,13,'Ingrese la cantidad de calificaiones a evaluar: $'
    cIngresaC	DB 10,10,13,'Ingrese la calificacion: $'
    cAprobados	DB 10,10,13,'La cantidad de aprobados fue: $'
    cReprobados	DB 10,10,13,'La cantidad de reprobados fue: $'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado, presiona enter para continuar  $'
	vNum        DB 0
    vAux        DB 0

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

    	eCiclo:
			cmp vNum, 00
			je eFinProg

            mov ah,09h
			mov dx,offset cIngresaC
			int 21h

            mov ah, 01h
		    int 21h
            sub al, 30h
		    mov vAux, al
            
            cmp vAux, 06
            ja eAprobatoria

            inc bh

        eCiclo2:
            sub vNum, 1

			jmp eCiclo

        eAprobatoria:
            inc bl
            jmp eCiclo2

		eFinProg:
            mov ah, 09h
            mov dx, offset cAprobados
            int 21h

            mov ah, 02h
            mov dl, bl
			add dl, 30h
            int 21h

            mov ah, 09h
            mov dx, offset cReprobados
            int 21h

            mov ah, 02h
            mov dl, bh
			add dl, 30h
            int 21h

			mov ah, 09h
			mov dx,offset cFinProg
			int 21h
		
			mov ah, 08h
		    int 21h

		    mov ax, 4c00h
		    int 21h
	END eInicio