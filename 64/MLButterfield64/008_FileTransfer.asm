;file transfer redirect input output
*=$0a00 
  ldx #$01 ;load 1 as logical file 1 on register X
  jsr $ffc6 ;switches the input path (used by GET, $FFe4) to the logical file specified at register X
  ;input is connected to logical file 1
  ;load the information
  jsr $ffe4 ;load one character to the A register
  ;check st and push the value in the stack for the pinput device
  ldx $90
  php ;save the procesor status register
  ;if st is Zero then flag Z=1
  pha ;preserve the character in the accumulator
  jsr $ffcc ;disconnect input source and this destroys the a register content
  ;connect the output to file 2
  ldx #$02 ;load 2 as logical file 1 on register X
  jsr $ffc9 ;switches the output path (used by CHROUT, $FFd2) to the logical file specified at register X
  ;output is connected to logical file 2
  pla ;load the character to output from the stack to the A register
  jsr $ffd2 ; output the character on the A register
  jsr $ffcc ;disconnect output source and this destroys the a register content
  ;now lets get the st flags from the input devices stashed at the stack
  plp
  ;if z flag is zero lets get another character if not end
  beq $0a00
  rts
