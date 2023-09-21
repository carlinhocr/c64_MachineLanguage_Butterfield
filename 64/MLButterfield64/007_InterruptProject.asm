*=$033c

;create an interrupt that stores the content of $91 on the top os the screen
;Stop key indicator at $91. Values: $7F: Stop key is pressed.
;$FF: Stop key is not pressed.
  lda $91 ;copy the contents of memory $91 to the accumulator
  sta $0400 ;store it at the first character of the screen
  jmp ($03a0) ;return to the normal interrupt routine address that we will store at $03a0, $03a1

;enable the interrupt coding SYS $0344 = SYS 836
*=$0344
  ;copy the interrupt address to our temporary place
  lda $0314 ;low byte interrupt address
  sta $03a0
  lda $0315 ;high byte interrupt address
  sta $03a1
  ;put the address of our interrupt routine on the interrupt vector
  ;so our code will be called 64 times per minute
  sei ;stop interrupts so this will be executed atomically
  lda #$3c
  sta $0314
  lda #$03
  sta $0315
  cli
  rts

;diSable interrupt coding SYS 861
*=$035d
  sei
  lda $03a0
  sta $0314
  lda $03a1
  sta $0315
  cli
  rts  
  