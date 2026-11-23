.MODEL SMALL 
.STACK 20H
.DATA

    cDescrip    DB  'Programa para practicar AAA',10,10,13,'$'
    cIngresa1   DB  10,10,13,'Ingrese el primer digito: $'
    cIngresa2   DB  10,10,13,'Ingrese el segundo digito: $'
    cResultado  DB  10,10,13,'El resultado de la suma con es: $'
    cFinProg    DB  10,10,13,'EL programa ha finalizado, presiona enter para salir$'

.CODE

eInicio:
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 09h
    mov dx, offset  cDescrip
    int 21h

    mov ah, 09h
    mov dx, offset cIngresa1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al

    mov ah, 09h
    mov dx, offset cIngresa2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    mov ax, 0000h
    mov al, bh
    add al, bl
    aaa

    mov bx, ax

    mov ah, 09h
    mov dx, offset cResultado
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
    mov dx, offset cFinProg
    int 21h

    mov ah, 08h
    int 21h

    mov ax, 4c00h
    int 21h

end eInicio 
