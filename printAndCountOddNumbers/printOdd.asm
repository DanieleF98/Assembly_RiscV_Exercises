#Author: Daniele Finadri 863001304

.data
space: .asciz " "

.text
.globl printOdd
printOdd:

addi sp, sp, -12
sw a7, 8(sp)
sw a0, 4(sp)
sw ra, 0(sp)


mv t5, t4

loopPrint:
beqz t4, return
li a7, 1
lb a0, 0(t6)
ecall

addi t6, t6, -1
addi t4, t4, -1
la a0, space
li a7, 4
ecall
j loopPrint

return:
lw ra, 0(sp)
lw a0, 4(sp)
lw a7, 8(sp)
addi sp, sp, 12
jalr ra