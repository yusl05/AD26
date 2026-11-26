.MODEL SMALL
.STACK 20h
.DATA

	cDescrip 	DB 'Programa que analiza la temperatura de un refrigerador - Jesed Serrano',10,10,13,'$'
	cIngresa	DB 10,10,13,'Ingrese la temperatura $'
	cDosP   	DB ': $'
    cPromedio   DB 10,10,13,'El promedio de la temperatura es: $'
    cFueraDeR   DB 10,10,13,'La cantidad de medidas fuera de rango es: $'
    cCorrecto   DB 10,10,13,'La temperatura esta dentro del rango permitido$'
    cDebajo     DB 10,10,13,'La temperatura por debajo del rango permitido$'
    cSobre      DB 10,10,13,'La temperatura esta sobre el rango permitido$'
    cPunto      DB '.$'
	cFinProg 	DB 10,10,13,'El Programa ha finalizado, presiona enter para continuar$'
	vCont       DB 00
    vSuma       DB 00
    vFR         DB 00

.CODE

eInicio:
    mov ax, @Data
	mov ds, ax

    mov ah, 09h
	mov dx, offset cDescrip
	int 21h

eCiclo:
    cmp vCont, 04
    je eFinProg

    inc vCont

    mov ah, 09h
	mov dx, offset cIngresa
	int 21h

    mov ah, 02h
    mov dl, vCont
    add dl, 30h
    int 21h

    mov ah, 09h
	mov dx, offset cDosP
	int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    cmp bl, 02
    jb eDebajo

    cmp bl, 05
    ja eSobre

    mov ah, 09h
	mov dx, offset cCorrecto
	int 21h

eContCiclo:
    add vSuma, bl

    jmp eCiclo

eDebajo:
    mov ah, 09h
    mov dx, offset cDebajo
    int 21h
    inc vFR
    jmp eContCiclo

eSobre:
    mov ah, 09h
    mov dx, offset cSobre
    int 21h
    inc vFR
    jmp eContCiclo

eFinProg:
    mov ah, 09h
    mov dx, offset cPromedio
    int 21h

    mov bh, 04
    
    mov ah, 00
    mov al, vSuma
    div bh

    mov ch, al
    mov cl, ah

    mov ah, 02h
    mov dl, ch
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, offset cPunto
    int 21h

    mov ah, 02h
    mov dl, cl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, offset cFueraDeR
    int 21h

    mov ah, 02h
    mov dl, vFR
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, offset cFinProg
    int 21h

    mov ah, 08h
    int 21h

    mov ax, 4c00h
    int 21h
END eInicio