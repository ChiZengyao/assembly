data segment
    X dw 10h 
    Y dw ?
data ends
code segment
main proc near
    assume cs:code,ds:data

    push ds
    xor ax,ax 
    push ax
    mov ax, data
    mov ds,ax 
    mov ax,X   
    test ax,8000h       ;测试数据 +-
    jz pos              ;为正，转移到pos
    neg ax              ;为负，求补

    pos: mov Y,AX 
ret
main endp
code ends
    end main 