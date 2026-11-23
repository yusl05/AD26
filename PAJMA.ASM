.MODEL SMALL
.STACK 20H
.DATA
    cDescrip    DB  'Ajuste manual',10,10,13,'$'
    cIngresa1    DB  10,10,13,'Ingrese la primera cantidad: $'
    cIngresa2    DB  10,10,13,'Ingrese la segunda cantidad: $'
    cResultado  DB  10,10,13,'El resultado es: $'
    cFinProg    DB  10,10,13,'El programa ha terminado, presion enter para finalizar$'
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

    add bl, cl

    cmp bl, 09
    jae eAjusteU

    jmp eContinua

eAjusteU:
    sub bl, 10
    mov vDecenas, 01

eContinua:
    mov vUnidades, bl

    add bh, ch

    cmp bh, 09
    jae eAjusteD

    jmp eContinua2

eAjusteD:
    sub bh, 10
    mov vCentenas, 01

eContinua2:
    add vDecenas, bh

    mov ah, 09h
    mov dx, offset cResultado
    int 21h

    mov ah, 02
    mov dl, vCentenas
    add dl, 30h
    int 21h
    
    mov ah, 02
    mov dl, vDecenas
    add dl, 30h
    int 21h
    
    mov ah, 02
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