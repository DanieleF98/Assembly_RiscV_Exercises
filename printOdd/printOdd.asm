#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a number: "
output: .asciz "Odd Numbers: "

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 5
ecall
mv t0, a0
li s1, 1
li s2, 10

li a7, 4
la a0, output
ecall

li a7, 1

loopEven:
beqz t0, exit
rem t1, t0, s2
and t2, t1, s1
beqz t2, odd
div t0, t0, s2
j loopEven

odd:
mv a0, t1
ecall
div t0, t0, s2
j loopEven

exit:
li a7, 10
ecall