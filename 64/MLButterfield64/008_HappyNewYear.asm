;redirect output to printer using basic and print using this program
*=$0a00
  ldx #$01 ;load 1 as logical file 1 on register X
  jsr $ffc9 ;switches the output path (used by CHROUT, $FFD2) to the logical file specified at register X
  ;output is connected to logical file 1

  ldy #$ff
startprinting
  iny
  ldx #$ff
keepprinting  
  inx
  lda $0b00,x ;load a letter indexed by X
  jsr $FFD2 ;output character
  
  cpx #$e
  bne keepprinting
  cpy #$9
  bne startprinting

  ldx #$01  ;load 1 as logical file 1 on register X
  jsr $ffcc ;disconnect output and input from logical files and into regular screen and keyboard
  rts

*=$0b00
LETTERS
  
  byte "happy new year", $0d