    mov 0 $1
    mov 1 $2
    mov 255 $3
    mov 255 $4
    add $3 $4
    add $3 $4
    add $3 $4
    add $3 $4
    mov 71 $4
    add $3 $4
loop:
    add $1 $2
    cmp $1 $3
    jne loop
end:
    jmp end