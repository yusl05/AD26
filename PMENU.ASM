.MODEL SMALL
.STACK 20H
.DATA

    cDescrip    DB  'Suma de dos digitos',10,10,13,'$'
    cIngresa1   DB  10,10,13,'Ingrese la primera cantidad: $'
    cIngresa2   DB  10,10,13,'Ingrese la segunda cantidad: $'
    cResultado  DB  10,10,13,'El resultado de la suma es: $'
    cFinProg    DB  10,10,13,'Fin del programa, presione enter para terminar$'
    vCentenas   DB  00
    vDecenas    DB  00
    vUnidades   DB  00

.CODE

eInicio:
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 09h
    mov dx, offset cDescrip
    int 21h

    mov ah, 09h
    mov dx, offset cIngresa1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    mov ah, 09h
    mov dx, offset cIngresa2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov ch, al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    mov al, bl
    add al, cl
    aaa

    mov vUnidades, al

    mov ah, 00
    
    mov al, bh
    add al, ch
    aaa

    mov vDecenas, al
    mov vCentenas, ah

    mov ah, 09h
    mov dx, offset cResultado
    int 21h

    mov ah, 02h
    mov dl, vCentenas
    add dl, 30h
    int 21h

    mov ah, 02h
    mov dl, vDecenas
    add dl, 30h
    int 21h

    mov ah, 02h
    mov dl, vUnidades
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