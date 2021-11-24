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

_text: .asciiz "The value returned is:" 

.text
.globl main
main: 
    lw $s1, a       #$s1 = a
    lw $s2, c       #$s2 = b
    bne $0, $s1, else_1    # if a ! = 0, branch to else_1
    bne $0, $s2, else_2
    addi $s0, $0, 0
    ### system calls ###
    li $v0, 4       # $system call code for print_str
    la $a0, _text     # $address of string to print
    syscall
    add $a0, $0, $s0
    addi $v0, $0, 1
    syscall
    ### end system call ##
    j end

else_1:
    bne $0, $s2, else_3
    addi $s0, $0, 2
    jal system_call
    j end

else_2:
    addi $s0, $0, 1
    jal system_call
    j end

else_3:
    addi $s0, $0, 3
    jal system_call
    j end


system_call:
    ### system calls ###
    la $a0, _text     # $address of string to print
    li $v0, 4       # $system call code for print_str
    syscall
    add $a0, $0, $s0
    addi $v0, $0, 1
    syscall
    ### end system call ##
    jr $ra # return

end:
    nop
