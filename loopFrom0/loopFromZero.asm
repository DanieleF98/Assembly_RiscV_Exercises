#Author: Daniele Finadri

.data
prompt: .asciz "Please insert a number to count to: "
.globl space
space: .asciz "\n"

.text
.globl main
main:
li a7, 4
la a0, prompt
ecall

li a7, 5
ecall

mv t0, a0
jal count

exit:
li a7, 10
ecall
