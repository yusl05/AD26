.MODEL SMALL
.STACK 20h
.DATA
    cDescrip    DB  'Programa que utiliza procedimientos',10,10,13,'$'
    cFinProg    DB  10,10,13,'El programa ha finalizado, presione enter para terminar$'

.CODE
eInicio:
    call Datos
    mov dx, offset cDescrip
    call mensaje
    mov dx, offset cFinProg
    call mensaje
    call ReadKey 
    call ControlDos

    Datos PROC Near
        mov ax,@DATA
        mov ds, ax
        ret
    Datos ENDP

    Mensaje PROC Near
        mov ah, 09h
        int 21h
        ret
    Mensaje ENDP

    ReadKey PROC Near
        mov ah, 08h
        int 21h

        mov ax, 4c00h
        int 21h
        ret
    ReadKey ENDP

END eInicio