; sys 828 to run
*=$033c 

        ldx #$00
        lda $034a,x
        jsr $FFD2
        inx
        cpx #$21
        bne $033e
        rts
*=$034a

        BYTE    $20, $cf, $b7, $b7, $b7, $b7, $b7, $d0, $0d
        BYTE    $20, $a5, $48, $45, $4c, $4c, $4f, $a7, $0d
        BYTE    $20, $cc, $af, $af, $af, $af, $af, $ba, $0d
            