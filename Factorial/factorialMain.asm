#Author: Daniele Finadri

.data
prompt: .asciz "Insert the number you want to calcolate the factor: "
output: .asciz "The factor of the number inserted is: "

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 5
ecall

mv t0, a0
mv t2, a0
li t1, 1
jal fact


la a0, output
li a7, 4
ecall

mv a0, t2
li a7, 1
ecall

li a7, 10
ecall
