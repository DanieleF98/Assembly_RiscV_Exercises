#Author: Daniele Finadri

.data
prompt: .asciz "This exercize prints only the numbers who are even \n"
initNumbers: .asciz "The numbers given are: "
space: .asciz " "
arrayOfNumbers: .word 2,3,4,1,2,6,7,8,9,4,5,6,7,8,5,4,3,12,1213,421,422
even_numbers: .asciz "The even numbers are: "

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall 
la a1, arrayOfNumbers
la a0, even_numbers
ecall
li a7, 1
la a2, arrayOfNumbers
addi a2, a2, 84
addi t0, zero, 1

loopEven:
beq a1, a2, exit
lw a0, 0(a1)
and t1, t0, a0
beq t1, t0, odd
ecall
li a7, 4
la a0, space
ecall
li a7, 1
addi a1, a1, 4
j loopEven

odd:
addi a1, a1, 4
j loopEven

exit:

li a7, 10
ecall
