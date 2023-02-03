;;计算 Y=[(X+8)X+8]X+6

data segment
    x dw 10
    y dw 0
data ends
stack segment stack 'stack'
    dw 1000h dup(?)
    top label word
stack ends
code segment
    assume cs:code,ds:data,ss:stack

main proc far

    mov ax,stack            ;建立堆栈指针
    mov ss,ax
    mov sp,offset top
    push ds                 ;为返回dos做准备
    sub ax,ax
    push ax
    mov ax,data
    mov ds,ax

    mov ax,x 
    add ax,8
    mul x                   ;((x+8)*x) -> dx ax
    add ax,8
    mul x    
    add ax,6
    mov Y,ax 
    ret 
main endp 
code ends
    end main
