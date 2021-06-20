#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a string: "
output: .asciz "The char in the string are: "
strSpace: .space 51

.text
.globl main
main:

li s0, '\n'
li s1, ' '
li a7, 4
la a0, prompt
ecall

li a7, 8
la a0, strSpace
li a1, 51
ecall

mv t0, a0

strLen:
lbu t1, 0(t0)
beq t1, s0, print
beqz t1, print
beq t1, s1, continue
addi t2, t2, 1
addi t0, t0, 1
j strLen

continue:
addi t0, t0, 1
j strLen

print:
li a7, 4
la a0, output
ecall 

li a7, 1
mv a0, t2
ecall

li a7, 10
ecall
