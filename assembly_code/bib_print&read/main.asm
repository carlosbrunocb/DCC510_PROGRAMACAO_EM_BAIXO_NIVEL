section .data 
message: db "Olá Alunos!", 10, 0
msgInput: db "Digite um caracter: ", 0
msgInput_1: db "Digite uma palavra: ", 0
msgOutput: db "O caracter digitado foi: ", 0
msgOutput_1: db "A palavra digitada foi: ", 0

section .text
%include "lib.ioString"
global _start

_start:
  	mov rdi, message
  	call print_string
  	call print_newline

  	mov rdi, msgInput
  	call print_string
  	call read_char  
  	push rax
  
  	mov rdi, msgOutput
  	call print_string
  	pop  rdi
  	call print_char  
  	call print_newline
    call print_newline
    
    mov rdi, msgInput_1
  	call print_string    
    
  	push 0  ; alocando memória
    push 0  ; alocando memória
    mov rdi, rsp ; endereço do inicio do buffer
    mov rsi, 16  ; length to buffer
    call read_word
    push rax
    mov rdi, msgOutput_1
  	call print_string
    pop rax
    mov rdi, rax
    push rdx 		; caller saving string length
    call print_string
    call print_newline
    call print_newline

  	call exit
