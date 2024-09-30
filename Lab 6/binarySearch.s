.data
    my_array: .word 5, 9, 12, 16, 20, 32, 34, 54
    len: .word 8
    output_msg: .asciiz "Here is the index: "
    input_msg: .asciiz "Enter a number you want to find: "
.text
    .globl main

main:

terminate:
    la $a0, input_msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    la $a0, my_array
    lw $a1, len
    ori $a2, $zero, 0
    lw $a3, len
    # move $t0, $a0
    # sll $t1, $a3, 2
    # add $t1, $t1, $t0
    move $s0, $v0

    addi $sp, $sp, -8
    sw $a2, 0($sp)
    sw $a3, 4($sp)
    li $v0, -1
    jal binarySearchrecursive
    lw $a2, 0($sp)
    lw $a3, 4($sp)
    addi $sp, $sp, 8

    move $s1, $v0

    la $a0, output_msg
    li $v0, 4
    syscall

    move $a0, $s1
    li $v0, 1
    syscall

    li $v0, 10
    syscall

binarySearchrecursive:
    beq $a2, $a3, return_from_code
    addi $sp, $sp, -4
    sw $ra, 8($sp)
    add $t0, $a2, $a3
    srl $t0, $t0, 1
    sll $t1, $t0, 2 
    add $t1, $t1, $a0
    lw $t1, 0($t1)
    beq $t1, $s0, equal
    bge $t1, $s0, greater
    j lesser
equal: 
    addi $sp, $sp, 4
    move $v0, $t0
    jr $ra
greater:
    addi $a3, $t0, 0
    j move_to_lower_level
lesser:
    addi $a2, $t0, 1
move_to_lower_level:
    jal binarySearchrecursive
    lw $ra, 8($sp)
    addi $sp, $sp, 4
    jr $ra
return_from_code:
    sll $t0, $a2, 2
    add $t0, $t0, $a0
    lw $t0, 0($t0)
    bne $t0, $s0, final_exit
    move $v0, $a2
final_exit:
    jr $ra