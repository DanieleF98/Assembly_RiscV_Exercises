#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a char: "
output: .asciz "\nThe char upper case is: "

.text
.globl main
main:

li t1, 'a'
li t2, 'z'

li a7, 4
la a0, prompt
ecall

li a7, 12
ecall
mv t0, a0

la a0, output
li a7, 4
ecall

mv a0, t0
bltu a0, t1, exit
bgtu a0, t2, exit
addi t3, a0, -32
mv a0, t3

exit:

li a7, 11
ecall

li a7, 10
ecall