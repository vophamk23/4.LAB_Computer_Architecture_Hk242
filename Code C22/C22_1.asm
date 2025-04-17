# Bài 1: Cau trúc IF-ELSE trong MIPS
# if(a%2==0) 
#    {print string "Computer Science and Engineering, HCMUT."}
# else 
#    {print string "Computer Architecture 2024."}

#Chuong trinh: ten chuong trinh
	.include "macro.mac"
	.data
		prompt_a:       .asciiz "Nhap so nguyen a: "
		msg_even:   .asciiz "Computer Science and Engineering, HCMUT."
		msg_odd:    .asciiz "Computer Architecture 2024."
		int_a:          .word 0
	.text
	.globl main
	main:
    		# Nhap giá tri a
		geti_p prompt_a, int_a
    
    		# Kiem tra neu a chia het cho 2 (a % 2 == 0)
    		lw 	$t0, int_a           # $t0 = a
    		li 	$t1, 2           	# $t1 = 2
    		div 	$t0, $t1        	# a / 2
    		mfhi 	$t2            	# $t2 = a % 2 (lay phan du)
    
    		# Neu phan du = 0 thì a chan, nguoc lai a le
    		beq 	$t2, $zero, even    # Neu $t2 == 0 thì nhay den nhãn even
    		# Truong hop ELSE: a là so le (Phan du != 0)
    		puts 	msg_odd
    		j 	exit              
    
	even:
    		# Truong hop IF: a là so chan (Phan du == 0)
   		puts	msg_even
   		
	exit:
    # Ket thúc chuong trình
  	  li 	$v0, 10          # Syscall 10: exit
    	  syscall
