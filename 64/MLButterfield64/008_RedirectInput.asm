;redirect input from a fil to screen  using basic and print using this program
*=$033c
  ldx #$01 ;load 1 as logical file 1 on register X
  jsr $ffc6 ;switches the input path (used by GET, $FFe4) to the logical file specified at register X
  ;input is connected to logical file 1
  ;load the information
readchar
  jsr $ffe4 ;load one character
  jsr $FFD2 ;output character
  ;check st at $90
  lda $90
  ;if zero more to come to the file if non zero it is an error or end of file
  beq readchar
  jsr $ffcc ;disconnect output and input from logical files and into regular screen and keyboard
  rts