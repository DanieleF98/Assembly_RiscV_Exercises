#Author: Daniele Fiandri 863001304

.data
prompt: .asciz "Please insert a string: "
output: .asciz "Your string is: "

.text
.globl main
main:
addi sp, sp, -25

li a7, 4 
la a0, prompt
ecall

li a7, 8
li a1, 24
mv a0, sp
ecall

li a7, 4
la a0, output
ecall
mv a0, sp
ecall
addi sp, sp, 25
li a7, 10
ecall