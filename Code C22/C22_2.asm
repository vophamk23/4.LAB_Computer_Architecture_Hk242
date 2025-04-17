# Bài 2: Cau trúc IF-ELSE phuc hop trong MIPS
# if (a>=-3 && a<=4) a=b-c;
# else a=b+c;

#Chuong trinh: ten chuong trinh
	.include "macro.mac"
#Data segment
	.data
	#Cac cau nhac nhap du lieu
	prompt_a:  	.asciiz "Nhap so nguyen a: "
	prompt_b:  	.asciiz "Nhap so nguyen b: "
	prompt_c:  	.asciiz "Nhap so nguyen c: "
	result_msg:    	.asciiz "Gia tri cua a sau khi thuc hien dieu kien: "
	#Cac dinh nghia bien
	int_a:         .word 0
	int_b:         .word 0
	int_c:         .word 0

#Code segment
	.text
	main:
    		# Nhap giá tri a
		geti_p prompt_a, int_a
    		# Nhap giá tri b
 		geti_p prompt_b, int_b
    		# Nhap giá tri c
		geti_p prompt_c, int_c
    
    	### Kiem tra dieu kien a>=-3 && a<=4 (DK1)
    		lw 	$t0, int_a          # $t0 = a
  
    		# Kiem tra a >= -3 hay ko ( Neu a < -3 thì nhay den Esle)
    		li 	$t1, -3         		# Gan cho $t1 = -3
    		slt 	$t2, $t0, $t1  		# $t2 = 1 neu a < -3, nguoc lai $t2 = 0
   		bne 	$t2, $zero, else 		# Neu a < -3, nhay den else (bne == thi else)
    		# Kiem tra a <= 4 hay ko (Neu a > 4 thì nhay den Else)
    		li 	$t1, 4          		# $t1 = 4
    		slt 	$t2, $t1, $t0  		# $t2 = 1 neu 4 < a, nguoc lai $t2 = 0
    		bne 	$t2, $zero, else 		# Neu 4 < a , nhay den else (bne == thi else)
    
    	### Truong hop IF: a>=-3 && a<=4 (DK2)
		lw 	$t1, int_b          # $t1 = b
    		lw 	$t2, int_c          # $t2 = c
    	
    		sub	$t3, $t1, $t2  	# $t3 = b - c
    		sw 	$t3, int_a          # a = b - c
    	     	j  result_print     	# Nhay den in ket qua
    
	else:
    		# Truong hop ELSE: a < -3 || a > 4
    		lw 	$t1, int_b          # $t1 = b
		lw 	$t2, int_c          # $t2 = c
    
    		add 	$t3, $t1, $t2  	# $t3 = b + c
   		sw 	$t3, int_a          # a = b + c
    
	result_print:
		puti_p result_msg, int_a
	
   # Ket thúc chuong trình
   	li 	$v0, 10         # Syscall 10: exit
    	syscall
