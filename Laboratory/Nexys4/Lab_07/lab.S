# Exercise 1: Load data
 .text
 .globl main

 main:
    lui t0, 0xFEDC8
    addi t0, t0,-1


# Exercise 2: For example
.text
.globl main
main:
    li t0, 10
    li t1, 0
    li t2, 5

loop:
    beq t1, t0, end
    add t2, t2, t1
    addi t1, t1, 1
    j loop
end:
nop


# Exercise 3: Multiply and divide
.text
.globl main

main:
    addi s0, zero, 35
    addi s1, zero, 17
    mul s3, s0, s1
    mulh s4, s0, s1
    div s5, s0, s1
    rem s6, s0, s1


# Exercise 4: Branch
.text
.globl main
main:
    addi s0, zero, 4
    addi s1, zero, 1
    sll s1, s1, 2
    beq s0, s1, target
    addi s1, s1, 1
    sub s1, s1, s0
    j next

target:
    add s1, s1, s0

next:
    nop


# Exercise 5: Branch and memory
.data
    num: .word 4

.text
.globl main
main:
    # addi s0, zero, 4
    lw t0, num
    add s0, zero, t0
    
    addi s1, zero, 1
    sll s1, s1, 2
    beq s0, s1, target
    addi s1, s1, 1
    sub s1, s1, s0
    j next

target:
    add s1, s1, s0

next:
    nop


# Exercise 6: Seven digit display
#define SegEn_ADDR    0x80001038
#define SegDig_ADDR   0x8000103C

.globl main
main:

    li t1, SegEn_ADDR
    li t6, 0x00
    sb t6, 0(t1)						# Enable the 7SegDisplays

    li t1, SegDig_ADDR
    li t6, 0xABCDEF12
    sw t6, 0(t1)						# Write the 7SegDisplays

next:	beq zero, zero, next

.end


# Exercise 7: If statement
# if (i == k)
#   f = g + h;
# f = f – i;

.data
f: .word 15
g: .word 5
h: .word 12
i: .word 4
k: .word 4

.text
.globl main
main: 
    lw s0, f           # s0 = f
    lw s1, g           # s1 = g
    lw s2, h           # s2 = h
    lw s3, i           # s3 = i
    lw s4, k           # s4 = k
    bne s3, s4, L1     # if i ! = k, skip if block
    add s0, s1, s2     # if block: f = g + h
L1:
sub s0, s0, s3         # f = f − i


# Exercise 8: Switch/case statement
# switch(amount) {
#   case 20: fee = 2; break;
#   case 50: fee = 3; break;
#   case 100: fee = 5; break;
#   default: fee = 0;
#               }


.data
amount: .word 50
fee: .word 10

.text
.globl main
main: 
# s0 = amount, s1 = fee
lw s0, amount
la t1, fee

case20:
    addi t0, zero, 20
    bne s0, t0, case50
    addi s1, zero, 2
    j done

case50:
    addi t0, zero, 50
    bne s0, t0, case100
    addi s1, zero, 3
    j done

case100:
    addi t0,zero, 100
    bne s0, t0, default
    addi s1, zero, 5
    j done

default:
    add s1, zero, zero

done:
    sw s1, 0(t1)


# Exercise 9: While loop statement
# int pow = 1;
# int x = 0;
#
# while (pow != 128)
# {
#   pow = pow * 2;
#   x = x + 1;
# }

.text
.globl main

main: 
    # s0 = pow, s1 = x, t0 = 128
    addi s0, zero, 1
    add s1, s1, zero
    addi t0, zero, 128


while:
    beq s0, t0, done
    sll s0, s0, 1
    addi s1, s1, 1
    j while


done:
    nop


# Exercise 10: Loop statement
# int sum = 0;

# for (i = 0; i != 10; i = i + 1) 
# {
#    sum = sum + i ;
# }


.text
.globl main

main: 
    # s0 = i, s1 = sum
    add s1, zero, zero     # sum = 0
    add s0, zero, zero     # i = 0
    addi t0, zero, 10       # t0 = 10

for:
    beq s0, t0, done
    add s1, s1, s0
    addi s0, s0, 1
    j for

done:
    nop


# Exercise 11: Arrays
# int i;
# int array[10];
#
# for (i = 0; i < 10; i = i + 1)
# {
#    array[i] = array[i] * 8;
# }


.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.globl main

main: 
    # s0 = array base address, s1 = i
    # initialization code
    la	 s0, array		
    add s1, zero, zero         # i = 0
    addi t2, zero, 10          # t2 = 10

loop:
    slt t0, s1, t2          # i < 10?
    beq t0, zero, done      # if not, then done
    sll t0, s1, 2           # t0 = i*4 (byte offset)
    add t0, t0, s0          # address of array[i]
    lw t1, 0(t0)            # t1 = array[i]
    sll t1, t1, 3           # t1 = array[i] * 8
    sw t1, 0(t0)            # array[i] = array[i] * 8

    addi s1, s1, 1          # i = i+1
    j loop                  # repeat

done:
    nop
