#Author: Daniele Finadri

.data

prompt:            .asciz           "Inserisci la stringa:\n"
prompt2:           .asciz           "Inserisci il carattere da cercare: "
end:               .asciz           "\nNumero di ricorrenze del carattere: "
str:               .space           51
char:              .space           2


.text
.globl main
main:
	la a0, prompt
	li a7, 4
	ecall
	
	la a0, str
	li a1, 51
	li a7, 8
	ecall
	
	la a0, prompt2
	li a7, 4
	ecall
	
	la a0, char
	li a1, 2
	li a7, 8
	ecall
	
	la a1, str
	jal search
	
	mv t0, a0
	
	la a0, end
	li a7, 4
	ecall
	
	mv a0, t0
	li a7, 1
	ecall
	
	li a7, 10
	ecall

search:
	
	lbu t0, 0(a0)         
	li a0, 0 
	li t2, '\n'             
loop:
	lbu t1, 0(a1)
	beqz t1, return
	beq t1, t2, return
	beq t0, t1, increase
	j next
increase:
	addi a0, a0, 1
	
next:
	addi a1, a1, 1
	j loop
return:
	jr ra








