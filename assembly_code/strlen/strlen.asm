global _start

section .data

test_string: db "abcdef", 0

section .text

strlen:			; por convenção, o primeiro e único argumento
  				; é obtido de rdi
  xor rax, rax	; rax armazenará o tamanho da string. Se não for 
  				; zerado antes, seu valor será totalmente aleatório

.loop:			; o laço principal começa aqui
  				; Verifica se o símbolo atual é o finalizador nulo.
  cmp byte [rdi+rax], 0 
  				; o modificador 'byte', indica que parte à esquerda
  				; e à direita de cmp devem ter o mesmo tamanho.
  				; o operador à direita é imediato e não contém
  				; nenhuma informação sobre o seu tamanho, desse
  				; modo, não sabemos quantos bytes devem ser
  				; obtidos da memória e comparados com zero
  je .end		; Jump se o finalizador nulo foi encontrado
  inc rax		; Caso contrário, vai para o próximo símbolo
  				; e incrementa o contador
  jmp .loop
  
.end:
  ret			; Quando 'ret' for alcançado, rax deverá armazenar 
  				; o valor de retorno

_start:

  mov rdi, test_string
  call strlen
  mov rdi, rax
  mov rax, 60
  syscall
