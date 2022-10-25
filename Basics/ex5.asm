global _start

section .data
    addr db "yellow"        ;addr short for address pointer to a memory address

section .text
_start:
    mov [addr], byte 'H'    ;moving some data into [addr], byte 'H' -> we are moving the byte representation of 'H' into the addr
    mov [addr+5], byte '!'  ;[addr] will replace the first character, addr+5 will add to the 6th character
    mov eax,4               ;sys_write system call
    mov ebx,1               ;stdout file descriptor
    mov ecx,addr            ;bytes to write
    mov edx,6               ;number of bytes to write
    int 0x80                ;perfom system call
    mov eax,1               ;sys_exit system call
    mov ebx,0               ;exit status is 0
    int 0x80