.text
.globl main
main:
    addi $s0, $0, 4 # $s0 = 0 + 4 = 4
    addi $s1, $0, 1 # $s1 = 0 + 1 = 1
    sll $s1, $s1, 2 # $s1 = 1 << 2 = 4
    beq $s0, $s1, target # $s0 = = $s1, so branch is taken
    addi $s1, $s1, 1 # not executed
    sub $s1, $s1, $s0 # not executed
    j next

target:
    add $s1, $s1, $s0 # $s1 = 4 + 4 = 8
    
next:
    nop
