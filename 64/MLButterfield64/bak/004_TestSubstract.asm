*=$033c
        lda #$6
        sta $03c0
        ldx #$8
        stx $03c1
        sec
        sbc #$8
        sta $03c2
        bmi NEGATIVE
        rts

NEGATIVE 
        lda $03c1
        sec
        sbc $03c0


        