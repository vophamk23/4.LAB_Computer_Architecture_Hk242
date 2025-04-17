#Chuong trinh: ten chuong trinh
	.include "macro.mac"   # Goi tep tin macro
#Data segment
	.data
	#Cac cau nhac nhap du lieu
		input_prompt: .asciiz "Nhap 1 chuoi tu ban phim: "
		output_prompt: .asciiz "Chuoi da nhap cua ban: "

		newline: .asciiz "\n"
	#Cac dinh nghia bien
		#Bo nho de luu gia tri
		input_buffer: .space 11       # Danh 11 byte (10 ký tu + NULL)
		
#Code segment
	.text
	.globl main
	main:
   		 # Hien thi thong bao nhap chuoi "Nhap 1 chuoi tu ban phim: "
   		 puts input_prompt
    		# Nhap chuoi tu ban phim "    nhap   "
   		 gets input_buffer, 11  
   		 # Hien thi thong bao xuat chuoi "Chuoi da nhap cua ban: "
    		 puts output_prompt
   		 # Xuat chuoi da nhap =))
   		 puts input_buffer

    		# Ket thúc chuong trình
   		 li $v0, 10
    		syscall
