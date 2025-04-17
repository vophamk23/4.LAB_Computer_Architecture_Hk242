#tinh chuoi Fibonacci bang vong lap va luu vao day f[] co 20 phantu. Nhap so n tu (0 den 19), 
#Xuat phan tu f[n] ra man hinh. Gia Thuat
#f[0]=0; f[1]=1; 
#for(i=2;i<n;i++){ f[i]=f[i-1]+f[i-2];} 

.include "macro.mac"
		.data
		# Dinh nghia cac Bien va mang
    		Fibonasi_array: .word 0:20         	# Array to store 20 Fibonacci numbers
    		input: .word 0
    		result: .word 0
    		
    		# Cac thong bao Nhap
    		prompt: .asciiz "Enter n (0-19): "
    		result_msg1: .asciiz "F["
    		result_msg2: .asciiz "] = "
    		error_msg: .asciiz "Error: n must be between 0 and 19.\n"

	.text
	.globl main
	main:
		# Prompt and Read integer n for user input
			geti_p prompt, input		# "Enter n (0-19): "
			lw 	$t1, input
		# Luu gia tri i duoc nhap vao, luu vào $s0 de dung sau nay
    			move	 $s0, $t1
    		
		  # Validate input
    			bltz 	$t1, invalid_input    	# if n < 0, invalid
    			bge 	$t1, 20, invalid_input 	# if n >= 20, invalid
    	invalid_input:
    		# Print error message
    			puts error_msg
    
     ## Tao ra 1 day so Fibo voi dia chi co so tai $t0 Bat dau tai i = 0
     		la 	$t0, Fibonasi_array     	# Load address base of fib_array into $t0
    		
    		# Initialize the first two Fibonacci numbers
    		sw 	$zero, 0($t0)       	# Store f[0] = 0 vao bo nho
    		
    		li 	$t1, 1			# Gan gia tri 1 vao $t1
    		sw 	$t1, 4($t0)         		# Store value of $t1 into f[1] = 1 in Memory
    		
    		# Initialize the Fibonacci numbers from F[2] to F[19]
    		# Calculate the rest of the Fibonacci sequence
    		li 	$t1, 2              		# i = 2 ( Start from number 3 with i=2)
	fib_loop:
    		bge 	$t1, 20, end_loop  	# if i >= 20, exit loop
    
    		# Calculate offset address for f[i] - Do doi dia chi cua moi phan tu thu i
    		sll 	$t2, $t1, 2        	# $t2 = i * 4 (offset for f[i]) dich 4 byte
    		add 	$t3, $t0, $t2      	# $t3 = address of f[i]
    
    		# Calculate offset for f[i-1]
    		addi 	$t4, $t2, -4      	# $t4 = offset for f[i-1]
    		add 	$t5, $t0, $t4      	# $t5 = address of f[i-1]
    		lw 	$t6, 0($t5)         # $t6 = f[i-1]
    		# Calculate offset for f[i-2]
    		addi 	$t4, $t2, -8      # $t4 = offset for f[i-2]
    		add 	$t5, $t0, $t4      # $t5 = address of f[i-2]
    		lw 	$t7, 0($t5)         # $t7 = f[i-2]
    		# Calculate f[i] = f[i-1] + f[i-2]
   		add 	$t8, $t6, $t7      # $t8 = f[i-1] + f[i-2]
    		sw 	$t8, 0($t3)         # f[i] = $t8
    
    		# Increment i
    		addi 	$t1, $t1, 1       # i++
    		j 	fib_loop
	end_loop:
    		
    		# Calculate address of f[i] - Voi i nhap vao vao duoc luu vao $s0 
    		sll 	$t2, $s0, 2        # $t2 = n * 4 (byte offset)
    		add 	$t3, $t0, $t2      # $t3 = address of f[n]
    		lw 	$t4, 0($t3)         # $t4 = f[n]
    		sw	$t4, result	# Store value of $t4 into Result 
    		
    		#Xuat cau lenh Thong bao Result
    		puts result_msg1	# "F["
   		puti_Notp input		# Thu i
    		puts result_msg2	# "] = "
    		puti_Notp result
   
    	 # Exit program
    	li 	$v0, 10
    	syscall
    

   
