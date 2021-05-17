#Author: Daniele Finadri

.data
prompt: .asciz "This file contains a loop printing values from 0 to the specified number \n"
numberPrompt: .asciz "Insert a number \n"
.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

la a0, numberPrompt
ecall 

li a7, 5
ecall

mv s1, a0
add a0, zero, zero
#addi s1, s1, -1 se voglio che si fermi a numero -1
loop:
li a7, 1
ecall
beq a0, s1, exit
addi a0, a0, 1
j loop

exit: 
li a7, 10
ecall
