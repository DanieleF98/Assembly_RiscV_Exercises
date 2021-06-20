#Author: Daniele Finadri

.data
prompt: .asciz "Please insert a string: "
outputVoc: .asciz "The vocals are: "
outputTot: .asciz "\nTotal vocals: "
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

li a7, 4
la a0, outputVoc
ecall

li s0, 'a'
li s1, 'e'
li s2, 'i'
li s3, 'o'
li s4, 'u'
li s5, '\n'
la s6, strSpace
li s7, 'z'
li a7, 11

loopVocals:
lbu t0, 0(s6)
beq t0, s5, printTot
beqz t0, printTot
bgt t0, s7, toLowerCase
blt t0, s0, toLowerCase 
checkVocal:
beq t0, s0, print
beq t0, s1, print
beq t0, s2, print
beq t0, s3, print
beq t0, s4, print
addi s6, s6, 1
j loopVocals

toLowerCase:
addi t0, t0, 32
j checkVocal

print:
mv a0, t0
ecall
addi s6, s6, 1
addi a2, a2, 1
j loopVocals

printTot:
li a7, 4
la a0, outputTot
ecall

li a7, 1
mv a0, a2
ecall

li a7, 10
ecall