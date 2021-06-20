#Author: Daniele Finadri 863001304

.text
.globl getLen
getLen:

addi sp, sp, -4
sw ra, 0(sp)

li t1,'\n'

loopCount:
lbu t2, 0(t0)
beq t2, t1, return
beqz t2, return
addi t3, t3, 1
addi t0, t0, 1
j loopCount


return:
addi t0, t0, -1
lw ra, 0(sp)
addi sp, sp, 4
jalr ra