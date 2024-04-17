#Print pari if 7 is pari, ow print dispari

.data

.word 7
.asciz "Pari"
.asciz "Dispari"

.text

lui t0, 0x10010
lw t1, 0(t0)
andi t1, t1, 1
beq t1, zero, epari
addi a0, t0, 9 
li a7, 4 #print string syscall
ecall
beq zero, zero, uscita

epari:
addi a0, t0, 4
li a7, 4
ecall

uscita:
li a7, 10
ecall