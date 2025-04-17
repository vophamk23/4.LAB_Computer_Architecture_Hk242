#Chuong trinh: ten chuong trinh
	.include "macro.mac"
#Data segment
	.data
#Cac dinh nghia bien
	int_a: .word 0
	int_b: .word 0   # So thuc float_b: .float 0.12234 => getf_p ........
	int_c: .word 0
	int_f: .word 0
#Cac cau nhac nhap du lieu
	nhap_a: .asciiz"Nhap a:"
	nhap_b: .asciiz"Nhap_b:"
	nhap_c: .asciiz"Nhap_c:"
	nhap_d: .asciiz"Nhap_d:"
	xuat_f: .asciiz" Ket qua cua f(a, b, c) = a - b + c = "
#Code segment
	.text
main:	
#Nhap (syscall)
	#Nhap a
	geti_p nhap_a,int_a
	#la $a0, nhap_a
	#li $v0, 4
   	# syscall
    	#li $v0, 5
    	#syscall
    	#sw $v0, int_a  # L?u a vào b? nh?
	
	#Nhap b
	geti_p nhap_b,int_b
	# la $a0, nhap_b
	# li $v0, 4
   	# syscall
   	# li $v0, 5
    	#syscall
   	# sw $v0, int_b  # L?u b vào b? nh?

	#Nhap c
	geti_p nhap_c,int_c
	#la $a0, nhap_c
	#li $v0, 4
   	# syscall
   	#li $v0, 5
   	# syscall
   	#sw $v0, int_c  # Luu c vào bo nho
#Xu lý
	 # Tính toán f = a - b + c
    	lw $t0, int_a
    	lw $t1, int_b
    	lw $t2, int_c

    	sub $t3, $t0, $t1  # t3 = a - b
    	add $t3, $t3, $t2  # t3 = (a - b) + c
    	
    	sw  $t3, int_f     # Luu ket qua
#Xuat ket qua (syscall)
	puti_p xuat_f,int_f
	
	 # Xuat chuoi "f = a - b + c = "
	 	#la $a0, xuat_f
   	 	#li $v0, 4
    	 	#syscall

    	# Xuat giá tri f
    		#lw $a0, int_d
   	  	#li $v0, 1
    		#syscall
	
	
#Ket thuc chuong trinh (syscall)
Kthuc:	addi	$v0, $zero, 10
	syscall
# -------------------------------	
# Cac chuong trinh khac
# -------------------------------


#
