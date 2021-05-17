#Author Daniele Finadri

.data
prompt: .asciz "Please enter your name: "
result: .asciz "Your name in capital letters is: "
strSpace: .space 31

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

li a7, 8
la a0, strSpace
li a1, 31
ecall
la a0, result
li a7, 4
ecall
la t0, strSpace
li t1, 'a'
li t2, 'z'

loopConversion:
lbu t3, 0(t0)
beqz t3, exit
blt t3, t1, continue
bgt t3, t2, continue
addi t3, t3, -32
sb t3, (t0)
continue:
addi t0, t0, 1
j loopConversion

exit:
la a0, strSpace
li a7, 4
ecall

li a7, 10
ecall
