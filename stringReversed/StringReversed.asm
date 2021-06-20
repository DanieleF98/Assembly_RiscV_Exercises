#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a phrase: "
output: .asciz "The phrase reversed is: "
strSpace: .space 51
.globl strReversedSpace
strReversedSpace: .space 51

.text
.globl main
main:

li a7, 4 
la a0, prompt
ecall

li a7, 8
li a1, 51
la a0, strSpace
ecall

mv t0, a0

jal getReversedString

la a0, output
li a7, 4
ecall

la a0, strReversedSpace
ecall

li a7, 10
ecall