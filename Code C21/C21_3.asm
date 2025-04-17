#Chuong trinh: ten chuong trinh
	.include "macro.mac"
#Data segment
	.data
	#Cac bien nhap vao
 	   	prompt_a: .asciiz "Enter value for a: "
   	   	prompt_b: .asciiz "Enter value for b: "
    	   	prompt_c: .asciiz "Enter value for c: "
    		prompt_d: .asciiz "Enter value for d: "
    		prompt_x: .asciiz "Enter value for x: "
    		result_msg: .asciiz "f(x) = a·x³ + b·x² - c·x - d = "
  	
  	    	newline: .asciiz "\n"
	#Cac dinh nghia bien    
   	 	a: .word 1
    		b: .word 2
    		c: .word -3
    		d: .word -4
    		x: .word 13
    		result_f: .word 14	
	
#Code segment
	.text
	.globl main

	main:
    	# Prompt and read values for a, b, c, d, x using macros
   		geti_p prompt_a, a
    		geti_p prompt_b, b
    		geti_p prompt_c, c
    		geti_p prompt_d, d
    		geti_p prompt_x, x
    
    		# Load values into registers for calculation
    		lw $s0, a    # $s0 = a
    		lw $s1, b    # $s1 = b
    		lw $s2, c    # $s2 = c
    		lw $s3, d    # $s3 = d
    		lw $s4, x    # $s4 = x
    
    		# Calculate f(x) using Horner's method
    		# f(x) = ((a·x + b)·x - c)·x - d    
    		# t = a·x
    		mul $t0, $s0, $s4    # $t0 = a·x
    		# t = t + b
    		add $t0, $t0, $s1    # $t0 = a·x + b
    		# t = t·x
    		mul $t0, $t0, $s4    # $t0 = (a·x + b)·x
    		# t = t - c
    		sub $t0, $t0, $s2    # $t0 = (a·x + b)·x - c
    		# t = t·x
    		mul $t0, $t0, $s4    # $t0 = ((a·x + b)·x - c)·x
    		# t = t - d
    		sub $t0, $t0, $s3    # $t0 = ((a·x + b)·x - c)·x - d
    
    		#METHOD 1
    		#Store the result
    		sw $t0, result_f
                       	puti_p result_msg, result_msg
    		puts newline
    		
    		#METHOD 2
    		# Print result message and value "f(x) = a·x³ + b·x² - c·x - d = "
    		   	puts result_msg
    		# Print the result value
    			li 	$v0, 1 		#Goi lenh de xuat so nguyen
    			move 	$a0, $t0 	# Xuat ket qua result_f
    			syscall
    
    		# Print a newline
    		puts newline
    
    	# Exit the program
    	li $v0, 10
    	syscall
