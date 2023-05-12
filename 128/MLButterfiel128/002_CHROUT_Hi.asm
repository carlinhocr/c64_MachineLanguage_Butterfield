*=$0B00

        lda #$48
        jsr $FFD2
        lda #$49
        jsr $FFD2
        lda #$0d
        jsr $FFD2
        rts ;to be callable by basic