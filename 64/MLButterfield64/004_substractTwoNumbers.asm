;add two numbers
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
        jsr $033c       ; get first number
        tax             ; store first number in register x
        sta $03c0       ;store first number in memory
        lda #$2d        ; load ascii for symbol - in the accumulator
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        jsr $033c       ;get second number
        sta $03c1       ;store second number in memory
        tay             ;store second number in y register
        lda #$3d        ;load acii symbol =
        jsr $ffd2       ;print the chracter that is in the accumulator register A        
;start substracting numbers
        lda $03c0       ;transfer first number from register x to accumulator
        sec             ;set the carry to start substraction
        sbc $03c1       ;substract the second number from the first that is in the accumulator
        
        bpl POSITIVE
        ;invert numbers if negative and print - symbol
        lda #$2d        ;print the less sign 
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda $03c1
        sec
        sbc $03c0       ;substract first so greater number
   
POSITIVE
;print the number directly if it was positive and print the negative after the - symbol
        ora #$30        ;convert accumulator to ascii
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$0d        ;load the return character
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        rts             ;end subroutine



        
        



        
        