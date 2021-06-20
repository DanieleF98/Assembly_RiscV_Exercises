#Author: Daniele Finadri 863001304

.data
promptFirst: .asciz "Please insert the first number: "
promptSecond: .asciz "Please insert the second number: "
outputTrue: .asciz "The two numbers are equals, the sum is: "
outputFalse: .asciz "The two numbers aren't equal, the difference is: "

.text
.globl main
main:

li a7, 4
la a0, promptFirst
ecall

li a7, 5
ecall

mv t0, a0

li a7, 4
la a0, promptSecond
ecall

li a7, 5
ecall

mv t1, a0

beq t0, t1, printTrue

li a7, 4
la a0, outputFalse
ecall

li a7, 1
sub a0, t0, t1
ecall
j exit

printTrue:
li a7, 4
la a0, outputTrue
ecall

li a7, 1
add a0, t0, t1
ecall

exit:
li a7, 10
ecall