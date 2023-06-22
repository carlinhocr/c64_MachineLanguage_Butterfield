; use a zero page address and the y register to jump virtually anywhere
*=$033c
        lda #$00
        sta $c0
        lda #$40
        sta $c1
        ldx #$01
        stx $4000
        ldx #$02
        stx $4001
        ldx #$03
        stx $4002

        ldy #$00
loop1
        lda($c0),y ; go indirect to address 4000 and add whatever is in Y
        iny 
        cpy 4
        bne loop1
        rts