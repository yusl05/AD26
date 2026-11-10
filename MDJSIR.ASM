.MODEL SMALL
.STACK 20H 
.DATA

    cDescrip    DB 'Multiplicacion y division Jesed Serrano e Isaac Romero', 10,10,13,'$'
    cFinProg    DB 10,10,13,'El programa ha finalizado, presione enter para salir$'
    cIngresa1   DB 10,10,13,'Ingrese el primer numero: $'
    cIngresa2   DB 10,10,13,'Ingrese el segundo numero: $'
    cResM       DB 10,10,13,'El resultado de la multiplicacion es: $'
    cResD       DB 10,10,13,'El resultado de la division es: $'

    vResM       DB 00  
    vResD        DB 00  

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
    mov ch, al

    mov ah, 09h
    mov dx, offset cIngresa2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    mov al, ch
    mul cl

    mov vResM, al

    mov ah, 00
    mov al, ch
    div cl

    mov vResD, al

    mov ah, 09h
    mov dx, offset cResM
    int 21h

    mov ah, 02h
    mov dl, vResM
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, offset cResD
    int 21h

    mov ah, 02h
    mov dl, vResD
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