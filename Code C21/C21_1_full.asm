# MIPS Assembly program using provided macros
# Solution for three parts (a, b, c) with part c handling string input from keyboard

#------- Macro Definitions -------#
# Macro to output a string => Xuat chuoi
.macro puts(%str_var)
	la 	$a0, %str_var    # Load string address
	addi 	$v0, $zero, 4     # Syscall 4 to print string
	syscall 
.end_macro

# Macro to input an integer with prompt = Thao tac In thong bao nhap va Nhap so
.macro geti_p(%prompt, %int_var)
	puts 	%prompt        	# Display prompt - Chuoi thong bao nhap so
	li 	$v0, 5           	# Syscall 5 to read integer
	syscall
	sw 	$v0, %int_var     # Store value to memory
.end_macro

# Macro to output an integer with prompt = Thao tac Xuat chuoi thong bap va Xuat Ket qua
.macro puti_p(%prompt, %int_var)
	puts	 %prompt           # Display prompt
	lw	 $a0, %int_var    # Load value from memory
	li	 $v0, 1              # Syscall 1 to print integer
	syscall
.end_macro

# Macro to input a string = Thao tac nhap chuoi voi do dai size
.macro gets(%buffer, %size)
	la	 $a0, %buffer      # Load buffer address
	li 	 $a1, %size        # Maximum string length (including NULL)
	li	 $v0, 8             # Syscall 8 to read string
	syscall
.end_macro

#------- Data Section -------#
.data
	# For part A
	message: .asciiz "Kien Truc May Tinh 2022.\n"
	
	# For part B
	input_prompt_a: .asciiz "Enter a: "
	input_prompt_b: .asciiz "Enter b: "
	input_prompt_c: .asciiz "Enter c: "
	result_msg: 	.asciiz "The result of f(a,b,c) = a - b + c is: "
	
	# For part C
	input_prompt: .asciiz "Enter a string from keyboard: "
	output_prompt: .asciiz "The string you entered is: "
	
	newline: .asciiz "\n"
	
	
# Memory to store values for B
	a: .word 0
	b: .word 0
	c: .word 0
	result: .word 0
# Memory to store values for C
	input_buffer: .space 100  # Reserve 100 bytes for input string
	

#------- Text Section -------#
.text
.globl main
main:
	#---------- Part A ----------#
	# Display "Kien Truc May Tinh 2022.\n"
		puts message
	
	#---------- Part B ----------#
	# Input values for a, b, c using macros
		geti_p input_prompt_a, a
		geti_p input_prompt_b, b
		geti_p input_prompt_c, c
	
	# Calculate f(a,b,c) = a - b + c
	lw $t0, a       # Load a into $t0
	lw $t1, b       # Load b into $t1
	lw $t2, c       # Load c into $t2
	
	sub $t3, $t0, $t1   # $t3 = a - b
	add $t3, $t3, $t2   # $t3 = (a - b) + c
	
	sw $t3, result  # Store result
	
	# Display result
	puti_p result_msg, result
	
	puts newline
	
	#---------- Part C ----------#
	# Input string from keyboard
	puts input_prompt  		# "Enter a string from keyboard: "
	gets input_buffer, 100
	# Display entered string
	puts output_prompt		# "The string you entered is: "
	puts input_buffer
	
	# End program
	li $v0, 10
	syscall
