; 10 SYS (828)
*=$033c 
        ldx #$0
        ldy #$0
RETURN_SQUARE
        inx
        lda #$6c
        jsr $FFD2
        cpx #$FF
        bne RETURN_SQUARE
        iny
        cpy #$5
        bne RETURN_SQUARE
        lda #$6c
        jsr $FFD2
        lda #$6c
        jsr $FFD2
STALL   jsr $ffe1 ;go to check if run stop was pressed
        beq $0351 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator
        cmp #$41  ;see if it is less than the ascii A uppercase
        bcc STALL ;loop to check run/stop again
        rts
