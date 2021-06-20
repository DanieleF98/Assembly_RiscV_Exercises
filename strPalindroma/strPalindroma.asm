#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Please insert a string: "
outputTrue: .asciz "The string is palindrome"
outputFalse: .asciz "The string is not palindrome"
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
mv s1, a0
li s2, '\n'
li s3, 2

jal getLen

add s1, s1, t1
div t4, t1, s3

loopPalindrome:
lbu t0, 0(s0)
lbu t2, 0(s1)
bne t0, t2, printFalse
beq t1, t4, printTrue
addi s0, s0, 1
addi s1, s1, -1
addi t1, t1, -1
j loopPalindrome

printTrue:
li a7, 4
la a0, outputTrue
ecall
j exit

printFalse:
li a7, 4
la a0, outputFalse
ecall
j exit

exit:
li a7, 10
ecall