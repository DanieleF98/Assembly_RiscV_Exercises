#Author: Daniele Finadri

.data
prompt: .asciz "Inserisci una stringa: "
output: .asciz "La stringa al contrario è uguale a: "
str: .space 31

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

la a0, str
li a1, 30
li a7, 8
ecall

li t3, '\n'
mv t0, a0

getLength:	#This funtion gives us the length of the string in t2
lbu t1, 0(t0)
beq t1, t3, printRev
addi t0, t0, 1
addi t2, t2, 1
j getLength

printRev:	#This function prints the output message and prepares t2, t0 and a7 for the print
la a0, output
li a7, 4
ecall
li a7, 11
addi t0, t0, -1
addi t2, t2, -1

loopPrint:	#This functio prints the string inverted
lbu a0, 0(t0)
ecall
beqz t2, exit
addi t0, t0, -1
addi t2, t2, -1
j loopPrint

exit:
li a7, 10
ecall
