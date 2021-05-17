#Author: Daniele Finadri

.data
prompt: .asciz "Inserisci un carattere da convertire in maiuscolo: "
result: .asciz "\nIl carattere in maiuscolo è "

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

li a7, 12
ecall
mv t0, a0

la a0, result
li a7, 4
ecall

addi a0, t0, -32

li a7, 11
ecall

li a7, 10
ecall