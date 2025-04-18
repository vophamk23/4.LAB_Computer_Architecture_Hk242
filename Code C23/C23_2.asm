#Chuy?n hàm range sau ?ây sang h?p ng? MIPS. 
#int iArray[10]; 
#int iArray_size=10; 
#int range(int iArray[], int iArray_size) 
#{ int temp1,temp2; 
#temp1=max(iArray,iArray_size); 
#temp2=min(iArray,iArray_size); 
#return temp1-temp2; 
#}
	.include "macro.mac"	
	.data
		iArray: .word 15, 23, 2, 7, 9, 100, 31, 8, 17, 25, 10 # Khai bao mang nguyen 10 phan tu
		iArray_size: .word 10                                	# Kich thuoc mang
		result: .word 0

		message: .asciiz "Gia tri range cua mang la: "       # Thong bao ket qua

	.text
	main:
    		# Chuan bi tham so truoc khi goi ham range
    			la 	$a0, iArray           	# Dia chi mang iArray vao $a0
    			lw 	$a1, iArray_size      	# So phan tu mang vao $a1
    
    		# Goi ham range
    			jal 	range			# Return temp1 - temp2 store in $v0
    
    		# In ket qua ra man hinh
    			sw	$v0, result
    		# In thong bao
    			puts message
    		# In gia tri range
    			puti_Notp result
    		
    		# Thoat chuong trinh
    			li 	$v0, 10               	# Syscall 10: Exit
    			syscall


		# Ham range - non-leaf function
	range:
    		# Function Prologue
    		addi 	$sp, $sp, -12       	# Cap phat stack cho 3 thanh ghi (ra, temp1, temp2)
    		sw 	$ra, 0($sp)           	# Luu dia chi tra ve
    		sw 	$s0, 4($sp)           	# Luu $s0 (se dung cho temp1)
    		sw 	$s1, 8($sp)           	# Luu $s1 (se dung cho temp2)
    
    		# Goi ham max de tim gia tri lon nhat
    		# Tham so $a0, $a1 da duoc thiet lap truoc khi goi range
    		jal 	MAX_DAY              	# Goi ham max_day
    		move 	$s0, $v0            		# temp1 = max_day(iArray, iArray_size)
    
    		# Goi ham min de tim gia tri nho nhat
    		# Khong can thiet lap lai tham so vi $a0, $a1 khong bi thay doi
    		jal 	MIN_DAY              	# Goi ham min_day
    		move 	$s1, $v0            		# temp2 = min_day(iArray, iArray_size)
    
    		# Tinh range = temp1 - temp2
    		sub 	$v0, $s0, $s1        	# $v0 = temp1 - temp2 (ket qua tra ve)
    
    		# Function Epilogue
    		lw 	$ra, 0($sp)           	# Khoi phuc dia chi tra ve
    		lw 	$s0, 4($sp)           	# Khoi phuc $s0
    		lw 	$s1, 8($sp)           	# Khoi phuc $s1
    		addi 	$sp, $sp, 12        	# Khoi phuc stack pointer
    
   		 jr 	$ra                   		# Tro ve dia chi goi ham




		# Ham MAX_DAY - tim gia tri lon nhat trong mang
	MAX_DAY:
    		# Tham so: $a0 = dia chi mang, $a1 = kich thuoc mang
    		lw 	$v0, 0($a0)           	# max = mang[0]
    		li 	$t0, 1                		# i = 1 (bat dau tu phan tu thu 2)
    
	max_loop:
    		bge 	$t0, $a1, max_done   	# Neu i >= size thi ket thuc vong lap
    
    		# Tinh dia chi cua mang[i]
    		sll 	$t1, $t0, 2          		# $t1 = i * 4 (offset)
    		add 	$t1, $a0, $t1        	# $t1 = &mang[i]
    		lw 	$t2, 0($t1)           	# $t2 = mang[i]
    
    		# So sanh voi max hien tai
    		ble 	$t2, $v0, max_next   	# Neu mang[i] <= max thi bo qua
    		move 	$v0, $t2            		# Cap nhat max = mang[i]
    
	max_next:
    		addi 	$t0, $t0, 1         		# i++
    		j 	max_loop               	# Quay lai vong lap
    
	max_done:
    		jr 	$ra                   		# Tro ve ham goi



		# Ham MIN_DAY - tim gia tri nho nhat trong mang
	MIN_DAY:
    		# Tham so: $a0 = dia chi mang, $a1 = kich thuoc mang
    		lw 	$v0, 0($a0)           	# min = mang[0]
    		li 	$t0, 1                		# i = 1 (bat dau tu phan tu thu 2)
    
	min_loop:
    		bge 	$t0, $a1, min_done   	# Neu i >= size thi ket thuc vong lap
    
    		# Tinh dia chi cua mang[i]
    		sll 	$t1, $t0, 2         	 	# $t1 = i * 4 (offset)
    		add 	$t1, $a0, $t1        	# $t1 = &mang[i]
    		lw 	$t2, 0($t1)           	# $t2 = mang[i]
    
    		# So sanh voi min hien tai
    		bge 	$t2, $v0, min_next   	# Neu mang[i] >= min thi bo qua
    		move 	$v0, $t2            		# Cap nhat min = mang[i]
    
	min_next:
    		addi 	$t0, $t0, 1         		# i++
    		j 	min_loop               	# Quay lai vong lap
    
	min_done:
    		jr 	$ra                   		# Tro ve ham goi