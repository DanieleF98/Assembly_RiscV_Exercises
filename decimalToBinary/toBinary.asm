#Author: Daniele Finadri 863001304

.globl toBinary
toBinary:

addi sp, sp, -8
sw ra, 4(sp)
sw a1, 0(sp)
#in t0 I have the decimal number


li t1, 2
li t2, 1
la t4, binSpace
li t6, '1'
li a1, '0'

loopToBinary:
rem t3, t0, t1
div t0, t0, t1
beq t3, t2, true
beqz t3, false



true:
sb t6, 0(t4)
addi t5, t5, 1
addi t4, t4, 1
beqz t0, continue 
j loopToBinary

false:
sb a1, 0(t4)
addi t5, t5, 1
addi t4, t4, 1
beqz t0, continue 
j loopToBinary


continue:
addi t4, t4, -1
jal reverse

lw a1, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
jalr ra