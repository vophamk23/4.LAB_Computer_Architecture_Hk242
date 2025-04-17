#Chuong trinh: ten chuong trinh
	.include "macro.mac"
#Data segment
	.data
#Cac dinh nghia bien
#Cac cau nhac nhap du lieu
#Code segment
	.text
main:	
#Nhap (syscall)
#Xu ly
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc:	addi	$v0,$zero,10
	syscall
# -------------------------------	
# Cac chuong trinh khac
# -------------------------------
