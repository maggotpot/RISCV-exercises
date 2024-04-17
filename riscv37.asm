#smallest of two integers in a data segment

.data

.word 12
.word 10

.text

lui t0, 0x10010
lw t1, 0(t0)
lw t2, 4(t0)

blt t1, t2, t1_minore_di_t2
mv a0, t2
beq zero, zero, uscita

t1_minore_di_t2:
mv a0, t1

uscita:
li a7, 1
ecall
li a7, 10
ecall