	.include "macro.mac"
	.data
		string: .asciiz "2112345 - Nguyen Van An"    # Thay the bang MSSV v� t�n cua ban
		result_msg: .asciiz "Chuoi sau khi swap ky tu dau cuoi: "
		newline:	 .asciiz "\n"
	.text
	.globl main
	main:
    		# Load cua chi cua chuoi v�o $t0
    		la 	$t0, string
    		# T�m do d�i cua chuoi
    		li 	$t2, 0          # Bien ??m ?? d�i
    
	find_length:
    		lb 	$t1, ($t0)      	# Load k� tu hien 
    		beqz 	$t1, end_find 	# Neu l� null terminator th� ket th�c
    		addi 	$t0, $t0, 1   	# Tang con tro
    		addi 	$t2, $t2, 1   	# Tang bien dem
    		j 	find_length
    
	end_find:
    		# Lay dia chi ban dau
    		la 	$t0, string
    
    		# Lay vi tr� cuoi c�ng (do d�i - 1)
    		addi 	$t2, $t2, -1
    		add 	$t3, $t0, $t2  # dia chi cua k� tu cuoi c�ng
    
    		# Load k� t? ??u ti�n v� cu?i c�ng
    		lb 	$t4, ($t0)      # K� tu dqu ti�n ('1')
    		lb 	$t5, ($t3)      # K� tu cuoi c�ng ('A')
    
    		# ??i ch? k� t? ??u v� cu?i
    		sb 	$t5, ($t0)      # Luu k� tu cuoi ('A') v�o vi tr� dau
    		sb 	$t4, ($t3)      # Luu k� tu dau ('1') v�o vi tr� cuoi

    		# Macro xuat chuoi
                       	 	puts result_msg
                        	puts string 
                        	puts newline
                        
    		# In th�ng b�o
    			puts result_msg
    		# In chuoi ket qua
    			puts string
    
    	# Ket th�c chuong tr�nh
    	li 	$v0, 10
    	syscall
