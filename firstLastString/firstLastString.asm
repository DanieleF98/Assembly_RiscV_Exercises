#Author: Daniele Finadri 863001304

#Prendere in input tre stringhe e stampare prima e ultima stringa

.data
promptFirstStr: .asciz "Please insert the first string: "
promptSecondStr: .asciz "Please insert the second string: "
promptThirdStr: .asciz "Please insert the third string: "
outputFirst: .asciz "The first string is: "
outputLast: .asciz "The last string is: "
firstStrSpace: .space 26
secondStrSpace: .space 26
thirdStrSpace: .space 26

.text
.globl main
main:

la a0, promptFirstStr
li a1, 26
li a7, 4
ecall

la a0, firstStrSpace
li a7, 8 
ecall

mv s0, a0

la a0, promptSecondStr
li a1, 26
li a7, 4
ecall

la a0, secondStrSpace
li a7, 8 
ecall

mv s1, a0

la a0, promptThirdStr
li a1, 26
li a7, 4
ecall

la a0, thirdStrSpace
li a7, 8 
ecall

mv s2, a0

lastStr:
lbu t0, 0(s0)
lbu t1, 0(s1)
beq t0, t1 continueFirst
bgt t0, t1 firstCaseLast
j secondCaseLast 

continueFirst:
addi s0, s0, 1
addi s1, s1, 1
j lastStr

firstCaseLast:
la s0, firstStrSpace
la s2, thirdStrSpace
loopFirst:
lbu t1, 0(s0)
lbu t2, 0(s2)
beq t1, t2, continueFirstCase
bgt t1, t2, printLastStrFirst
j  printLastStrThird

secondCaseLast:
la s1, secondStrSpace
la s2, thirdStrSpace
loopSecond:
lbu t1, 0(s1)
lbu t2, 0(s2)
beq t1, t2, continueSecondCase
bgt t1, t2, printLastStrSecond
j  printLastStrThird

continueFirstCase:
addi s0, s0, 1
addi s2, s2, 1
j loopFirst

continueSecondCase:
addi s1, s1, 1
addi s2, s2, 1
j loopSecond

printLastStrFirst:
li a7, 4
la a0, outputLast
ecall
la a0, firstStrSpace
ecall
j firstStr

printLastStrSecond:
li a7, 4 
la a0, outputLast
ecall
la a0, secondStrSpace
ecall
j firstStr

printLastStrThird:
li a7, 4 
la a0, outputLast
ecall
la a0, thirdStrSpace
ecall
j firstStr

firstStr:
la s0, firstStrSpace
la s1, secondStrSpace
la s2, thirdStrSpace
loopFirstStr:
lbu t0, 0(s0)
lbu t1, 0(s1)
beq t0, t1 continueFirstFirst
blt t0, t1 firstCaseFirst
j secondCaseFirst

continueFirstFirst:
addi s0, s0, 1
addi s1, s1, 1
j loopFirstStr

firstCaseFirst:
la s0, firstStrSpace
la s2, thirdStrSpace
loopFirstFirst:
lbu t1, 0(s0)
lbu t2, 0(s2)
beq t1, t2, continueFirstCaseFirst
blt t1, t2, printFirstStrFirst
j  printFirstStrThird

secondCaseFirst:
la s1, secondStrSpace
la s2, thirdStrSpace

loopSecondFirst:
lbu t1, 0(s1)
lbu t2, 0(s2)
beq t1, t2, continueSecondCaseFirst
blt t1, t2, printFirstStrSecond
j  printFirstStrThird

continueFirstCaseFirst:
addi s0, s0, 1
addi s2, s2, 1
j loopFirstFirst

continueSecondCaseFirst:
addi s1, s1, 1
addi s2, s2, 1
j loopSecondFirst

printFirstStrFirst:
li a7, 4
la a0, outputFirst
ecall
la a0, firstStrSpace
ecall
j exit

printFirstStrSecond:
li a7, 4 
la a0, outputFirst
ecall
la a0, secondStrSpace
ecall
j exit

printFirstStrThird:
li a7, 4 
la a0, outputFirst
ecall
la a0, thirdStrSpace
ecall
j exit

exit:
li a7, 10
ecall