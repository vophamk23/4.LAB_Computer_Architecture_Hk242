# MIPS program to calculate 100000 + 1000 - 100
# Note: 100000 exceeds the 16-bit immediate value range

##Chuong trinh: ten chuong trinh
	.include "macro.mac"
#---------------------------------Data segment------------------------#
	.data
    		result:		.word 0
    		result_msg:	.asciiz "The result of 100000 + 1000 - 100 = "
    		newline: 	.asciiz "\n"
#---------------------------------Code segment------------------------#
	.text
	.globl main

	main:
    # Since 100000 exceeds 16-bit immediate value range (max 32767),
    # we need to use a combination of instructions to load it
    
    # Method 1: Using lui and ori
    	lui $t0, 1          		# Load 1 into upper half of $t0 (1 * 65536 = 65536)
  	ori $t0, $t0, 34464 	# OR with 34464 (65536 + 34464 = 100000)
    
    # Alternative Method 2: Using two addi instructions
    	# li $t0, 0          	# Initialize $t0 to 0
    	# addi $t0, $t0, 65535 	# Add maximum 16-bit value
    	# addi $t0, $t0, 34465 	# Add remaining value (100000 - 65535)
    
    # Add 1000 to $t0
	addi $t0, $t0, 1000
    
    # Subtract 100 from $t0
    	addi $t0, $t0, -100  		# Using addi with negative constant
    # Alternative: sub $t0, $t0, 100  	# Using sub with immediate value
    
    	# METHOD 1
    	sw $t0, result			# Stroe $t0 into result
   	puti_p result_msg, result             # Use macro to Dislap output
   	puts newline
    
 	# METHOD 2
 	# Display result message
    		li $v0, 4
    		la $a0, result_msg
    		syscall
    	# Display the result in $t0
    		li $v0, 1
    		move $a0, $t0
    		syscall
   	 # Display newline
    		li $v0, 4
    		syscall
    
# Exit program
    	li $v0, 10
    	syscall
