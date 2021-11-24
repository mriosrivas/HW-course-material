.data
num: .word 14
numa: .word 16

.text
.globl main
main:
    lw $t0, num
    lw $t1, numa
    add  $s0, $0, $t0 # $s0 = 0 + 14 = 14
    add  $s1, $0, $t1 # $s1 = 0 + 16 = 16
    beq  $s0, $s1, target # $s0 = = $s1, so branch is taken
    #bne	 $s0, $s1, target2 # $s0 = = $s1, so branch is taken
    sub $s0, $s1, $s0 # not executed
    j final


target:
    add $s1, $s1, $s0 # $s1 = 9 + 25 = 8
    #j final

#target2:
#    sub $s0, $s1, $s0 # not executed

final:
    nop




   

    
