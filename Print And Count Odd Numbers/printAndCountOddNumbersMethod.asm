#Author: Daniele Finadri

.globl oddCounter
oddCounter:
addi sp, sp, -4
lw ra, 0(sp)
li t2, 1
li t3, 10

loopCount:
beqz t0, return
and t1, t0, t2
beq t1, t2, odd
blt t1, t2, even
j loopCount

odd:
addi t5, t5, 1
jal print

return:
sb ra, 0(sp)
addi sp, sp, 4
jr ra


print:
addi sp, sp, -12
lw ra, 0(sp)
lw a7, 4(sp)
lw a0, 8(sp)

li a7, 1
mv a0, t0
ecall

sw ra, 0(sp)
sw a7, 4(sp)
sw a0, 8(sp)
addi sp, sp, 12
jr ra