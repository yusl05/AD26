Mensaje MACRO cadena
    mov ah,09h
    mov dx,offset cadena
    int 21h
ENDM

CeroDos MACRO
    mov ah,02h
    mov dl,al
    int 21h
ENDM


.MODEL SMALL
.STACK 20h
.DATA
    cNombre DB 'Yushab Jesed Serrano Lopez',10,10,13,'$'
    cPrimerIngresar DB 10,13,'Ingresa el primer caracter: $'
    cPrimerIngresado DB 10,13,'El primer caracter que ingresaste es: $'

    cSegundoIngresar DB 10,13,'Ingresa el segundo caracter: $'
    cSegundoIngresado DB 10,13,'El segundo caracter que ingresaste es: $'

    cTerceroIngresar DB 10,13,'Ingresa el tercer caracter: $'
    cTerceroIngresado DB 10,13,'El tercer caracter que ingresaste es: $'

.CODE
eInicio:
    mov ax,@DATA
    mov ds,ax

    Mensaje cNombre
    Mensaje cPrimerIngresar
    call CeroUno
    Mensaje cPrimerIngresado
    CeroDos


    Mensaje cSegundoIngresar
    call CeroUno
    Mensaje cSegundoIngresado
    CeroDos


    Mensaje cTerceroIngresar
    call CeroUno
    Mensaje cTerceroIngresado
    CeroDos

    mov ah,08h
    int 21h

    mov ax,4c00h
    int 21h

CeroUno PROC Near
    mov ah,01h
    int 21h
    ret
CeroUno ENDP

END eInicio