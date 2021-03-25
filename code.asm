    mov 255 $16
    mov 129 $17
    mov 129 $18
    mov 129 $19
    mov 129 $20
    mov 255 $21
    call drawinallcolumns
end:
    jmp end

drawinallcolumns:
    mov 0 $3
    mov 0 $4
    mov 5 $5
    mov 1 $0
    mov 60 $31
    mul $31 $0
    mul $31 $0
    mul $31 $0
    mov 128 $0
    str $0 $31
    mov 3 $1
    add $31 $1
    mov $30 $31
    mov $29 $31
    mov $28 $31
    mov 1 $1
    sub $30 $1
    mov 2 $1
    sub $29 $1
    mov 3 $1
    sub $28 $1
    mov 1 $1
    str $16 $28
    str $17 $29
    str $1 $31
desenha:
    add $4 $1
    str $4 $30
    cmp $5 $4
    jg desenha
    str $3 $31
    ret