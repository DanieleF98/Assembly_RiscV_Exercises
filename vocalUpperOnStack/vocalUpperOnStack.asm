#Author: Daniele Finadri 863001304

.data
prompt: .asciz "Dammi una stringa (max 20 caratteri): \n"
output_error: .asciz "La stringa inserita è troppo lunga (> 20 caratteri)\n"
output: .asciz "Stringa modificata: \n"

.text
.globl main
main:
addi sp, sp, -51

li a7, 4
la a0, prompt
ecall

li a7, 8
li a1, 51
mv a0, sp
ecall

li s0, '\n'
li s1, 20
mv t0, a0
jal strLen

bgt a1, s1, exitWithError

li s2, 'a'
li s3, 'e'
li s4, 'i'
li s5, 'o'
li s6, 'u'

mv t0, a0
jal vocal_upper

li a7, 4
la a0, output
ecall

mv a0, sp
ecall

addi sp, sp, 51

li a7, 10
ecall

strLen:
addi sp, sp, -4
sw ra, 51(sp)
li t2, 0

strLenLoop:
lbu t1, 0(t0)
beq t1, s0, exitStrLenLoop
addi t2, t2, 1
addi t0, t0, 1
j strLenLoop

exitStrLenLoop:
mv a1, t2
lw ra, 51(sp)
addi sp, sp, 4
jalr ra

exitWithError:
li a7, 4
la a0, output_error
ecall
addi sp, sp, 51
j main

vocal_upper:
addi sp, sp, -4
sw ra, 51(sp)
li t2, 0

vocalUpperLoop:
bge t2, a1 exitVocalUpperLoop
lbu t1, 0(t0)
beq t1, s2, upperVocal
beq t1, s3, upperVocal
beq t1, s4, upperVocal
beq t1, s5, upperVocal
beq t1, s6, upperVocal
addi t2, t2, 1
addi t0, t0, 1
j vocalUpperLoop

upperVocal:
addi t1, t1, -32
sb t1, 0(t0)
addi t0, t0, 1
addi t2, t2, 1
j vocalUpperLoop

exitVocalUpperLoop:
lw ra, 51(sp)
addi sp, sp, 4
jalr ra

