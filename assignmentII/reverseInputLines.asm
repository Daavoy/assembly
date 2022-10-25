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
  
  inc esi   ; Counter for print loop


  mov ecx, [input_buffer] ; Moves one dword from input_buffer to ecx
  push ecx                ; Pushes ecx to the stack
  push edx                ; Pushes edx to the stack
  
  call reverseInputLines
  
  
print:

  pop edx
  pop ecx 
  
  mov [input_buffer], ecx
  mov ecx, input_buffer
  
  inc edx
  dec esi

  cmp esi,0
  dec edx

  mov eax,SYS_WRITE   ;file descriptor (stdout)
  mov ebx,STDOUT   ;system call number (sys_write)
  int 0x80

  mov [input_buffer], byte LINE_SHIFT
  mov edx,1
  int 0x80
 ; inc edx   ;adds a newline  -> last character not \n -> error need to check if last word

  add esp, 8

  cmp esi, 0
  jg print
  ;esp 18-> 1c

  
  
  mov eax,1       ;system call number (sys_exit)
  mov ebx,0
  int 0x80 
 ; call reverseInputLines




;  mov eax, esp
;  push input_buffer
;  pop eax
;  inc edi
;  call reverseInputLines
;print:
  
;  pop eax
  
;  add esp,12
;  dec edi
;  cmp edi,0
;  jge print
;  mov eax,SYS_WRITE   ;file descriptor (stdout)
;  mov ebx,STDOUT   ;system call number (sys_write)
;  int 0x80 

;  mov eax, dword input_buffer
; inc eax

  
;print:
  
;  pop edx
;  pop ecx
  
;  mov eax,SYS_WRITE   ;file descriptor (stdout)
;  mov ebx,STDOUT   ;system call number (sys_write)
;  int 0x80 

  

;  cmp edx, 0
;  jg print
  
 
  
  

  

  

 