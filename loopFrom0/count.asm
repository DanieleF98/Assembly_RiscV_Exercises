#Author: Daniele Finadri

.text
.globl count
count:
addi sp, sp, -12
sw ra, 8(sp)
sw a0, 4(sp)
sw a7, 0(sp)

beq t1, t0, return
li a7, 1
mv a0, t1
ecall
la a0, space
li a7, 4
ecall
addi t1, t1, 1
j count

return:
lw a7, 0(sp)
lw a0, 4(sp)
lw ra, 8(sp)
addi sp, sp, 12
jalr ra