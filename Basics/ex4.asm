global _start

section .text
_start:
    mov ebx, 1      ;start ebx at 1 ->don't ever use the exit status to return a useful result. should return 0, and use stdout to return results
    mov ecx, 4      ;number of iterations  
label:
    add ebx, ebx    ;ebx += ebx
    dec ecx         ;ecx -=1
    cmp ecx, 0      ;compare ecx to 0
    jg label        ;jump to label if greater
    mov eax, 1      ;sys_exit system call
    int 0x80