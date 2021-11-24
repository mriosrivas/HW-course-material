# Example of if else statement
#if (a == 0)
#   if (c == 0)
#       $s0 = 0
#   else
#       $s0 = 1
#else
#   if (c == 0)
#       $s0 = 2
#   else
#       $s0 = 3


.data
a: .word 1
c: .word 1

.text
.globl main
main: 
    lw $s1, a       #$s1 = a
    lw $s2, c       #$s2 = b
    bne $0, $s1, else_1    # if a ! = 0, branch to else_1
    bne $0, $s2, else_2
    addi $s0, $0, 0
    j end

else_1:
    bne $0, $s2, else_3
    addi $s0, $0, 2
    j end

else_2:
    addi $s0, $0, 1
    j end

else_3:
    addi $s0, $0, 3
    j end

end:
    nop
