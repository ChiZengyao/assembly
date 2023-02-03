data segment
buffer  db 50 
		db ? 
		db 50 dup(?)
data ends

stack segment
stack ends

code segment
	assume cs:code,ds:data,ss:stack
key_in proc near
	push ds
	mov ax,0
	push ax
	mov ax,data
	mov ds,ax
	lea dx,buffer		;确定缓冲区起始地址
	mov ah,0ah
	int 21h
	mov ch,0
	mov cl,buffer+1		;输入字符实际个数存入cx
	inc dx
	inc dx              ;指针指向字符串第一个字符
	
ret
key_in endp

code ends
	end key_in