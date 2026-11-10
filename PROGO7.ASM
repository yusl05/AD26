.MODEL SMALL
.STACK 20h
.DATA
	cDescrip	 DB 'Programa que lee un caracter  y determina si es o no es NUMERO', 10, 10, 13, '$'
	cIngresar	 DB 'ingresa un caracter: $'
	cFinProg	 DB 10, 10, 13,'"El programa a finalizado, presiona ENTER paraterminar"$'
	cSiEsNum	DB 10, 13,'El caracter ingresado es numero$'
	cNoEsNum	DB 10, 13,'El caracter ingresado  NO es numero$'
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

	mov ah, 01	
	int 21h

cmp al, 30h
jb	eNoEsNum
cmp al, 39h
jbe	eSiEsNum
jmp eNoEsNum

eSiEsNum:
	mov ah, 09h
	mov dx, offset cSiEsNum
	int 21h
	jmp eFinProg

eNoEsNum:
	mov ah, 09h
	mov dx, offset cNoEsNum
	int 21h
	;

eFinProg:
	mov ah, 09h
	mov dx, offset cFinProg
	int 21h

mov ah, 08h
int 21h
mov ax, 4c00h
int 21h
   
	END eInicio