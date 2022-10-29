; R E V E R S I N G
; =================
; void reverse()
; Recursively read in words, until none are found anymore.
; After the recursive calls are done, write out the word again.
reverseInputLines:
  
  call1_1 edx, readLine, input_buffer

  cmp edx, 0          ; If nothing was read, it means the
  jg there_is_input   ; input is already fully processed, i.e.
  ret                 ; that this call is finished.

there_is_input:
  

  mov eax, esp   ; Original stack pointer
  sub eax, edx   ; Enough space to store the read string
  mov ebx, 3     ; Complement of round-to-multiples-of-4 bitmask
  not ebx   
  and eax, ebx   ; Align stack location to 32-bit
  mov esp, eax   ; Allocate the space on the stack

  mov eax, 0     ; Index into the buffer 
  ; TO BE COMPLETED

 

  mov edi,0 
read_loop:
  ; Pushes ecx to the stack -> esp now contains the first string, esp 24->20
  mov ecx, [input_buffer + eax]
  mov w32FrStck(edi), ecx
  add eax,4
  inc edi
  cmp eax, edx
  jl loop
  
  push edx                ; Pushes edx to the stack -> esp contain length of string, esp 20 ->16
  call reverseInputLines
  
  
 
print:
  pop edx
  mov ecx, esp
  
  mov eax,SYS_WRITE   ; file descriptor (stdout)
  mov ebx,STDOUT      ; system call number (sys_write)
  int 0x80
  

  mov eax, esp   ; Original stack pointer
  add eax, edx   ; Enough space to store the read string
  add eax, 3     ; Complement of round-to-multiples-of-4 bitmask
  
  mov ebx,3
  not ebx   
  and eax, ebx   ; Align stack location to 32-bit
  mov esp, eax   ; Allocate the space on the stack

  mov eax,0


  mov eax,SYS_WRITE   ; file descriptor (stdout)
  mov ebx,STDOUT      ; system call number (sys_write)
  mov [input_buffer], byte LINE_SHIFT
  mov ecx, input_buffer
  mov edx,1
  int 0x80
skip:
  ret