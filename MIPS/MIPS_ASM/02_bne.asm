.data
num: .word 6

.text
.globl main
main:
    lw $t0, num             # $t0 = num
    add $s0, $0, $t0        # $s0 = 0 + num = num
    addi $s1, $0, 1         # $s1 = 0 + 1 = 1
    sll $s1, $s1, 2         # $s1 = 1 << 2 = 4
    bne $s0, $s1, target    # $s0 = = $s1, so branch is taken
    addi $s1, $s1, 1        # not executed
    sub $s1, $s1, $s0       # not executed

target:
    add $s1, $s1, $s0 # $s1 = 4 + 4 = 8
