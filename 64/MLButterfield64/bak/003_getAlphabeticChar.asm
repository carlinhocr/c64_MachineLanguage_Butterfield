;check if a letter or number was input via the keyboard
;run with SYS 828
*=$033c
        jsr $ffe1 ;go to check if run stop was pressed
        beq $0351 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator
        cmp #$41  ;see if it is less than the ascii A uppercase
        bcc $033c ;loop to check run/stop again
        cmp #$5b  ;comrpae if itis great than or queql to 
                  ;the next character after ascii Z uppercase
        bcs $033c ;branch if it is greater than or equal 
        ;if we are here we have an ascii character between 0 and 9
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        rts