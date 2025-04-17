	.include "macro.mac"
	.data
		string: .asciiz "2112345 - Nguyen Van An"    # Thay th? b?ng MSSV và tên c?a b?n
		result_msg: .asciiz "Chuoi sau khi swap ky tu dau cuoi: "
		newline:	 .asciiz "\n"
	.text
	.globl main
	main:
    		# Load ??a ch? c?a chu?i vào $t0
    		la $t0, string
    		# Tìm ?? dài c?a chu?i
    		li $t2, 0          # Bi?n ??m ?? dài
    
	find_length:
    		lb $t1, ($t0)      # Load ký t? hi?n t?i
    		beqz $t1, end_find # N?u là null terminator thì k?t thúc
    		addi $t0, $t0, 1   # T?ng con tr?
    		addi $t2, $t2, 1   # T?ng bi?n ??m
    		j find_length
    
	end_find:
    		# L?y ??a ch? ban ??u
    		la $t0, string
    
    		# L?y v? trí cu?i cùng (?? dài - 1)
    		addi $t2, $t2, -1
    		add $t3, $t0, $t2  # ??a ch? c?a ký t? cu?i cùng
    
    		# Load ký t? ??u tiên và cu?i cùng
    		lb $t4, ($t0)      # Ký t? ??u tiên ('1')
    		lb $t5, ($t3)      # Ký t? cu?i cùng ('A')
    
    		# ??i ch? ký t? ??u và cu?i
    		sb $t5, ($t0)      # L?u ký t? cu?i ('A') vào v? trí ??u
    		sb $t4, ($t3)      # L?u ký t? ??u ('1') vào v? trí cu?i

    		# Macro xuat chuoi
                        puts result_msg
                        puts string 
                        puts newline
                        
    		# In thông báo
    		li $v0, 4
		la $a0, result_msg
    		syscall
    		# In chu?i k?t qu?
    		li $v0, 4
    		la $a0, string
    		syscall
    
    	# K?t thúc ch??ng trình
    	li $v0, 10
    	syscall