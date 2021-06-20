#Author: Daniele Finadri 863001304

.data
promptFirst: .asciz "Please insert the first string: "
promptSecond: .asciz "Please insert the second string: "
firstStrSpace: .space 51
secondStrSpace: .space 51
output: .asciz "Total string is: "

.text
.globl main
main:

li a7, 4
la a0, promptFirst
ecall

li a7, 8
li a1, 51
la a0, firstStrSpace
ecall
mv s0, a0

li a7, 4
la a0, promptSecond
ecall

li a7, 8
li a1, 51
la a0, secondStrSpace
ecall
mv s1, a0
li s2, '\n'
#in s0 first string, in s1 second one

getLenFirst:
addi sp, sp, -4
sw s0, 0(sp)
loopFirstLen:
lbu t0, 0(s0)
beq t0, s2, continue
beqz t0, continue
addi t1, t1, 1	#t1 counter len first Str 
addi s0, s0, 1
j loopFirstLen

continue: 
lw s0, 0(sp)
addi sp, sp, 4
j getLenSecond

getLenSecond:
addi sp, sp, -4
sw s1, 0(sp)

loopSecondLen:
lbu t0, 0(s1)
beq t0, s2, continueSecond
beqz t0, continueSecond
addi t2, t2, 1
addi s1, s1, 1
j loopSecondLen

continueSecond:
lw s1, 0(sp)
addi sp, sp, 4
j concatStr

concatStr:
addi sp, sp, -8
sw s0, 4(sp)
sw s1, 0(sp)
add s0, s0, t1

strCat:
lbu t0, 0(s1)
beqz t2, continueToPrint
beq t0, s2, continueToPrint
beqz t0, continueToPrint
sb t0, 0(s0)
addi s0, s0, 1
addi s1, s1, 1
addi t2, t2, -1
j strCat

continueToPrint:
lw s1, 0(sp)
lw s0, 4(sp)
addi sp, sp, 8
j print

print:
li a7, 4
la a0, output
ecall
mv a0, s0
ecall
j exit

exit:
li a7, 10
ecall


