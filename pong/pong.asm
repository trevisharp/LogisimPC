    mov 161 $1
    mov 1 $2
    mov 15 $3
    shl $2 $3
    str $2 $1
    mov 100 $0
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