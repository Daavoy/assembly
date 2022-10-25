global _start   ;makes an identifier avaliable to the user
_start:         ;is an identifier -> makes it a label
    mov eax, 1  ;moves the value 1 into eax
    mov ebx, 42 ;is the exit status
    sub ebx, 29 ;performs a subtraction - is done inplace
    int 0x80    ;transfers control to an interrupt hanlder, decided by eax handler