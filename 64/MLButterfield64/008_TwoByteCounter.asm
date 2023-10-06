*=$0a00 
  lda #$00 ;initialize the  count
  sta $0afe ;store the count in this memory address for low byte
  sta $0aff  ;store the count in this memory address for high byte
count
  inc $0afe
  ldx $0afe
  cpx 00
  bne count
  inc $0aff
  jmp count