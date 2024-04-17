#Sum elements of array

.data

.word 4
.word 1, 2, 3, 4

.text

lui t0, 0x10010
lw t1, 0(t0) #load in t1 the length of the array

addi t0, t0, 4 #move to the first element of the array

ciclo:

lw t2, (t0) #laod in t2 the first element of the array
add t3, t3, t2 #move in t3 the first element of the array
addi t1, t1, -1
addi t0, t0, 4

bne t1, zero, ciclo
mv a0, t3

li a7, 1
ecall
li a7, 10
ecall
