*=$033c ;sys 828
        lda #$28 ; load 40 for the number of columns on the c64
        sta $03a0 ; store the line lenght
        ldx $0288 ; address for start of screen location
        ;ldx #$04        ;temporary for debugging
        stx $bc         ;store the high byte of where screen starts (page)
        ldx #$0         ;initialize X for counting screens

newscreen:
        lda #$00        ;load the low byte number
        sta $bb         ;store the low byte of where screen starts (page)
        lda #$20        ;load the space character
        ldy #$00        ;initialize counter on y

writescreen:
        sta ($bb),y
        cpy #$ff 
        iny
        bcc writescreen:
        inx
        lda $bc
        clc
        adc #$1
        sta $bc
        cpx #$3   ;25lineasx40columnas 1000 characteres $03e8 3*256 = 768
        bcc newscreen:
        lda #$20        ;load the space character
        ldy #$00        ;initialize counter on y
lastscreen: 
        ;232 positions remaining
        sta ($bb),y
        iny
        cpy #$e8 ;232 - e8 
        bcc lastscreen:
        rts