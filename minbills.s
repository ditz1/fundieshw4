
minbills:	
    # At the start of minbills the argument can be found in $a0.

    # Replace the line below with your code
    li $v0, 0
    li $t0, 0 # count = 0
    move $t1, $a0 #currvalue = totalvalue
   
   #BRANCH ON GEQ FOR 10, 5 , 1
minbills_loop:    
    bge $t1, 10, geq_ten
    bge $t1, 5, geq_five
    bge $t1, 1, geq_one
    # move count into return register 
    move $v0, $t0
    j return

geq_ten:
    add $t0, $t0, 1 # count = count + 1
    sub $t1, $t1, 10 # currvalue = currvalue - 10
    j minbills_loop
geq_five:
    add $t0, $t0, 1 # count = count + 1
    sub $t1, $t1, 5 # currvalue = currvalue - 10
    j minbills_loop
geq_one:
    add $t0, $t0, 1 # count = count + 1
    sub $t1, $t1, 1 # currvalue = currvalue - 10
    j minbills_loop
return:	
    # Your return value should be in $v0 prior to returning.
    jr $ra

#### Do not remove this separator. Place all of your code above this line. ####


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# minbills(10) = 1
	li $a0, 10
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(40) = 4
	li $a0, 40
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(57) = 8
	li $a0, 57
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(156) = 17
	li $a0, 156 
	jal minbills
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

print_string:
	li $v0, 4
	syscall
	jr $ra
