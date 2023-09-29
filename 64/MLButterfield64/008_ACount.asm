;a count, count how many A are there in a sequential file
*=$0a00 
  lda #$00 ;initialize the A count
  sta $0aff ;store the count in this memory address for letter a
  ldx #$01 ;load 1 as logical file 1 on register X
  jsr $ffc6 ;switches the input path (used by GET, $FFe4) to the logical file specified at register X

startreading
  ;input is connected to logical file 1
  ;load the information
  jsr $ffe4 ;load one character to the A register
  ;check st and push the value in the stack for the pinput device
  ldx $90
  php ;save the procesor status register
  cmp #$41 ;compare the character on the accumulator with "a" $41
  bne keepgoing
  inc $0aff
    
keepgoing
  ;now lets get the st flags from the input devices stashed at the stack
  plp
  ;if z flag is zero lets get another character if not end
  beq startreading
  jsr $ffcc ;disconnect input source and this destroys the a register content 
  rts
