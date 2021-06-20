#Author: Daniele Finadri 863001304

.text 
.globl strLen
strLen:

addi sp, sp, -4
sw ra, 0(sp)

li t6, '\n'
li t1, 0

loopLen:
lb t2, 0(t0)
beq t2, t6, return
addi t1, t1, 1
addi t0, t0, 1
j loopLen


return:
sub t0, t0, t1
addi t1, t1, -1
lw ra, 0(sp)
addi sp, sp, 4
jalr ra