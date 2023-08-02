*=$033c
        ldx #$50
        ldy #$44
        sty $30
        lda $e0,x ;index by X inside zero page and wrap aroung the 0030 instead of 0130 which is e0 + 50
        rts