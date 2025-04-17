#For b=100, c=2. Value input read from user. Dislay value of a
#switch (input)
#{ case 1: a = b + c; break;
#case 2: a = b - c; break;
#case 3: a = b * c; break;
#case 4: a = b / c; break;
#default: a = 0;
#} 

.include "macro.mac"
	.data
		#Cac bien dinh nghia
		input: .word 0
		result_a: .word 0
		
    		#Cac cau nhac nhap du lieu
    		input_prompt: .asciiz "Enter a value (1-4): "
    		result_msg: .asciiz "Result a = "
		
	.text
	.globl main
	main:
		# Load values of b and c
    		addi 	$t1, $zero, 100             # $t1 = b = 100 (int_b)
    		addi 	$t2, $zero, 2                # $t2 = c = 2 (int_c)
    		# Initialize a = 0 (default case)
    		li 	$t3, 0          		# $t3 will store a 
	
    		# Print prompt and Read integer Input from user
    			geti_p input_prompt, input
    		# Load the input value into $t0 for comparisons
    			lw 	$t0, input
    		# Begin switch-case structure
    		beq 	$t0, 1, case1     	# if input == 1, goto case1
    		beq 	$t0, 2, case2     	# if input == 2, goto case2
    		beq 	$t0, 3, case3     	# if input == 3, goto case3
    		beq 	$t0, 4, case4     	# if input == 4, goto case4
    		j 	default             	# if none of the above, goto default
    
	case1:
    		add 	$t3, $t1, $t2     # a = b + c
    		j 	end_switch
    
	case2:
    		sub 	$t3, $t1, $t2     # a = b - c
    		j 	end_switch
    
	case3:
    		mul 	$t3, $t1, $t2     # a = b * c
    		j 	end_switch
    
	case4:
    		div 	$t3, $t1, $t2     # a = b / c
    		j 	end_switch
    
	default:
    		li 	$t3, 0             # a = 0
    	# Fall through to end_switch
    
	end_switch:
		# Store value of $t3 into result_a
		sw 	$t3, result_a
    		# Print result string and Value of a
    		puti_p result_msg, result_a
    
    		# Print newline
    		linefeed
    
    	# Exit program
    	li 	$v0, 10
    	syscall