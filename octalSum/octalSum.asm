# Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert two octal numbers:\n"
output: .asciz "\nThe sum of the two octal numbers is: "
firstOct: .space 9
secondOct: .space 9
sumOct: .space 9
sumOctRev: .space 9


.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 8
la a0, firstOct
li a1, 9
ecall

mv s0, a0

la a0, secondOct
li a1, 9
ecall

mv s1, a0
li s2, '\n'
li s3, 8
li s4, -1
li s5, 3


getLenFirst:
lb t0, 0(s0)
beqz t0, toDecimalFirst
addi t3, t3, 1
addi s0, s0, 1
j getLenFirst

toDecimalFirst:
sub s0, s0, t3
addi t3, t3, -2

loopDecimalFirst:
lb t0, 0(s0)
beqz t0, toDecimalSecond
addi t0, t0, -48
beq t3, s4, toDecimalSecond
mul t4, t3, s5
sll t1, s3, t4
mul t1, t0, t1
add t2, t2, t1
addi t3, t3, -1
addi s0, s0, 1
j loopDecimalFirst


toDecimalSecond:
add t2, t2, t0
mv a1, t2
li t3, 0
li t2, 0

getLenSecond:
lb t0, 0(s1)
beqz t0, decSecond
addi t3, t3, 1
addi s1, s1, 1
j getLenSecond

decSecond:
sub s1, s1, t3
addi t3, t3, -2

loopDecimalSecond:
lb t0, 0(s1)
beqz t0, sumDecimal
addi t0, t0, -48
beq t3, s4, sumDecimal
mul t4, t3, s5
sll t1, s3, t4
mul t1, t0, t1
add t2, t2, t1
addi t3, t3, -1
addi s1, s1, 1
j loopDecimalSecond

sumDecimal:
add t2, t2, t0
add a1, t2, a1
la t0, sumOct
li a7,1
mv a0, a1
ecall

toOctalLoop:
beqz a1, print
rem t1, a1, s3
div a1, a1, s3
addi t1, t1, 48
sb t1, 0(t0)
addi t0, t0, 1
j toOctalLoop

print:
sb t1, 0(t0)
la t0, sumOct
li t2, 0

getLenSum:
lb t1, 0(t0)
beq t1, s2, rev
beqz t1, rev
addi t0, t0, 1
addi t2, t2, 1
j getLenSum

rev:
addi t0, t0, -2
la t4, sumOctRev

printRev:
lb t1, 0(t0)
beqz t2, exit
sb t1, 0(t4)
addi t2, t2, -1
addi t0, t0, -1
addi t4, t4, 1
j printRev

exit:
sb t1, 0(t4)
li a7, 4
la a0, output
ecall

la a0, sumOctRev
ecall

li a7, 10
ecall
