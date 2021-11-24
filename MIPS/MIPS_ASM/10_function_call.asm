# for i in range(x):
#   y[i] = x[i]*h[i]

.data
x:  .word 1, 2, 3, 4, 5
h: .word 6, 7, 8, 9, 10
y: .space 20 #5 words of 4 bytes


.text
.globl main
main: 
la		$t0, x		    # $t0 = &x[0]
la		$t1, h		    # $t1 = &h[0]
la		$t2, y		    # $t2 = &y[0] 

li		$t3, 5		# $t3 = 5; range(x)
li		$t4, 0		# $t4 = 0; i=0



for:
    beq     $t4, $t3, done
    
    lw		$a0, 0($t0)		# a0 = x[i]
    lw		$a1, 0($t1)		# a1 = h[i] 
    jal		multiply		# jump to multiply and save position to $ra
    add     $s0, $v0, $0    # returned value
    sw		$s0, 0($t2)		# y[i] = x[i]*h[i]

    addi    $t4, $t4, 1     # i = i + 1

    addi		$t0, $t0, 4		# $t0 = $t0 + 4
    addi		$t1, $t1, 4		# $t1 = $t1 + 4
    addi		$t2, $t2, 4		# $t2 = $t2 + 4
       
    j for


multiply:
mult	$a0, $a1			# $a0 * at1 = Hi and Lo registers
mflo	$v0					# copy Lo to $v0
jr		$ra					# jump to $ra

done:
    nop

