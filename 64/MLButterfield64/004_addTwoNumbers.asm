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
        sta $03c0       ; store first number in memory
        lda #$2b        ; load ascii for symbol + in the accumulator
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        jsr $033c       ; get second number
        tax       ; store second number in register x
        lda #$3d        ;load acii symbol =
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        ;start adding numbers
        txa             ;transfer second number from register x to accumulator
        clc             ;clear carry biut to start addition
        adc $03c0       ;add first number in memory to accumulator
        tax             ;store result in register x
        cpx #$a         ;compare register xto number A, ten in decimal
        bcc $0379       ;branch if it is less to print only one character
        ;if we are here it is bigger than 9
        lda #$31        ;load number 1 in ascii as it is bigger than 9 but less than 18 
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        txa             ;transfer x to accumulator
        ;substract 10
        sec             ;set the carry to start substraction
        sbc #$a         ;substract 10
        ;here we come from the branch of less than A (decimal 10)
        ora #$30        ;convert accumulator to ascii
        jsr $ffd2       ;print the chracter that is in the accumulator register A  
        lda #$0d        ;load the return character
        jsr $ffd2       ;print the chracter that is in the accumulator register A
        rts             ;end subroutine
        



        
        