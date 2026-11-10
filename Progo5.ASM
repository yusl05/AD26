;Programa que lee un caracter desde teclado y determina si el
; caracter ingresado es una 'a' minuscula
; Incorpora instrucciones cmp y saltos je, jmp
; Yushab Jesed Serrano Lopez
; 23 de septiembre de 2026

.MODEL SMALL
.STACK 20h
.DATA
	cDescrip	DB 'Programa que lee un caracter y determina si es una "a"', 10, 10, 13, '$'
	cIngresar	DB 'Ingrese un caracter: $'
	cFinProg	DB 10,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'
	cSiEsA		DB 10,13,'El caracter ingresado es una "a" minuscula$'

.CODE
eInicio:
    mov ax, @Data
    mov ds, ax

    mov ah, 09h
    mov dx, offset cDescrip
    int 21h

    mov ah, 09h
    mov dx, offset cIngresar
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 61h
    je  eSiEsA

    jmp eFinProg        ; <-- Se cambia cFinProg por la etiqueta eFinProg

eSiEsA:
    mov ah, 09h
    mov dx, offset cSiEsA
    int 21h

eFinProg:               ; <-- Bloque de salida completo
    mov ah, 09h
    mov dx, offset cFinProg
    int 21h

    mov ax, 4C00h
    int 21h

END eInicio