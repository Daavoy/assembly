global _start

section .data   ;allows us to inline data into the program which we can access
    msg db "Hello, world!", 0x0a ;0x0a is hex for 10, and is code for newline
    len equ $ - msg ;determine the length of the string by subtracting the location of the start of the string
                    ;by the location of after the string

section .text ; where our code should be
_start:
    mov eax, 4      ;sys_write system call
    mov ebx, 1      ;stdout file descriptor
    mov ecx, msg    ;bytes to write
    mov edx, len    ;number of bytes to write
    int 0x80        ;perform system call
    mov eax, 1      ;sys_exit system call
    mov ebx, 0      ;exit status is 0
    int 0x80