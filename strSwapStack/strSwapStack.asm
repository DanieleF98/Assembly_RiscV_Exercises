#Author: Daniele Finadri 863001304

.data
promptFirst: .asciz "Please insert the first string: "
promptSecond: .asciz "Please insert the second string: "
outputFirst: .asciz "First string now is: "
outputSecond: .asciz "Second string now is: "

.text
.globl main
main:

li a7, 4
la a0, promptFirst
ecall

li a7, 8
li a1, 24
mv a0, sp
ecall
mv s0, a0

li a7, 4
la a0, promptSecond
ecall

li a7, 8
addi sp, sp, -25
mv a0, sp
ecall
mv s1, a0


swap:
mv t0, s0
mv s0, s1
mv s1, t0


print:
li a7, 4
la a0, outputFirst
ecall

mv a0, s0
ecall

la a0, outputSecond
ecall

mv a0, s1
ecall

addi sp, sp, 25

li a7, 10
ecall
