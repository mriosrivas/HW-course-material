# Author: Manuel Rios
# Date: November 14th, 2020
#
# Convolution algorithm implemented in the following way:
#           for i in range(x):
#               for j in range(h):
#                   y[i+j] = y[i+j] + x[i]h[j]
#

.data
_initial_x: .asciiz "x = " 
_initial_h: .asciiz "h = " 
_initial_y: .asciiz "y = " 

x:  .word 1, 2, 3, 4, 5, 6
h:  .word 1, 1, 1, 1, 2, 2, 2, 2
y:  .space 56                        #14 words of 4 bytes

SIZE_X = 6
SIZE_H = 8
SIZE_Y = 13                         # SIZE_X + SIZE_H - 1

.text
.globl main
main: 
la		$s0, x		                # $s0 = &x[0]
la		$s1, h		                # $s1 = &h[0]
la		$s2, y		                # $s2 = &y[0] 

add		$a0, $s2, $0		        # a = $t1 + $t2
li      $a1, SIZE_Y
jal		clean				        # jump to clean and save position to $ra

li		$t0, 0		                # $t0 = 0; i=0
li		$t1, 0		                # $t1 = 0; j=0
li      $t2, SIZE_X                 # limit for i
li		$t3, SIZE_H		            # limit for j


for_i:
    beq		$t0, $t2, end_for_i	    # if $t0 == $t2 then end_for_i
    for_j:
        beq		$t1, $t3, end_for_j	# if $t1 == $t3 then end_for_j
        
        #Convolution y[i+j] = y[i+j] + x[i]h[j]

        sll     $t4, $t0, 2         # i*4 points next word
        sll     $t5, $t1, 2         # j*4 points next word
        
        add     $a0, $s0, $t4
        lw		$s4, 0($a0)		    # x[i]
        add     $a0, $s1, $t5
        lw		$s5, 0($a0)		    # h[j]
        add     $a0, $s2, $t4
        add     $a0, $a0, $t5  
        lw		$s6, 0($a0)		    # y[i+j]

        mult	$s4, $s5			#s4 * s5 = Hi and Lo registers
        mflo	$s7					# copy Lo to $s7

        add     $s6, $s6, $s7       # y[i+j] = y[i+j] + x[j]*h[i]
        sw		$s6, 0($a0)		    # save y[i+j] into  memory
       
        
           
        addi $t1, $t1,1             # j = j + 1
    j for_j
    end_for_j:
    addi    $t0, $t0,1              # i = i + 1
    li		$t1, 0		            # $t1 = 0
    
    
j for_i
end_for_i:

# Printing functions
la      $a0, _initial_x             # address of string to print
jal     print_text
la		$a0, x		                # address of x
li		$a1, SIZE_X		            # size of x
jal     print

la      $a0, _initial_h             # address of string to print
jal     print_text
la		$a0, h		                # address of h
li		$a1, SIZE_H		            # size of h  
jal     print

la      $a0, _initial_y             # address of string to print
jal     print_text
la		$a0, y		                # address of y
li		$a1, SIZE_Y		            # size of y  
jal     print

j done


# Auxiliary Functions

# void clean(*int var, int size_var)
# var ($a0): (pointer) first position of array variable to clean
# size_var ($a1): (int) size of array variable to clean

clean:                                      # clean funtion to set initial y to zeros
    li		$t0, 0		                    # i = 0
    add		$t1, $a1, $0 	                # N = size_var
    
    
    for_clean:
        beq		$t0, $t1, end_for_clean	    # if i == N then end_for_clean
        li		$t2,0                       # value_to_store = 0 
        sw		$t2, 0($a0)		            # save value_to_store in memory
        addi    $t0, $t0,1                  # i = i + 1
        addi	$a0, $a0, 4			        # $a0 = $a0 + 4, next memory address
        j       for_clean

    end_for_clean:
    jr  $ra					                # jump to $ra


# void print(*int var, int size_var)
# var ($a0): (pointer) first position of array variable to print
# size_var ($a1): (int) size of array variable to print
print:
    add		    $s0, $a0, $0		        # $s0 = a0 + 0
    add		    $s1, $a1, $0		        # s1 = $a1 + 0
    li          $t0, 0

    li		    $a0, 91		                # ASCII symbol "[" is 91
    addi        $v0, $0, 11
    syscall

    for_print:
        beq         $t0, $s1, end_for_print
        lw		    $a0, 0($s0)		        # print i-th element of array
        addi        $v0, $0, 1
        syscall

        li		    $a0, 44		            # ASCII symbol "," is 44
        addi        $v0, $0, 11
        syscall

        addi        $t0, $t0, 1
        addi		$s0, $s0, 4		        # $t0 = $t1 + $t2
        
        j for_print
    
    end_for_print: 

    li		    $a0, 93		                # ASCII symbol "]" is 93
    addi        $v0, $0, 11
    syscall 

    li		    $a0, 10		                # ASCII symbol new line is 10
    addi        $v0, $0, 11
    syscall 

    jr      $ra					            # jump to $ra

# void print_text(*int text)
# text ($a0): (pointer) address of text string to print
print_text:
    li          $v0, 4                      # $system call code for print_str
    syscall
    jr      $ra					            # jump to $ra
    
    
# End of code
done:                                       # end of code
    nop
    j       done
