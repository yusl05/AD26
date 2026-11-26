.MODEL SMALL
.STACK 20h
.DATA
    cMateria    DB  10,10,13,'Materia: Lenguajes de interfaz$'
    cDocente    DB  10,10,13,'Idalia Ruiz Arroyo$'
    cAlumno     DB  10,10,13,'Yushab Jesed Serrano Lopez$'
    cSemestre   DB  10,10,13,'AGO - DIC 2026$'
    cFinProg    DB  10,10,13,'El programa ha finalizado, presione enter para terminar$'

.CODE
eInicio:
    call Datos
    mov dx, offset cMateria 
    call mensaje
    mov dx, offset cDocente
    call mensaje
    mov dx, offset cAlumno
    call mensaje
    mov dx, offset cSemestre
    call mensaje

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

END eInicio