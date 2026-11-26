Datos MACRO
    mov ax,@DATA
    mov ds,ax
ENDM

Mensaje MACRO par1
    mov ah,09h
    mov dx,offset par1
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
    Mensaje cDescrip
    Mensaje cFinProg
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
        ret
    ControlDos ENDP

END eInicio