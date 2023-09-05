;check if a number was input via the keyboard
;run with BANK 15:SYS 2816
*=$00B00
        jsr $ffe1 ;go to check if run stop was pressed
        beq $b15 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator
        cmp #$30  ;see if it is less than the ascii 0
        bcc $b00 ;loop to check run/stop again
        cmp #$3a  ;comrpae if itis great than or equak  to 
                  ;the next character after ascii 9
        bcs $b00 ;branch if it is greater than or equal 
        ;if we are here we have an ascii character between 0 and 9
        and #$FE  ;turn off last digit the odd one so a 5 is a 4
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        rts
        