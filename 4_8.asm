;跳转表实现分支是一种很有用的分支程序设计方法

data segment
    dis   db 0dh,0ah,'Please input digit 0~9.$'
    dis0  db 0dh,0ah,'Please input digit 0.$'
    dis1  db 0dh,0ah,'Please input digit 1.$'
    dis2  db 0dh,0ah,'Please input digit 2.$'
    dis3  db 0dh,0ah,'Please input digit 3.$'
    dis4  db 0dh,0ah,'Please input digit 4.$'
    dis5  db 0dh,0ah,'Please input digit 5.$'
    dis6  db 0dh,0ah,'Please input digit 6.$'
    dis7  db 0dh,0ah,'Please input digit 7.$'
    dis8  db 0dh,0ah,'Please input digit 8.$'
    dis9  db 0dh,0ah,'Please input digit 9.$'
    dis10 db 0dh,0ah,'Error! $'

data ends

code segment
         assume cs:code,ds:data
main proc near
         mov    ax,data
         mov    ds,ax
         lea    dx,dis
         mov    ah,09h
         int    21h                ;dos功能调用：显示字符串
         mov    ah,01h
         int    21h                ;从键盘输入一个字符
         cmp    al,30h             ; cmp 0
         jb     err
         cmp    al,39h
         ja     err

         and    al,0fh             ;ascii码->二进制
         jmp    GOOD



    err: 
         mov    al,10
    GOOD:
         lea    bx,TAB             ;取地址表偏移地址->BX
         mov    ah,0
         shl    al,1               ;jmp short p* 为两字节指令
         add    bx,ax
         jmp    bx
    EXIT:
         mov    ah,4ch             ;返回dos
         int    21h
    TAB: jmp    short p0           ;地址表
         jmp    short p1
         jmp    short p2
         jmp    short p3
         jmp    short p4
         jmp    short p5
         jmp    short p6
         jmp    short p7
         jmp    short p8
         jmp    short p9
         jmp    short p10

    p0:  lea    dx,dis0
         mov    ah,9
         int    21h
         jmp    EXIT
    p1:  lea    dx,dis1
         mov    ah,9
         int    21h
         jmp    EXIT
    p2:  lea    dx,dis2
         mov    ah,9
         int    21h
         jmp    EXIT
    p3:  lea    dx,dis3
         mov    ah,9
         int    21h
         jmp    EXIT
    p4:  lea    dx,dis4
         mov    ah,9
         int    21h
         jmp    EXIT
    p5:  lea    dx,dis5
         mov    ah,9
         int    21h
         jmp    EXIT
    p6:  lea    dx,dis6
         mov    ah,9
         int    21h
         jmp    EXIT
    p7:  lea    dx,dis7
         mov    ah,9
         int    21h
         jmp    EXIT
    p8:  lea    dx,dis8
         mov    ah,9
         int    21h
         jmp    EXIT
    p9:  lea    dx,dis9
         mov    ah,9
         int    21h
         jmp    EXIT
    p10: lea    dx,dis10 
         mov    ah,9
         int    21h
         jmp    EXIT
         ret
main endp

code ends
    end main  
