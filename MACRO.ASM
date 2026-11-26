Datos MACRO
    mov ax,@DATA
    mov ds,ax
ENDM

Mensaje MACRO
    mov ah,09h
    int 21h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que utiliza macros y procedimientos',10,10,13,'$'
    cFinProg DB 10,13,'***Fin del programa***$'
.CODE
eInicio:
    Datos
    mov dx,offset cDescrip
    Mensaje
    mov dx,offset cFinProg
    Mensaje
    call Readkey
    call ControlDos

    Readkey PROC Near
        mov ah,08h
        int 21h
        ret
    Readkey ENDP
    ControlDos PROC Near
        mov ax,4c00h
        int 21h
    ControlDos ENDP

END eInicio