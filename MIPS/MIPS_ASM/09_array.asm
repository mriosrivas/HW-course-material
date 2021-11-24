# Example of usign arrays
#int i;
#int array[10];
#
#for (i = 0; i < 10; i = i + 1)
#{
#    array[i] = array[i] * 8;
#}


.data
_initial_text: .asciiz "array[" 
_final_text: .asciiz "] = " 
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
_end: .asciiz "\n" 


.text
.globl main

main: 
    # $s0 = array base address, $s1 = i
    # initialization code
    #lui $s0, 0x1001         #$s0 = 0x1001
    #ori $s0, $s0, 0x000c    #$s0 = 0x000c
    la	 $s0, array		# 
    addi $s1, $0, 0         #i = 0
    addi $t2, $0, 10      #$t2 = 10

loop:
    slt $t0, $s1, $t2       # i < 10?
    beq $t0, $0, done       # if not, then done
    sll $t0, $s1, 2         # $t0 = i*4 (byte offset)
    add $t0, $t0, $s0       # address of array[i]
    lw $t1, 0($t0)          # $t1 = array[i]
    sll $t1, $t1, 3         # $t1 = array[i] * 8
    sw $t1, 0($t0)          # array[i] = array[i] * 8

    jal print
    addi $s1, $s1, 1        #i = i+1


    j loop                  # repeat


print:
    la $a0, _initial_text     # $address of string to print
    li $v0, 4       # $system call code for print_str
    syscall
    add $a0, $0, $s1
    addi $v0, $0, 1
    syscall
    la $a0, _final_text     # $address of string to print
    li $v0, 4       # $system call code for print_str
    syscall
    add $a0, $0, $t1
    addi $v0, $0, 1
    syscall
    la $a0, _end     # $address of string to print
    li $v0, 4       # $system call code for print_str
    syscall
    jr $ra # return

done:
    nop