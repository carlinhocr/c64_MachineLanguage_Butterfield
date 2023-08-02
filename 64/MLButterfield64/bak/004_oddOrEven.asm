;odd or even
;run with SYS 850
*=$033c
        jsr $ffe1 ;go to check if run stop was pressed
        beq $0351 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator
        cmp #$30  ;see if it is less than the ascii 0
        bcc $033c ;loop to check run/stop again
        cmp #$3a  ;comrpae if itis great than or equak  to 
                  ;the next character after ascii 9
        bcs $033c ;branch if it is greater than or equal 
        ;if we are here we have an ascii character between 0 and 9
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        and #$0F  ;turn off the 4 high bits in the accumulator to trasnlate from ascii to number
        rts

;start program sys 850 here
        jsr $033c       ;get first number
        tax             ;store first number in register x
        sta $03c0       ;store first number in memory
        lsr
        bcc EVEN
        ;here if it is odd
        lda #$20        ;space
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$4f        ;O
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$44        ;D
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$44        ;D
        jsr $ffd2       ;print the chracter that is in the accumulator register A    
        lda $03c2
        lda #$0d        ;load the return character
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        rts
   
EVEN
;here if it was even
        lda #$20        ;space
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$45        ;E
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$56        ;V
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$45        ;E
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$4e        ;N
        jsr $ffd2       ;print the chracter that is in the accumulator register A   
        lda #$0d        ;load the return character
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        rts

        
        



        
        