*=$033c 

        ldx #$00
        lda $034a,x
        jsr $FFD2
        inx
        cpx #$6
        bne $033e
        rts
*=$034a

        BYTE    $48, $45, $4c, $4c, $4f,$0d