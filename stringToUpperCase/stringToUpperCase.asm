#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a string: "
output: .asciz "The string toUpperCase is: "
strSpace: .space 51

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 8
li a1, 51
la a0, strSpace
ecall

mv s0, a0
li s1, 'a'
li s2, 'z'

jal getLen

mv s3, t3	#in s3 counter

jal loopToUpperCase

la a0, strSpace
li a7, 4
ecall

li a7, 10
ecall

