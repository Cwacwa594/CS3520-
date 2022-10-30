#########################################################################
#	Author:			Rammalane Emmanuel MOloli		#
#	Stundent ID:		202002098				#
#	Email:			rammalanemololi@gmail.com		#
#	Contacts:		63121094/ 53159035			#
#	Date:			October 27 2022				#
#	Task:			Finding reversible prime squares	#
#########################################################################



.data
	newLine:	.asciiz		"\n"
.globl main
.text
	main:
		jal	revesible_prime_square
	
	li	$v0, 10
	syscall
	
	revesible_prime_square:
		li	$t0, 0				#$t0 = 0 ,number
		li	$t1, 0				#$t1 = 0 ,counter
		first_for:
			bge	$t1, 10, exit			# Exit the loop if contents of $t1 = 10
		
			addi	$a1, $t0, 0
			jal	is_prime
		
			move	$t3, $v1
			bne	$t3, 1, loopAgain
		
			mul	$a0, $t0, $t0
			addi	$t9, $a0, 0		# $t9 = square
		
			jal	reverse_function
		
			move	$t4, $v1		# $t4 = reversed
		
			beq	$t9, $t4, loopAgain	#Checking Palindrome
		
			addi	$t8, $t4, 0
		
			li	$t7, 2
			li	$t6, -1	 #iterate
			div	$t8, $t7
		
			mflo	$t8
		
			second_for:
				bge	$t6, $t8, loopAgain
			
				addi	$t6, $t6, 1
			
				mul	$t3, $t6, $t6
			
				bne	$t3, $t4, go_to_second_for
			
				addi	$a1, $t6, 0		# $t7...test value for is prime
			
				jal	is_prime
		
				move	$t3, $v1
				bne	$t3, 1, loopAgain
			
				li	$v0, 4
				la	$a0, newLine
				syscall
			
				li	$v0, 1
				move	$a0, $t9
				syscall
			
				addi	$t1, $t1, 1
			
			
				j	second_for
		jr	$ra
	
	go_to_second_for:
		
		j	second_for
	exit:
		li	$v0,10
		syscall
	
	# This increaments the number and then jumps to for loop
	loopAgain:
		addi	$t0, $t0, 1
		
		j	first_for
	
	is_prime:
	# Test value stored into $t0
	#li	$t7, 101
	
	li	$t3, 2

	prime_for:
		blt	$a1, $t3, returnZero
	
		bge	$t3, $a1, returnOne
	
		div	$a1, $t3
		mfhi	$t2
	
		beqz	$t2, returnZero
		addi	$t3, $t3, 1
		j	prime_for
	jr	$ra

	returnOne:
		li	$v1, 1
		
		jr	$ra
		
		
	returnZero:
		li	$v1, 0
		
		jr	$ra
	
	reverse_function:	
		# Test value
		#li	$t2, 123
		
		li	$t3, 10
		li	$t6, 0 		#remainder
		
		while:
			beqz	$a0, reversed
			div	$a0, $t3
			mfhi	$t5	
			mflo	$a0				
			mul	$t6, $t6, 10
			add	$t6, $t6, $t5
			
			j	while
			
		jr	$ra
		
	reversed:
		move	$v1, $t6
		
		jr	$ra
