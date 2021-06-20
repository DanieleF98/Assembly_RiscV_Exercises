#Author: Daniele Finadri 863001304

.text
.globl toDecimal
toDecimal:

addi sp, sp, -4
sw ra, 0(sp)


jal strLen
li t2, '1'
li t4, 1
li t6, 0

loopToDecimal:
lb t3, 0(t0)
andi t3, t3, 1
beq t3, t4, true
beqz t3, continue


true:
beqz t1, returnOne
sll t5, t4, t1
add t6, t6, t5
addi t0, t0, 1
addi t1, t1, -1
j loopToDecimal

continue:
beqz t1, return
addi t0, t0, 1
addi t1, t1, -1
j loopToDecimal

returnOne:
addi t6, t6, 1
return:
lw ra, 0(sp)
addi sp, sp, 4
jalr ra