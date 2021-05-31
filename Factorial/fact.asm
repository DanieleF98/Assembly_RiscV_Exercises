#Author: Daniele Finadri

.globl fact
addi sp, sp, 4
lw ra, 0(sp)

fact:
ble t0, t1, exit
addi t0, t0, -1
mul t2, t2, t0
j fact

exit:
sw ra, 0(sp)
addi sp, sp, 4
jalr ra