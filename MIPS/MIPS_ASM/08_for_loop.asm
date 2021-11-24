# Example of for loop statement
#int sum = 0;

#for (i = 0; i != 100; i = i + 1) 
#{
#    sum = sum + i ;
#}


.data
_text: .asciiz "sum = " 

.text
.globl main

main: 
    #$s0 = i, $s1 = sum
    addi $s1, $0, 0     #sum = 0
    addi $s0, $0, 0     #i = 0
    addi $t0, $0, 10    #$t0 = 100

for:
    beq $s0, $t0, done
    add $s1, $s1, $s0
    addi $s0, $s0, 1
    j for

print:
    li $v0, 4       # $system call code for print_str
    la $a0, _text     # $address of string to print
    syscall
    add $a0, $0, $s1
    addi $v0, $0, 1
    syscall
    jr $ra # return

done:
    jal print
    nop
