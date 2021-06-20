#Author: Daniele Finadri 863001304

.text
.globl reverse
reverse:

addi sp, sp, -4
sw ra, 0(sp)
la t1, binSpaceRev
li t2, '\n'

loopReverse:
beqz t5, return
lb t3, 0(t4)
sb t3, 0(t1)
addi t4, t4, -1
addi t1, t1, 1
addi t5, t5, -1
j loopReverse

return:
addi t1, t1, 1
sb zero, 0(t1)
lw ra, 0(sp)
addi sp, sp, 4
jalr ra