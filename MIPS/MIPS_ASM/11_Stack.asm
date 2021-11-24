# for i in N:
#   for j in M:
#       print(i+j)

.data
_plus: .asciiz "+"
_equal: .asciiz "="
_enter: .asciiz "\n"

N = 5
M = 6

.text
.globl main
main:

li		$t0, 0 		        # i = 0
addi	$t1, $0, 0			# j = 0
addi	$s0, $0, N			# assign N
li      $s1, M              # assign M

for_i:
    beq $t0, $s0, done_for_i

    for_j:
        beq $t1, $s1, done_for_j
      
        add	$a0, $t0, $0
        add	$a1, $t1, $0	
        jal print

        addi $t1, $t1, 1
        j for_j

    done_for_j:
    addi $t0, $t0, 1
    li $t1,0
j for_i


# void print(int i, int j)
# prints "i + j = result"
print:
        addi  $sp, $sp, -12
        sw $ra, 0($sp)
        sw $t0, 4($sp)
        sw $t1, 8($sp)
       
        add		$t0, $a0, $0
        add		$t1, $a1, $0		

        add      $a0, $t0, $0
        jal print_int
        
        la		$a0, _plus		# 
        jal print_str

        add      $a0, $t1, $0
        jal print_int

        la		$a0, _equal		# 
        jal print_str
        
        add $a0, $t0,$t1
        jal print_int

        la	$a0, _enter		# 
        jal print_str

        lw $ra, 0($sp)
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        addi $sp, $sp, 12

        jr		$ra					# jump to $ra
        
    


print_str:
    li $v0, 4       # $system call code for print_str
    syscall
    jr		$ra					# jump to $ra
    

print_int:
    addi $v0, $0, 1
    syscall
    jr		$ra					# jump to $ra
    


done_for_i:
    j finish


finish:
    nop

