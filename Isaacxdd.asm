.MODEL SMALL
.STACK 20h
.DATA

        cDescrip DB 'El programa muestra la secuencia de 2',10,10,13,'$'
        cFinProg DB '***El programa ah finalizado***$'
        cComa   DB ',$'

.CODE
    eInicio:

    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ch,00
    mov cl,02
    mov bh,01

    eCiclo:

        cmp ch,00
        je esMenor

        mov ah,02h
        mov dl,ch
        add dl,30h
        int 21h

        esMenor:
        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h

        mov ah,09h
        mov dx,offset cComa
        int 21h


        mov ah,ch
        mov al,cl

        add al,02
        aaa

        mov ch,ah
        mov cl,al

        inc bh



    cmp bh,49
    jbe eCiclo



    eFinProg:
        mov ah,09h
        mov dx,offset cFinProg
        int 21h

        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h





    END eInicio