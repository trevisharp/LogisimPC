    mov 0 $6
    mov 1 $5
main:
    mov 100 $0
    call clear

    mov 100 $0
    mov 20 $1
    mov $2 $6
    mov 10 $3
    mov 100 $0
    call drawhorizontalline

    mov 100 $0
    call draw

    add $6 $5
    jmp main

end:
    jmp end

drawhorizontalline:
    mov 15 $25
    mov 1 $26
    cmp $2 $25
    jg drawhorizontalline_baixo

    sub $25 $2
    shl $26 $25

    mov 1 $27
    add $27 $0
    mov 2 $28
    mul $1 $28 // x = 2 * x
    add $27 $1 // $27 = $27 + 2 * x
    mov 0 $29 // len = 0
    mul $3 $28 // comprimento = comprimento * 2
    add $29 $3 // len = 2 * comprimento
    add $29 $27 // len = $27 + 2 * comprimento

drawhorizontalline_loop1:
    loa $30 $27
    or $30 $26
    str $30 $27
    add $27 $28 // i += 2
    cmp $27 $29
    jne drawhorizontalline_loop1 //i != len
    jmp drawhorizontalline_end

drawhorizontalline_baixo:
    mov 31 $25
    sub $25 $2
    shl $26 $25

    mov 0 $27
    add $27 $0
    mov 2 $28
    mul $1 $28 // x = 2 * x
    add $27 $1 // $27 = $27 + 2 * x
    mov 0 $29 // len = 0
    mul $3 $28 // comprimento = comprimento * 2
    add $29 $3 // len = 2 * comprimento
    add $29 $27 // len = $27 + 2 * comprimento

drawhorizontalline_loop2:
    loa $30 $27
    or $30 $26
    str $30 $27
    add $27 $28 // i += 2
    cmp $27 $29
    jne drawhorizontalline_loop2 //i != len

    jmp drawhorizontalline_end

drawhorizontalline_end:
    ret

drawverticalline:
    ret

drawrect:
    mov $16 $0
    mov $17 $1
    mov $18 $2
    mov $19 $3
    mov $20 $4

    mov $0 $16
    mov $1 $17
    mov $2 $18
    mov $3 $19
    call drawhorizontalline

    mov $0 $16
    mov $1 $17
    mov $2 $18
    add $2 $4
    mov $3 $19
    call drawhorizontalline

    ret

clear:
    mov 0 $1
    mov 0 $2
    mov 1 $3
    mov 64 $4
    add $4 $0
clearloop:
    str $1 $0
    add $0 $3
    cmp $4 $0
    jne clearloop
    ret

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