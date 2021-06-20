#Author: Daniele Finadri 863001304

#Takes in input a number and prints how many odd numbers are contained in it and the odd numbers

.data
prompt: .asciz "Please insert a number: "
oddCount: .asciz "Total number of odd numbers: "
oddNums: .asciz "\nOdd numbers: "
.globl oddToRev
oddToRev: .space 30

.text
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 5
ecall

#We move the total number inside the temporary register t0
mv t0, a0

la a0, oddNums
li a7, 4
ecall

jal countOdd

jal printOdd

la a0, oddCount
ecall

mv a0, t5
li a7, 1
ecall

li a7, 10
ecall
