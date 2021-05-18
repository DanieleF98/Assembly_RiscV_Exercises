#Author: Daniele Finadri

.data
prompt: .asciz "Enter a binary number: "
output: .asciz "The decimal rappresentation is: "
bin: .space 9

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

la a0, bin
li a1, 9
li a7, 8
ecall

li a7, 1
mv t0, a0
li t6, '\n'
li t4, '1'
li t5, '0'
li a2, 2


getLen:
lb t1, 0(t0)
beq t1, t6, calcDec
addi t0, t0, 1
addi t2, t2, 1
j getLen

calcDec:
sub t0, t0, t2
addi t2, t2, -1

loopPrint:
lb a0, 0(t0)
beq a0, t6, exit
beq a0, t4, true
beq a0, t5, continue
j loopPrint

true:
beqz t2, addOne
sll a3, a7, t2
add a4, a4, a3
addi t0, t0, 1
addi t2, t2, -1
j loopPrint

addOne:
addi a4, a4, 1
addi t0, t0, 1
j exit

continue:
addi t0, t0, 1
addi t2, t2, -1
j loopPrint

exit:
la a0, output
li a7, 4
ecall

li a7, 1
mv a0, a4
ecall

li a7, 10
ecall