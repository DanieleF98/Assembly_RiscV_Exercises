#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Dammi una string di testo (50 car. max) :\n"
output: .asciz "La stringa con le parole a rovescio è:"
strSpace: .space 51
strRevSpace: .space 51
word: .space 51

.text 
.globl main
main:

li a7, 4
la a0, prompt
ecall

li a7, 8 
la a0, strSpace
li a1, 51
ecall

mv s0, a0
li s1, '\n'
la s2, strRevSpace
li s3, ' '
la s4, word


strLen:
lbu t0, 0(s0)
beqz t0, strRev
beq t0, s1, strRev
addi t1, t1, 1
addi s0, s0, 1
j strLen

strRev:
sub s0, s0, t1
j loopRev

rev:
beqz t1, print
sb s3, 0(s2)
addi s2, s2, 1

loopRev:
beq t0, s3, revWord
beqz t1, revWord
beqz t0, revWord
lbu t0, 0(s0)
sb t0, 0(s4)
addi s4, s4, 1
addi s0, s0, 1
addi t1, t1, -1
addi t3, t3, 1
j loopRev

revWord:
addi s4, s4, -1

revWordLoop:
beqz t3, rev
lbu t0, 0(s4)
sb zero, 0(s4)
sb t0, 0(s2)
addi s4, s4, -1
addi s2, s2, 1
addi t3, t3, -1
j revWordLoop


print:
la a0, output
li a7, 4
ecall

la a0, strRevSpace
ecall

exit:
li a7, 10
ecall
