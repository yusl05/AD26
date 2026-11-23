.MODEL SMALL
.STACK 20H
.DATA

    cDescrip1   DB 'Primer estudio examen U2',10,10,13,'$'
    cDescrip2   DB 10,10,13,'Programa que calcula primedio de calificaciones$'
    cIngresaN   DB 10,10,13,'Ingrese la cantidad de calificaicones que desea calcular: $'
    cIngresaC   DB 10,10,13,'Ingrese la calificacion $'
    cDosP       DB ': $'
    cProm       DB 10,10,13,'El promedio de la calificacion es: $'
    cPunto      DB '.$'
    cFinProg    DB 10,10,13,'EL programa ha finalizado, presione esnter para salir$'

    vCont       DB 00

.CODE

eInicio:
    mov ax, @DATA
    mov ds, ax

    mov ah, 09h
    mov dx, offset cDescrip1
    int 21h

    mov ah, 09h
    mov dx, offset cDescrip2
    int 21h

    mov ah, 09h
    mov dx, offset cIngresaN
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    mov bl, 00

eCiclo:
    cmp vCont, cl
    je eFinProg

    inc vCont

    mov ah, 09h
    mov dx, offset cIngresaC
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
    add bl, al

    jmp eCiclo

eFinProg:
    mov ah, 00
    mov al, bl
    div cl

    mov bh, 00
    mov bh, ah

    mov ah, 09h
    mov dx, offset cProm
    int 21h

    mov ah, 02h
    mov dl, al
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, offset cPunto
    int 21h
    
    mov ah, 02h
    mov dl, bh
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





