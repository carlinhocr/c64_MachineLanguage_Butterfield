;redirect output to printer using basic and print using this program
*=$033c
  ldx #$01 ;load 1 as logical file 1 on register X
  jsr $ffc9 ;switches the output path (used by CHROUT, $FFD2) to the logical file specified at register X
  ;output is connected to logical file 1
  lda #$48 ;load h letter
  jsr $FFD2 ;output character
  lda #$49 ;load i letter
  jsr $FFD2 ;output character
  lda #$0d ;load return special character 
  jsr $FFD2 ;output character
  jsr $ffcc ;disconnect output and input from logical files and into regular screen and keyboard
  