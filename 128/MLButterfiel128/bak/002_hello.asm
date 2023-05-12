;load hello in memory positions 0b0e 48 45 4c 4c 4f 0d

*=0b00
        ldx #$00
        lda $0b0e,x
        jsr $ffd2
        inx
        cpx #$06
        bne $0b02