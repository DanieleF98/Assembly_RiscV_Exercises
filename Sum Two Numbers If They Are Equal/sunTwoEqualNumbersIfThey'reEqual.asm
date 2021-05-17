#Author: Daniele Finadri

.data
prompt : .asciz "Please enter two numbers \n"
condition : .asciz "If the numbers are equal they'll be added, if they differ they'll be substracted: \n"
.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

la a0, condition
li a7, 4
ecall

li a7, 5
ecall

mv t1, a0

li a7,5
ecall

bne t1, a0, else
add a0, a0, t1
beq zero, zero, exit

else:
sub a0, t1, a0

exit:
li a7, 1
ecall

li a7, 10
ecall 
