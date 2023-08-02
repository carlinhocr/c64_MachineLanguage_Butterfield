
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
        cmp #$5
        bcc LESS_THAN_FIVE
        ;here if it is more than five
        lsr             ;divide by two
        sta $03c2
        lda #$25        ;% modulo
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$32        ;2
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$20        ;space
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$3d        ;=3d
        jsr $ffd2       ;print the chracter that is in the accumulator register A   
        lda $03c2
        jmp PRINT_SINGLE_DIGIT
   
LESS_THAN_FIVE
;here if it was less than five
        asl             ;multiply by two
        sta $03c2
        lda #$2a        ;*
        jsr $ffd2       ;print the chracter that is in the accumulator register A 
        lda #$32        ;2
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$20        ;space
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$3d        ;=3d
        jsr $ffd2       ;print the chracter that is in the accumulator register A   
        lda $03c2
        jmp PRINT_SINGLE_DIGIT
        


PRINT_SINGLE_DIGIT
        sta $03c2
        lda #$20        ;space
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda $03c2
        ;expect number already on the accumulator
        ora #$30        ;convert accumulator to ascii
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$0d        ;load the return character
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        rts             ;end subroutine

        
        



        
        