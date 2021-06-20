#Author: Daniele Finadri 863001304

.globl getLen
getLen:

addi sp, sp, -8
sw s0, 4(sp)
sw ra, 0(sp)


loopLen:
lbu t0, 0(s0)
beq t0, s2, continue
beqz t0, continue
addi t1, t1, 1
addi s0, s0, 1
j loopLen

continue:
addi t1, t1, -1
lw ra, 0(sp)
lw s0, 4(sp)
addi sp, sp, 8
jalr ra
