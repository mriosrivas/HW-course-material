.text
.globl main
main:    
    addi $s0, $0, 4 # $s0 = 4
    addi $s1, $0, 1 # $s1 = 1
    j target # jump to target
    addi $s1, $s1, 1 # not executed
    sub $s1, $s1, $s0 # not executed
target:
    add $s1, $s1, $s0 # $s1 = 1 + 4 = 5
