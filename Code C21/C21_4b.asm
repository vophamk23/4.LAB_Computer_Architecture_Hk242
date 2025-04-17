	.include "macro.mac"
	.data
		string: .asciiz "2112345 - Nguyen Van An"    # Thay th? b?ng MSSV v� t�n c?a b?n
		result_msg: .asciiz "Chuoi sau khi swap ky tu dau cuoi: "
		newline:	 .asciiz "\n"
	.text
	.globl main
	main:
    		# Load ??a ch? c?a chu?i v�o $t0
    		la $t0, string
    		# T�m ?? d�i c?a chu?i
    		li $t2, 0          # Bi?n ??m ?? d�i
    
	find_length:
    		lb $t1, ($t0)      # Load k� t? hi?n t?i
    		beqz $t1, end_find # N?u l� null terminator th� k?t th�c
    		addi $t0, $t0, 1   # T?ng con tr?
    		addi $t2, $t2, 1   # T?ng bi?n ??m
    		j find_length
    
	end_find:
    		# L?y ??a ch? ban ??u
    		la $t0, string
    
    		# L?y v? tr� cu?i c�ng (?? d�i - 1)
    		addi $t2, $t2, -1
    		add $t3, $t0, $t2  # ??a ch? c?a k� t? cu?i c�ng
    
    		# Load k� t? ??u ti�n v� cu?i c�ng
    		lb $t4, ($t0)      # K� t? ??u ti�n ('1')
    		lb $t5, ($t3)      # K� t? cu?i c�ng ('A')
    
    		# ??i ch? k� t? ??u v� cu?i
    		sb $t5, ($t0)      # L?u k� t? cu?i ('A') v�o v? tr� ??u
    		sb $t4, ($t3)      # L?u k� t? ??u ('1') v�o v? tr� cu?i

    		# Macro xuat chuoi
                        puts result_msg
                        puts string 
                        puts newline
                        
    		# In th�ng b�o
    		li $v0, 4
		la $a0, result_msg
    		syscall
    		# In chu?i k?t qu?
    		li $v0, 4
    		la $a0, string
    		syscall
    
    	# K?t th�c ch??ng tr�nh
    	li $v0, 10
    	syscall