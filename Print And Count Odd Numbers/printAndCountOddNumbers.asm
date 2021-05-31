#Author: Daniele Finadri

.data
prompt: .asciz "Insert a number: "
odd_total: .asciz "Total odd numbers: "
odd_numbers: .asciz "Odd numbers: "

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

li a7, 5
ecall

mv t0, a0
jal oddCounter

la a0, odd_total
li a7, 4
ecall

mv a0, t4
li a7, 1
ecall

la a0, odd_numbers
li a7, 4
ecall

mv a0, t5
li a7, 1
ecall

li a7, 10
ecall