#Xac dinh vi tri chu 'u' dau tien trong chuoi "Computer Architecture CSE-HCMUT". 
#i=0; 
#while(charArray[i]!=’u’ && charArray[i]!=’\0’) i++;
.include "macro.mac"
	.data
		i: 	.word 0
		
    		char_array: .asciiz "Computer Architecture CSE-HCMUT" 	# Luu Base add
    		found_msg: .asciiz "Found 'u' at position: "
    		not_found_msg: .asciiz "Character 'u' not found in the string."
	.text
	.globl main
	main:
    		# Initialize variables
    		la 	$t0, char_array    # Load base address of the string
    		li 	$t1, 0             	# i = 0
    		li 	$t2, 'u'           	# Character to find
    
    		# Start the while loop
	while_loop:
    		lb 	$t3, 0($t0)        		# Load character at charArray[i]
   		beq 	$t3, $t2, exit_loop    	# If charArray[i] == 'u', exit loop
    		beq 	$t3, $zero, exit_loop  	# If charArray[i] == '\0', exit loop
    
    		# Increment i and address - Tinh dia chi tro toi
    		addi 	$t1, $t1, 1      # i++
    		addi 	$t0, $t0, 1      # Move to next character
    		j 	while_loop          # Continue loop
    
	exit_loop:
    		# Check if character was found (if charArray[i] == 'u')
   		beq 	$t3, $t2, char_found
    
    		# Character not found
    		puts not_found_msg
    
	char_found:
		# Store value of $t1 into i
		sw 	$t1, i
    		# Print found message and position (i)
    		puts found_msg		# "Found 'u' at position: "
    		puti_Notp i		# i
   
	end_program:
    		# Exit program
    		li 	$v0, 10
    		syscall
