#Program number 1, Roxy
#Print "pari" if 7 is even, otherwise "dispari"

#If I check the last bit, where 0 = even and 1 = odd, I know a number is even or odd, bc
#I can use andi with the number 1 in binary: 111 andi 001

.data

.word 7 #since its the first declaration: starts at a memory address divisible by 4, usually 0x10010
.asciz "Pari" #5 bytes: 4 bytes for "pari" + 1 byte for 0 since .asciz is a directive used to declare null-terminated strings
.asciz "Dispari"

.text

lui t0, 0x10010 #puts address of 7 in t0
lw t1, 0(t0) #7 goes in t1
andi t1, t1, 1
beq t1, zero, epari
addi a0, t0, 9
addi a7, zero, 4 #print string
ecall
beq zero, zero, uscita

  epari:
  ori a0, t0, 4 #putting address of string "pari"
  addi a7, zero, 4  #print string 
  ecall
  
  uscita:
  addi a7, zero, 10 #exit
  ecall
  
  
