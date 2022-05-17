org 100h
mov dx,offset msg_1
mov ah,09h
int 21h

mov ah,0ah
mov dx,offset buff_1
int 21h

mov si,dx
sub ax,ax
sub cx,cx
sub dx,dx
a:
sub [si+2],30h
shl cx,4
add cl,[si+2]
inc si
cmp [si+2],0dh
jne a 
mov si,0d

mov bx,100d
mov al,ch
mul bx
mov input_,ax
sub ax,ax
sub ch,ch
shl cx,4
mov bx,10d
mov al,ch
mul bx
add input_,ax
sub ax,ax
shr cl,4
sub ch,ch
add input_,cx

cmp input_,360d
jge e_m
jmp cnt

e_m:
    mov dx,offset error_message
    mov ah,09h
    int 21h
    ret

cnt:
    mov bx,17d
    mov ax,input_ 
    mul bx
    mov bx,1000d
    div bx
    mov result_b,al
    add result_b,30h
    
    cmp dx,000ffh
    jg case_1
    
    
    cmp dx,100d
    jl case_2
    
    jmp case_3
          
case_1:
    mov ax,dx
    mov bx,100d
    div bl
    mov result_f,al
    add result_f,30h
    xchg ah,al
    sub ah,ah
    mov bx,10d
    div bl
    mov result_ff,al
    add result_ff,30h
    jmp final
   
case_2:
    mov result_f,30h
    mov bx,10d
    mov ax,dx
    div bl
    mov result_ff,al
    add result_ff,30h
    jmp final
    
    
case_3:
    mov ax,dx
    mov bx,100d
    div bl
    mov result_f,al
    add result_f,30h
    xchg ah,al
    sub ah,ah
    mov bx,10d
    div bl
    mov result_ff,al
    add result_ff,30h
    jmp final
    
    
final:
    mov dx,offset final_message
    mov ah,09h
    int 21h
    mov dx,offset result_b
    mov ah,09h
    int 21h
    mov dx,offset result_f
    mov ah,09h
    int 21h
    mov dx,offset result_ff
    mov ah,09h
    int 21h 
    ret        

msg_1   db "This code is for Final Exam Pre-work of ELE336 Course",0ah,0dh,"Enter an integer between 0 and 360",0ah,0dh,"$"
buff_1  db "?"
error_message db 0ah,0dh,"   Entered integer is not between 0 and 360 !","$"
input_ dw 0h,"$"


final_message  db  0ah,0dh,"Its radian value=","$"
result_b       db  "?",2ch,"$"
result_f       db  "?","$"
result_ff      db  "?","$"


