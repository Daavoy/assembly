global _start

_start:
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80

func:
    ;The prologue of the function
    push ebp                ;IMPORTANT preserves the value in case any other code wants to use it
    mov ebp, esp
    sub esp, 2



    mov[esp], byte 'H'
    mov[esp+1], byte 'i'
    mov eax, 4              ;sys_write system call
    mov ebx, 1              ;stdout file descriptor
    mov ecx, esp            ;bytes to write
    mov edx, 2              ;number of bytes to write
    int 0x80                ;perform system call
    
    ;The epilogue of the function
    mov esp, ebp            ;puts the stack back into the state it was when we called func
    pop ebp                 ;IMPORTANT
    ret