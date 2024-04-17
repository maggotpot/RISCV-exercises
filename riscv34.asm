.data

.word 12, 18

.text

lui t0, 0x10010
lw a0, 0(t0)
lw a1, 4(t0)
bge a1, a0, salta
mv a0, a1

salta:
li a7, 1
ecall
li a7, 10
ecall