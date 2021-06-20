#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a decimal number: "
output: .asciz "The number in binary is: "

.globl binSpace
binSpace: .space 31

.globl binSpaceRev
binSpaceRev: .space 31

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 5
ecall

mv t0, a0
jal toBinary


la a0, binSpaceRev
li a7, 4
ecall

li a7, 10
ecall