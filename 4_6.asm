;查表程序
data segment
table db 0,1,4,9,16,25,36,49,64,81				;预制平方表
		db 100,121,144,169,196,255
		XX db 5
		YY db ?
data ends 

code segment
 	assume cs:code,ds:data 
main proc near
	mov ax,data
	mov ds,ax
	lea bx,table
	mov al,XX
	xlat
	mov yy,al 
	mov ah,4ch
	int 21h
ret
main endp
code ends
	end main 

