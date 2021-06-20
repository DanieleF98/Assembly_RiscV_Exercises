#Author: Daniele Finadri 863001304

.text
.globl countOdd
countOdd:
addi sp, sp, -4
sw ra, 0(sp)


li t2, 10
li t1, 1
la t6, oddToRev

loopCount:
beqz t0, return
rem t3, t0, t2
and t5, t3, t1
div t0, t0, t2
beq t5, t1, addOdd
j loopCount

addOdd:
addi t4, t4, 1
sb t3, 0(t6)
addi t6, t6, 1
j loopCount

return:
addi t6, t6, -1
lw ra, 0(sp)
addi sp, sp, 4
jalr ra