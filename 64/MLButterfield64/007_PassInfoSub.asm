;pass info to a subroutine using the stack
;it will print the letter H
;run it with SYS 828
*=$033c
  lda #$48 ;load a character to print and to pass it to the sub via the stack
  pha ;store the character at the stack address $01ff
  jsr subprintchar ;call the subroutine
  brk


subprintchar
  pla ;retrieve low byte return address
  sta $08a0 ;save it for latter
  pla ;retrieve high byte return address
  sta $08a1 ;save it for latter
  pla ;retrieve letter to print    
  jsr $FFD2 ;print it
  lda $08a1 ;retrieve high byte return address
  pla ;store it in the stack
  lda $08a0 ;retrieve low byte return address  
  pla ;store it in the stack
  rts ;return using the correct return address in the stack