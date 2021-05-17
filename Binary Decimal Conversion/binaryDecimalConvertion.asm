#Author: Daniele Finadri

.data
prompt: .asciz "Inserisci un numero decimale (max 10 cifre): "
output: .asciz "Il corrispondente numero binario è: "
binSpace: .space 100
.text
.globl main
main:

la a0, prompt
li a7, 4
ecall

li a7, 5
ecall

addi a2, a2, 1
mv t0, a0
addi a3, a3, 2

la a0, binSpace
loop:
beqz t0, exit
beq t0, a2, exitOne
and t1, t0, a2
beq t1, a2, true
beq t1, zero, false


true:
div t0, t0, a3
sb a2, 0(a0)
addi a0, a0, 1
addi a4, a4, 1
j loop

false:
div t0, t0, a3
sb zero, 0(a0)
addi a0, a0, 1
addi a4, a4, 1
j loop

exitOne:
sb a2, 0(a0)
addi a4, a4, 1
li a7, 1
mv t0, a0

printReverse:
beqz a4, exit
lb a0, 0(t0)
ecall
addi t0, t0, -1
addi a4, a4, -1
j printReverse

exit:
li a7, 10
ecall
