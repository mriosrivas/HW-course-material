# Example of if else statement
#if (i == k)
#   f = g + h;
#else
#   f = f – i;
#


.data
f: .word 15
g: .word 5
h: .word 12
i: .word 3
k: .word 3

.text
.globl main
main: 
    lw $s0, f       #$s0 = f
    lw $s1, g       #$s1 = g
    lw $s2, h       #$s2 = h
    lw $s3, i       #$s3 = i
    lw $s4, k       #$s4 = k
    bne $s3, $s4, else    # if i ! = k, branch to else
    add $s0, $s1, $s2   # if block: f = g + h
    j L2
else:
sub $s0, $s0, $s3 # f = f − i
L2:
nop
