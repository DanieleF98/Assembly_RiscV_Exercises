#Author: Daniele Finadri 863001304

.globl loopToUpperCase
loopToUpperCase:

addi sp, sp, -12
sw s0, 8(sp)
sw s3, 4(sp)
sw ra, 0(sp)

#s0 String, s1 = 'a', s2 = 'z', s3 counter

loopToUpper:
beqz s3, return
lbu t0, 0(s0)
bgt t0, s2, continue
blt t0, s1, continue
addi t0, t0, -32
sb t0, 0(s0)
addi s0, s0, 1
addi s3, s3, -1
j loopToUpper

continue:
addi s0, s0, 1
addi s3, s3, -1
j loopToUpper


return:
lw ra, 0(sp)
lw s3, 4(sp)
lw s0, 8(sp)
addi sp, sp, 4
jalr ra