
fizzbuzz:
    # Do not remove this code.  It is necessary for the subcalls to the print functions.
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    
    li $t0, 1 # LOAD IMMEDIATE into reg t0, counter 1
    move $t1, $a0 #a0 has the number that we want to run the loop for
    #load it into reg t1
    
    ###LOOP### #how else do we check if its not just a loop
fizzbuzz_count:
    #check if the loop should terminate
    #is counter > end reg?
    bgt $t0, $t1, return_from_fizzbuzz #BRANCH GREATER THAN
    #so now we wanna check if the numbers are divisible by 3
    li $t2, 3 #load "3" into reg t2
    #divide num in count register by 3
    div $t0, $t2
    #MOVE FROM HI -- loads value from div into t4 register
    mfhi $t3   #this is the remainder
    #now we wanna check if the remainder is 0
   
    li $t4, 5 
    
    div $t0, $t4
    mfhi $t5
    #BRANCH EQUAL
    beq $t3, $zero, div_by_3
    

    #DIVISIBLE BY 5 
    #will just do it here
    #put the remainder in reg t5

    beq $t5, $zero, div_by_5
    j print_count

div_by_3:
    #need to check if also divisible by 5 but probably shouldnt do that here
    #remainder is in t3  
    #check if its also divisible by 5
    #if it is, it will print fizzbuzz
    beq $t5, $zero, print_fizzbuzz
    #if not, it will just print fizz
    jal print_fizz
    #increment loop
    addi $t0, $t0, 1 #put t0 + 1 in reg t0
    j fizzbuzz_count

#this should be the same thing just print buzz
div_by_5:
  #IF ONLY DIVISIBLE BY 5 AND NOT 3
    jal print_buzz
    addi $t0, $t0, 1
    j fizzbuzz_count

#if not divisible by 3 or 5, just print count
print_count:
    #move val from reg t0 (count) into reg a0 (output)
    move $a0, $t0
    jal print_int
    addi $t0, $t0, 1
    #is this an infinite loop
    j fizzbuzz_count
    # Put your code here.
    # To print an integer, put the integer in $a0 call the helper:
    #    jal print_int
    # To print a string, make the appropriate function call:
    #    jal print_fizz
    #    jal print_buzz
    #    jal print_fizzbuzz
	
return_from_fizzbuzz:	
	# return to calling function
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	

#### Do not remove this separator. Place all of your code above this line. ####

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# fizzbuzz(10) 
	li $a0, 10
	jal fizzbuzz
	jal print_newline

	# fizzbuzz(20) 
	li $a0, 20
	jal fizzbuzz
	jal print_newline

	# fizzbuzz(100) 
	li $a0, 100
	jal fizzbuzz
	
	# return
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
	
print_fizz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, fizz_string
	jal print_string
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_buzz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, buzz_string
	jal print_string
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_fizzbuzz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, fizzbuzz_string
	jal print_string
	jal print_newline
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
	

.data

fizz_string: .asciiz "fizz"
buzz_string: .asciiz "buzz"
fizzbuzz_string: .asciiz "fizzbuzz"
