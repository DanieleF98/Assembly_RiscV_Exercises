#Author: Daniele Finadri 863001304

.data
prompt: .asciz "PLease insert a binary number: "
output: .asciz "in decimal base the value is: "
binSpace: .space 31

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 8
li a1, 31
la a0, binSpace
ecall

mv t0, a0
jal toDecimal

mv a0, t6
li a7, 1
ecall

exit:
li a7, 10
ecall