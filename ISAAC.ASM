.MODEL SMALL
.STACK 20h
.DATA
       cDescrip DB 'Programa que suma dos numeros con acarreo$',10,10,13
       cIngresa DB 10,10,13,'Ingresa un numero: $'
       cFinProg DB 10,10,13,'*****Fin del programa$'
        suma DB 10,10,13,'El resultado es: $'

.CODE

eInicio:

    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov bh,al

    mov ah,01h
    int 21h
    sub al,30h

    mov bl,al

    ;segundo numero
    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov ch,al

    mov ah,01h
    int 21h
    sub al,30h

    mov cl,al

    add ch,bh
    add cl,bl

    cmp cl,09
    ja eAjuste

    cmp cl,09
    jbe eContinua

    eAjuste:
        add ch,01
        sub cl,10

    eContinua:

    add ch,30h
    add cl,30h

    mov ah,09h
    mov dx,offset suma
    int 21h

    mov ah,02h
    mov dl,ch
    int 21h

    mov ah,02h
    mov dl,cl
    int 21h

    eFinProg:
        mov ah,09h
        mov dx,offset cFinProg
        int 21h

        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h
END eInicio