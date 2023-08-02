;indexed indirect indexed a zero page address and access its content for the final memory address
*=$033c
        lda #$00
        sta $c0
        lda #$40
        sta $c1

        lda #$50
        sta $c2
        lda #$40
        sta $c3

        ldx #$01
        stx $4000
        ldx #$02
        stx $4050

        ldx #$00

        lda ($c0,x) ; load $c0 + 0 = $c0 containing the address $4000
        inx
        inx
        lda ($c0,x); load $c0 + 2 = $c2 containing the address $4050
        rts