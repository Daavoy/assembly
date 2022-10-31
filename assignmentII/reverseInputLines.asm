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

  
read_loop:
  mov ecx, [input_buffer + eax] ; moves the first 4 bytes from input_buffer into the exc register,
                                ; increases by eax, to access the next 4 bytes
  mov w32FrStck(esi), ecx       ; reads the bytes to the stack i.e. esp+edi*4
  add eax,4                     ; Increases the eax counter by four, i.e. the next 4 bytes
  inc esi                       ; Increases the counter by one
  cmp eax, edx                  ; Will continue the loop if eax < edx, i.e. amount of read bytes is less than total amount
  jl read_loop

  mov esi,0                     ; Counter for read_loop 

  push edx                      ; Pushes edx to the stack to preserve the length of the input in the stack(memory)
  call reverseInputLines        ; Recursive call

print:
  pop edx                             ; Pops the length of the input
  mov ecx, esp                        ; Moves the address of esp into ecx
  
  ; Print
  mov eax,SYS_WRITE                   ; file descriptor (stdout)
  mov ebx,STDOUT                      ; system  call number (sys_write)
  int 0x80
  
  ; Memory deallocation
  mov eax, esp                        ; Original stack pointer
  add eax, edx                        ; Enough space to store the read string
  add eax, 3                          ; Complement of round-to-multiples-of-4 bitmask
  
  mov ebx,3
  not ebx   
  and eax, ebx                        ; Align stack location to 32-bit
  mov esp, eax                        ; Allocate the space on the stack

  ; End memory deallocation
  mov eax,0      

  mov eax,SYS_WRITE                   ; file descriptor (stdout)
  mov ebx,STDOUT                      ; system call number (sys_write)
  mov [input_buffer], byte LINE_SHIFT ; Adds a newline to the input buffer
  mov ecx, input_buffer               ; Moves the address of the input buffer into ecx
  mov edx,1
  int 0x80
  
  ret ; Returns to words-reverse
