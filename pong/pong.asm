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
    
looppar:
    str $7 $9
    add $9 $11
    cmp $9 $12
    jne looppar

loopimpar:
    str $14 $10
    sub $10 $11
    cmp $10 $13
    jne loopimpar

     
    call draw

    

end:
    jmp end

draw:
    mov 0 $28
    mov 0 $29
    mov 0 $30
    mov 234 $31
    mov 8 $30
    shl $31 $30
    mov 96 $30
    add $31 $30
    mov 0 $30
    add $30 $31
    add $29 $31
    add $28 $31
    mov 1 $27
    add $29 $27
    add $30 $27
    add $30 $27
    add $31 $27
    add $31 $27
    add $31 $27
    str $27 $31 //Enable = 1
    mov 0 $26   // i = 0
    mov 32 $25  // limit = 25
drawloop:
    str $26 $30 //Address = i
    loa $1 $0
    str $1 $28
    add $0 $27
    loa $1 $0
    str $1 $29
    add $0 $27
    add $26 $27 // i += 1
    cmp $26 $25
    jne drawloop
    mov 0 $27
    str $27 $31 //Enable = 0
    ret