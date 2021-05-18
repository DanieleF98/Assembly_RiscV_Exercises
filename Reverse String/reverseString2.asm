#Author: Daniele Finadri

.data
prompt: .asciz "Inserisci una stringa: "
output: .asciz "La stringa al contrario è uguale a: "
str: .space 101
str_Rev: .space 101

.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

la a0, str
li a1, 100
li a7, 8
ecall
li t3, '\n'
mv t0, a0

getLength:	#This funtion gives us the length of the string in t2
lbu t1, 0(t0)
beq t1, t3, printRev
beqz t1, printRev
addi t0, t0, 1
addi t2, t2, 1
j getLength

printRev:	#This function prints the output message and prepares t2 and t0 for the print
la a0, output
li a7, 4
ecall
la t4, str_Rev
addi t0, t0, -1
addi t2, t2, -1

loopPrint:	#This function prints the string inverted
lbu t5, (t0)
sb t5, (t4)
addi t4, t4, 1
beqz t2, exit
addi t0, t0, -1
addi t2, t2, -1
j loopPrint

exit:
sb zero, (t4)	#Add null to the end of the string
li a7, 4
la a0, str_Rev
ecall

li a7, 10
ecall
