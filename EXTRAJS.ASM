.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'Yushab Jesed Serrano Lopez - Inventario',10,10,13,' $'
    cMenu       DB 10,10,13,'MENU',10,10,13,'OPC. 1 - Surtir stock',10,10,13,'OPC. 2 - Retirar stock', 10,10,13,'OPC. 3 - Salir$'
    cIngresaO	DB 10,10,13,'Ingrese el numero de la opcion que desee ejecutar: $'
	cEntrada	DB 10,10,13,'Ingrese la cantidad de entrada: $'
    cSalida 	DB 10,10,13,'Ingrese la cantidad de salida: $'
    cSurtir		DB 10,10,13,'Cantidad de producto escasa, se recomienda surtir$'
    cCero       DB 10,10,13,'No es posible disponer de mas articulos$'
    cCantidad   DB 10,10,13,'La cantidad de articulos actual es de: $'
    cNoValida   DB 10,10,13,'Error la opcion seleccionada no es valida$'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado, presiona enter para continuar  $'
    vStock      DB 00

.CODE
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

        eCiclo:
            mov ah,09h
		    mov dx,offset cMenu
		    int 21h

            mov ah,09h
		    mov dx,offset cIngresaO
		    int 21h

            mov ah,01h
            int 21h
            sub al, 30h
            mov bl, al

            cmp bl, 01
            je eEntrada

            cmp bl, 02
            je eSalida

            cmp bl, 03
            je eFinProg

            mov ah, 09h
			mov dx, offset cNoValida
			int 21h

            jmp eCiclo

        eEntrada:
			mov ah, 09h
			mov dx, offset cEntrada
			int 21h
            
            mov ah, 01h
            int 21h
            sub al, 30h
            add vStock, al

            mov ah, 09h
            mov dx, offset cCantidad
            int 21h

            mov ah, 02h
            mov dl, vStock
            add dl, 30h
            int 21h

            cmp vStock, 03
            jbe eSurtir
            
            jmp eCiclo

        eSalida:
			mov ah, 09h
			mov dx, offset cSalida
			int 21h
            
            mov ah, 01h
            int 21h
            sub al, 30h

            cmp vStock, 00
            je eCero

            sub vStock, al       

            mov ah, 09h
            mov dx, offset cCantidad
            int 21h

            mov ah, 02h
            mov dl, vStock
            add dl, 30h
            int 21h

            cmp vStock, 03
            jbe eSurtir
            
            jmp eCiclo

        eCero:
            mov ah, 09h
            mov dx, offset cCero
            int 21h

            jmp eCiclo

        eSurtir:
			mov ah, 09h
			mov dx, offset cSurtir
			int 21h
            
            jmp eCiclo

		eFinProg:
			mov ah, 09h
			mov dx,offset cFinProg
			int 21h
		
			mov ah, 08h
		    int 21h

		    mov ax, 4c00h
		    int 21h
	END eInicio