ifib:	
    # At the start of fibonacci, the argument can be found in $a0.

    # Replace the line below with your code
    li $v0, 0
    beq $a0, $zero, return # just return 0 if its 0
    beq $a0, 1, return # return 1 if its 1
    li $t0, 0 # int x = 0
    li $t1, 1 # int y = 1
    li $t2, 0 # int z  = 0
    # we will start the counter at 2 since we return 1
    li $t3, 0 # int i 
fib_loop: #for
    # z = x + y
    add $t2, $t1, $t0
    # x = y
    move $t0, $t1
    # y = z
    move $t1, $t2
    #if loop terminate then return 
    #the add actually has to be first or its an infinite loop
    #no else clause in asm
    addi $t3, $t3, 1 # i++
    #BRANCH LESS THAN  ## i<a case ## 
    blt $t3, $a0, fib_loop 
    
    # set return value  
    move $v0, $t0 # return x
    j return 


return:	
    # Your return value should be in $v0 prior to returning
    jr $ra


#### Do not remove this separator. Place all of your code above this line. ####


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# ifib(0) = 0
	li $a0, 0
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(4) = 3
	li $a0, 4
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(5) = 5
	li $a0, 5
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(44) = 701408733 
	li $a0, 44
	jal ifib
	move $a0, $v0
	jal print_int
	
	# return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_int:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 1
	syscall
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_newline:
 	li $v0, 11
 	li $a0, 10
 	syscall
	jr $ra
	
