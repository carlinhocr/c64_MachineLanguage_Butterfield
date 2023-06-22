

; manage a window in the c64
;all address and mappings according to c64
startcolumn=$04
*=$033c
        lda #$28 ; load 40 for the number of columns on the c64
        ldx $0288 ; address for start of screen location
        sta $03a0 ; store the line lenght
        lda #$00
        sta $bb         ;store the low byte of where screen starts
        stx $bc         ;store the high byte of where screen starts
        ;start counting screen lines
        ldx #$00
NEXTLINE
        ldy #$04        ;to start at column 5 put an index of 4 on Y
NEXTCHAR
        lda ($bb),y     ;load the character currenlty on screen
        cmp #$20        ;compare to space character
        beq ISSPACE    ;branch if it was a space character
        eor #$80        ;flip the high bit of the character if it was not space
ISSPACE
        sta ($bb),y     ;store modified character back into screen
        ;go to next character if it us column 18 go to next line
        iny
        cpy #$12        ;18 in decimal
        bcc NEXTCHAR    ;if it is less than 18
        ;add 40 to the start of screen memory address to start next line
        clc     ;carry clear prior to addition
        lda $bb         ;load low byte address
        adc $03a0       ;add 40 to the low byte including the carry which is zero
        sta $bb         ;save low byte address
        lda $bc        ;load high byte
        adc #$00        ;add zero to the hight byte and the carry
        sta $bc         ;store high byte
        ;lets count the lines
        inx
        cpx #$0e        ;compare to 14
        bne NEXTLINE
        rts
        
        
        
        
        