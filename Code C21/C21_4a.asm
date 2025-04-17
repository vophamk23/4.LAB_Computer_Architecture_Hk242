#Chuong trinh: ten chuong trinh
	.include "macro.mac"
#Data segment
	.data
#Cac dinh nghia bien
		array: .word 10, 20, 30, 40, 50, 60, 70, 800, 90, 100   # Dinh nghia mang 10 phan tu
		result_msg: .asciiz "Hieu cua phan ta 7 v� 3 l�: "
		result: .word 0
#Cac cau nhac nhap du lieu
#Code segment
	.text
	.globl main
main:
    		# Load dia chi cua mang v�o $t0
    		la $t0, array
    
    		# Load phan tu thu 7 (index = 7) v�o $t1
    		lw $t1, 28($t0)    # offset = 7 * 4 = 28
    		# Load phan tu thu 3 (index = 3) v�o $t2
    		lw $t2, 12($t0)    # offset = 3 * 4 = 12
    
    		# T�nh hieu $t1 - $t2
    		sub $t3, $t1, $t2
    		
    		# Luu ket qua trong thanh ghi vao Bien result
    		sw  $t3, result
    		# Macro in thong bao va xuat Result
    		puti_p result_msg, result
    		
    		
    	# Ket th�c chuong tr�nh
KetThuc:   	li 	$v0, 10
    		syscall

# -------------------------------	
# Cac chuong trinh khac
# -------------------------------
