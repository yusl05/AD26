.MODEL SMALL
.STACK 20h
.DATA
    cDescrip    DB  'Programa que utiliza procedimientos',10,10,13,'$'
    cFinProg    DB  10,10,13,'El programa ha finalizado, presione enter para terminar$'

.CODE
eInicio:
    call Datos
    call ImprimirDescrip
    call ImprimirFin
    call Salida

    ;Declaración de procedimientos

    Datos PROC Near
        mov ax,@DATA
        mov ds, ax
        ret
    Datos ENDP

    Salida PROC Near
        mov ah, 08h
        int 21h

        mov ax, 4c00h
        int 21h
        ret
    Salida ENDP

    ImprimirDescrip PROC Near
        mov ah, 09h
        mov dx, offset cDescrip
        int 21h
        ret
    ImprimirDescrip ENDP

    ImprimirFin PROC Near
        mov ah, 09h
        mov dx, offset cFinProg
        int 21h
    ImprimirFin ENDP


END eInicio