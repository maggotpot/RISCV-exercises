.data

len: .word 8
array: .word 1, 2, 3, 4, 5, 6, 7, 8
v1: .word 2
v2: .word 5

.text
li t0, 0x10010000
lw t1, (t0) #len
lw t2, v1
lw t3, v2
la t5, array

ciclo:
lw t4, (t5) #load first element of array
bge t4, t2, se_maggiore_o_uguale
addi t1, t1, -1
addi t5, t5, 4
bne t1, zero, ciclo
beq zero, zero, fine

se_maggiore_o_uguale:
beq zero, zero, se_minore

se_minore:
blt t4, t3, contatore
addi t1, t1, -1
addi t5, t5, 4
beq zero, zero, ciclo

contatore:
addi a0, a0, 1
addi t1, t1, -1
addi t5, t5, 4
beq zero, zero, ciclo

fine:
li a7, 1
ecall
li a7, 10
ecall