#Author: Daniele Finadri 86300134
#Somma torte dal valore di "inserire da utente"

.data 
prompt: .asciz "Inserire costo prima torta: "
prompt2: .asciz "Inserire costo seconda torta: "
prompt3: .asciz "Inserire costo terza torta: "
output: .asciz "Costo totale torte: "

.text
.globl main
main:

la x10, prompt
li x17, 4
ecall

li x17, 5 
ecall
mv x5, x10

la x10, prompt2
li x17, 4
ecall
li x17, 5 
ecall
mv x6, x10

la x10, prompt3
li x17, 4
ecall
li x17, 5 
ecall
mv x7, x10

add x6, x6, x7
add x6, x6, x5

li x17, 4
la x10, output
ecall 
mv x10, t1
li x17, 1
ecall

li x17, 10
ecall