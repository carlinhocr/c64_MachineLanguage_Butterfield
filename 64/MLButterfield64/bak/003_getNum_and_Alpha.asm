;check if a letter was input via the keyboard
;run with SYS 828
*=$033c
        jsr $ffe1 ;go to check if run stop was pressed
        beq $0353 ;go to the end (RTS) if it was pressed
        jsr $ffe4 ;go and check if a key was pressed it will stored in the accumulator

        cmp #$30  ;see if it is less than the ascii 0
        bcc $033c ;loop to check run/stop again

        cmp #$5b  ;comrpae if itis great than or equal to 
                  ;the next character after ascii Z uppercase
        bcs $033c ;branch if it is greater than or equal 
;filter 3a to 40
        ;sta $0370 ;calling the subroutinte erases the accumulator so i keep it in memory
        cmp #$41  ;see if it is less than the ascii A uppercase
        bcc $0360 ;loop to check run/stop again
        ;if we are here we have an ascii letter between A and Z and 0 and 9 but not ? @ etc
        ;lda $0370 ; retreive the accumulator from the memory
        jsr $ffd2 ;print the chracter that is in the accumulator register A
        rts
*=$0360
        cmp #$3a  ; see if it sis greater than or equal to 3a the colon :
        bcs $033c
        jmp $0350 ; return to just before calling the previous comparision