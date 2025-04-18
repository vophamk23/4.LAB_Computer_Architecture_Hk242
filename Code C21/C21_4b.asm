	.include "macro.mac"
	.data
		string: .asciiz "2112345 - Nguyen Van An"    # Thay the bang MSSV và tên cua ban
		result_msg: .asciiz "Chuoi sau khi swap ky tu dau cuoi: "
		newline:	 .asciiz "\n"
	.text
	.globl main
	main:
    		# Load cua chi cua chuoi vào $t0
    		la 	$t0, string
    		# Tìm do dài cua chuoi
    		li 	$t2, 0          # Bien ??m ?? dài
    
	find_length:
    		lb 	$t1, ($t0)      	# Load ký tu hien 
    		beqz 	$t1, end_find 	# Neu là null terminator thì ket thúc
    		addi 	$t0, $t0, 1   	# Tang con tro
    		addi 	$t2, $t2, 1   	# Tang bien dem
    		j 	find_length
    
	end_find:
    		# Lay dia chi ban dau
    		la 	$t0, string
    
    		# Lay vi trí cuoi cùng (do dài - 1)
    		addi 	$t2, $t2, -1
    		add 	$t3, $t0, $t2  # dia chi cua ký tu cuoi cùng
    
    		# Load ký t? ??u tiên và cu?i cùng
    		lb 	$t4, ($t0)      # Ký tu dqu tiên ('1')
    		lb 	$t5, ($t3)      # Ký tu cuoi cùng ('A')
    
    		# ??i ch? ký t? ??u và cu?i
    		sb 	$t5, ($t0)      # Luu ký tu cuoi ('A') vào vi trí dau
    		sb 	$t4, ($t3)      # Luu ký tu dau ('1') vào vi trí cuoi

    		# Macro xuat chuoi
                       	 	puts result_msg
                        	puts string 
                        	puts newline
                        
    		# In thông báo
    			puts result_msg
    		# In chuoi ket qua
    			puts string
    
    	# Ket thúc chuong trình
    	li 	$v0, 10
    	syscall
