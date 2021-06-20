#Author: Daniele Finadri 863001304

.text 
.globl printReversedString
printReversedString:
addi sp, sp, -4
sw ra, 0(sp)


jal getLen










return:
lw ra, 0(sp)
addi sp, sp, 4
jalr ra