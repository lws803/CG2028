global start
section .text
start:

a db 25 ; define byte a = 25
b db 5 ; define byte b = 5
c db 00 ; our supposed output

mov ax, @data
mov ds, ax ; this is the output
mov al, a
mov bl, b
add al, bl ; add the values of register a and b
mov c, al

mov bl, c

mov ax, 4c00h
int 21h

; Execute this:
; nasm -f macho64 helloworld.asm && ld -macosx_version_min 10.7.0 -lSystem -o helloworld helloworld.o && ./helloworld
