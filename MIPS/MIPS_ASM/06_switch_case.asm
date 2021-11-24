# Example of switch/case statement
#switch(amount) {
#   case 20: fee = 2; break;
#   case 50: fee = 3; break;
#   case 100: fee = 5; break;
#   default: fee = 0;
#               }


.data
amount: .word 50
fee: .word 10

.text
.globl main
main: 
# $s0 = amount, $s1 = fee
lw $s0, amount

case20:
    addi $t0, $0, 20
    bne $s0, $t0, case50
    addi $s1, $0, 2
    j done

case50:
    addi $t0, $0, 50
    bne $s0, $t0, case100
    addi $s1, $0, 3
    j done

case100:
    addi $t0, $0, 100
    bne $s0, $t0, default
    addi $s1, $0, 5
    j done

default:
    add $s1, $0, $0

done:
    sw $s1, fee
