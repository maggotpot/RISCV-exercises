#Write a program that loads the smallest input number into the register a0.
#In this case we use the numbers 12 and 19, but the program should work with any input

.data
    .word 12, 18 #here 12's address is 0x10010000
                 #here 18's address is 0x10010004

.text

lui t0, 0x10010 #loading address of 12
lw a0, 0(t0) #loading 12 in a0
lw a1, 4(t0) #loading 18 in a1
bge a1, a0, salta #if a1 is greater or equal to a0, salta
addi a0, a1, 0 #a1 shifted into a0
#here we could've used the pseudo-instruction "mv"

salta:

#Let's do the same thing, but with an array

.data

.word 8, 3, 4, -2, -9, 10, 11, 0, 5 #8 is the length of the array
                                    #the array starts at 3

.text
lui t0, 0x10010 #load the address of the length of the array in t0
lw t1, 0(t0) #load in t1 the effective length of the array                                                                       
lw a0, 4(t0) #load in a0 the first element of the array, so 3
ori t0, t0, 0x08 #after this instr. t0 will contain the address of the second element of the array
addi t1, t1, -1 #before starting the 7 loops, we decrease the number stored in t1, which is 8, and we only need 7

ciclo: lw t2, 0(t0) #loop starts and stores in t2 the second element of the array, so 4
       bge t2, a0, jump #if content of t2 is >= a0, we jump, otherwise we execute the next instruction
       mv a0, t2 #move the content of t2 in a0
       
jump: addi t0, t0, 4 #load into t0 the address of the third element of the array, so -2
       addi t1, t1, -1 #decrease again the value of the remaining loops
       bne t1, zero, ciclo #we check when the loop must end
       li a7, 1
       ecall 
       li a7, 10
       ecall                                                                                                                                            



