*=$033c
  lda #$41 ;ascii for A
  ldy #$0
  sta ($2d),y
  rts