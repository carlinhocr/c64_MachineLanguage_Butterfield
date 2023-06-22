*=$033c
        lda #$24
        sta $1234
        lda #$68
        sta $1235
        jmp ($1234) ;jump indirect to address $6824
        rts