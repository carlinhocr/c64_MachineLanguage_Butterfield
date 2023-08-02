; use a zero page address $60 and go backwards two times 
*=$033c
        ldy #$55
        sty $60
        ldy #$54
        sty $5f
        ldy #$53
        sty $5e
        lda $60
        ldx #$ff ;the index will be -1
        lda $60,x
        ldx #$fe ; the index will be -2
        lda $60,x
        rts
        