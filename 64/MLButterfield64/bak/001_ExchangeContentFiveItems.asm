*=$0800
watch $0381
watch $0382
watch $0383
watch $0384
watch $0385

;load initial memory positions
        lda #$1
        sta $0381
        lda #$2
        sta $0382
        lda #$3
        sta $0383
        lda #$4
        sta $0384
        lda #$5
        sta $0385
        
        lda $0385
        ldx $0381
        ldy $0382
        stx $0382
        ldx $0383
        sty $0383
        ldy $0384
        stx $0384
        ldx $0385
        sty $0385
        stx $0381
                
        brk