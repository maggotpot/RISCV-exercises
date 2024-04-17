#count how many numbers between (x, y)

.data
x: .word 20
y: .word 30
n: .word 4
a: .word 20, 23, 34, 29

.text
addi a0, a0, 0
lui t0, 0x10010
lw t1, 8(t0) #list length
lw t2, 0(t0) #x
lw t3, 4(t0) #y
la t4, a #array

check1:
lw t5, 0(t4) #load first element of array
bge t5, t2, check2
addi t5, t5, 4
addi t1, t1, -1

check2:
ble t5, t3, vabene

vabene:
addi a0, a0, 1
li a7, 1
ecall
li a7, 10
ecall


