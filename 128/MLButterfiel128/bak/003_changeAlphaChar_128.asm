;check if a letter or number was input via the keyboard
;run with BANK 15:SYS 2816
*=$00B00
        jsr $ffe1 ;go to check if run stop was pressed
        beq $00b15 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator
        cmp #$41  ;see if it is less than the ascii A uppercase
        bcc $00B00 ;loop to check run/stop again
        cmp #$5b  ;comrpae if itis great than or queql to 
                  ;the next character after ascii Z uppercase
        bcs $00B00 ;branch if it is greater than or equal 
        ;if we are here we have an ascii character between 0 and 9
        ORA #$80 ; I am adding 20 and it is like pressing shift 1000 0000
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        rts