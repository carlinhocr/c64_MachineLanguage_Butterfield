*=$033c
;use tow tables to jumpto different addressees
;go to the inderect address on the table

table1=$0800 ;high address byte
table2=$0900 ;low address byte

  lda #$04 ;high byte
  sta table1
  lda #$10 
  sta table2 ; low byte

  ldx #$0
  lda table1,x
  pha
  lda table2,x
  pha
  rts
