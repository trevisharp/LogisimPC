    mov 255 $16
    mov 129 $17
    mov 129 $18
    mov 129 $19
    mov 129 $20
    mov 255 $21
    call drawinallcolumns

border:
    mov 163 $1
    mov 255 $2 //0000000011111111 
    mov 8 $3
    mov 255 $4
    mov 100 $0
    mov 101 $5
    mov 162 $6  
    mov 1 $7
    mov 102 $9
    mov 161 $10
    mov 2 $11
    mov 162 $12
    mov 101 $13
    mov 128 $14 //0000000010000000
    
    shl $14 $3
    shl $2 $3
    add $2 $4
    str $2 $1
    str $2 $0
    str $2 $5
    str $2 $6
    
loopparborder:
    str $7 $9
    add $9 $11
    cmp $9 $12
    jne loopparborder

loopimparborder:
    str $14 $10
    sub $10 $11
    cmp $10 $13
    jne loopimparborder
    
    call draw
    ret