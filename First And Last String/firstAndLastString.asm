#Author: Daniele Finadri

.data
prompt: .asciz "Please insert 3 Strings: "
outputFirst: .asciz "The first string is: "
outputLast: .asciz "The last string is: "
str1: .space 25
str2: .space 25
str3: .space 25

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

la a0, str1
li a1, 25
li a7, 8
ecall
mv a1, a0

la a0, str2
ecall
mv a2, a0

la a0, str3
ecall
mv a3, a0

loop:
lbu t0, 0(a1)
lbu t1, 0(a2)
lbu t3, 0(a3)



li a7, 10
ecall
