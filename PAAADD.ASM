.MODEL SMALL
.STACK 100H
.DATA
    cNum1       DB  10,13,'Primer numero (2 digitos, ej. 28): $'
    cNum2       DB  10,13,'Segundo numero (2 digitos, ej. 47): $'
    msgRes      DB  10,13,'Resultado: $'
    uRes        DB  0
    dRes        DB  0
    centRes     DB  0

.CODE
eInicio:
    mov ax, @DATA
    mov ds, ax

    ; --- Leer primer numero de 2 digitos en BH (decena) y BL (unidad) ---
    mov ah, 09h
    mov dx, offset cNum1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    ; --- Leer segundo numero de 2 digitos en CH (decena) y CL (unidad) ---
    mov ah, 09h
    mov dx, offset cNum2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov ch, al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    ; --- 1. Sumar unidades: BL + CL ---
    mov ax, 0000h
    mov al, bl
    add al, cl
    aaa
    mov uRes, al
    mov dl, ah

    ; --- 2. Sumar decenas: BH + CH + acarreo previo (DL) ---
    mov ax, 0000h
    mov al, bh
    add al, ch
    add al, dl
    aaa
    mov dRes, al
    mov centRes, ah

    ; --- Imprimir resultado ---
    mov ah, 09h
    mov dx, offset msgRes
    int 21h

    mov ah, 02h
    mov dl, centRes
    add dl, 30h
    int 21h

    mov dl, dRes
    add dl, 30h
    int 21h

    mov dl, uRes
    add dl, 30h
    int 21h

    mov ax, 4C00h
    int 21h
END eInicio