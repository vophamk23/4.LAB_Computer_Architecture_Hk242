	.include "macro.mac"
#Data segment
	.data 
#Cac dinh nghia bien
	message: .asciiz "Kien truc may tinh.\n"
#Cac cau nhac nhap du lieu

#Code segment
	.text
main:	
#Nhap (syscall)
	puts message
	#li	 $v0, 4
	#la	 $a0, Chuoi
	#syscall 
#Xu ly
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc:	
	addi	$v0,$zero,10
	syscall
# -------------------------------	
# Cac chuong trinh khac
# -------------------------------
