#void reverse(char[] cArray, int cArray_size) {
#   int i;
#   char temp;
#   for (i=0; i<cArray_size/2; i++) {
#     temp = cArray[i];
#     cArray[i] = cArray[cArray_size-1-i];
#    cArray[cArray_size-1-i] = temp;
# }
#}
	.include "macro.mac"
	.data
		cArray: .asciiz "Computer Architecture 2024."
		cArray_size: .word 27

	.text
	main:
    		# Chuan bi tham so truoc khi goi ham reverse
    		la 	$a0, cArray        		# Nap dia chi chuoi vao $a0
    		lw 	$a1, cArray_size   	# Nap do dai chuoi vao $a1
    		jal 	reverse           		# Goi ham reverse
    
    		# In chuoi sau khi dao nguoc
    			puts cArray
    		# Thoat chuong trinh
    		li 	$v0, 10            		# Ma lenh syscall de thoat chuong trinh
    		syscall

	reverse:
    		# Function Prologue
    		# Ham nay la ham la (leaf function), khong goi ham con nen khong can luu $ra
    		# Va khong su dung nhieu thanh ghi $s nen khong can luu vao stack
    
    		# Khoi tao bien i = 0 trong $t0
    		li 	$t0, 0              		# $t0 = i = 0
    
    		# Tinh cArray_size/2 va luu vao $t1
    		srl 	$t1, $a1, 1        		# $t1 = cArray_size/2 (chia 2 bang dich phai 1 bit)
    
    		# Kiem tra dieu kien vong lap: i < cArray_size/2
    	loop_condition:
        		bge 	$t0, $t1, end_loop   	# Neu i >= cArray_size/2 thi thoat vong lap
    
    
    		# Than vong lap
    	loop_body:
        		# Tinh offset cho cArray[i]
        		add 	$t2, $a0, $t0       	# $t2 = &cArray + i (dia chi cua cArray[i])
        
        		# Tinh cArray_size-1-i va luu vao $t3
        		addi 	$t3, $a1, -1       	# $t3 = cArray_size - 1
        		sub 	$t3, $t3, $t0       	# $t3 = cArray_size - 1 - i
        
        		# Tinh offset cho cArray[cArray_size-1-i]
        		add 	$t4, $a0, $t3       # $t4 = &cArray + (cArray_size-1-i) (dia chi cua cArray[cArray_size-1-i])
        
        		# temp = cArray[i]
        		lb 	$t5, 0($t2)          # $t5 = cArray[i] (temp)
        
        		# cArray[i] = cArray[cArray_size-1-i]
        		lb 	$t6, 0($t4)          # $t6 = cArray[cArray_size-1-i]
        		sb 	$t6, 0($t2)          # cArray[i] = $t6
        
        		# cArray[cArray_size-1-i] = temp
        		sb 	$t5, 0($t4)          # cArray[cArray_size-1-i] = $t5 (temp)
        
        		# Tang i len 1
        		addi 	$t0, $t0, 1        	# i = i + 1
        
        		# Quay lai kiem tra dieu kien vong lap
        		j 	loop_condition
    
    	end_loop:
        		# Function Epilogue
        		# Khong co gia tri tra ve $v0
        		jr 	$ra                  		# Tro ve dia chi goi ham
