;Yushab Jesed Serrano Lopez
;Primer programa en ensamblador
;Muestra una cadena de caracteres en pantalla
;15 de Septiembre de 2026

.MODEL SMALL
.STACK 20h
.DATA
    cSaludo DB 'Hola, hoy es 15 de Septiembre de 2026!$'

.CODE
eInicio:
    mov ax, @Data
    mov ds, ax

    mov dx, offset cSaludo
    mov ah, 09h
    int 21h

    mov ah, 08h
    int 21h

    mov ax, 4c00h
    int 21h
END eInicio