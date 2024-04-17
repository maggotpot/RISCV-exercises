#count how many numbers between (x, y)

.data
x: .word 20
y: .word 30
n: .word 4
a: .word 20, 23, 34, 29

.text
lui s0, 0x10010
lw t0, 0(s0) # x
lw t1, 4(s0) # y
lw t2, 8(s0) #length
addi s0, s0, 12 #s0 has the address of the array
addi a0, a0, 0

ciclo:
lw t3, 0(s0) #t3 has first element of array
blt t3, t0, salta
bge t3, t1, salta
addi a0, a0, 1
addi s0, s0, 4
addi t2, t2, -1
bne t2, zero, ciclo
li a7, 1
ecall
li a7, 10
ecall

salta:
addi s0, s0, 4 #increment array
addi t2, t2, -1
#lw t4, 0(s0)
bne t2, zero, ciclo
