#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a number: "
output: .asciz "The factorial of the number is: "

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 5
ecall
addi a0, a0, -1
li a1, 1

loopFact:
beqz a0, print
mul t1, a0, a1
add a1, a1, t1
addi a0, a0, -1
j loopFact

print:
la a0, output
li a7, 4
ecall
mv a0, a1
li a7, 1
ecall

li a7, 10
ecall