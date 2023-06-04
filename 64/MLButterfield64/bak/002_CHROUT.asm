*=$033c

;;Execution address of CHROUT routine $F1CA $0326 $0327
;        lda #$CA
;        sta $0326
;        lda #$F1
;        sta $0327


        lda #$48
        jsr $FFD2
        brk