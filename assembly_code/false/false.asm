global _start

section .text
_start:
	mov rdi, 0 	; valor que será retornado
	mov rax, 60
	syscall
