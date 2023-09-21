*=$033c

;create an interrupt that diplay the values of page zero on the screen

  ldx #$00
keepprinting
  lda ($00,x) ;copy the contents of 00 plus x memory address to accumulator
  sta $0400,x ;store it at an X indexed position on the screen
  inx ;increase X
  cpx #$FF ;when all content from 00 to FF was copied return and end
  bcc keepprinting 
  jmp ($03a0) ;return to the normal interrupt routine address that we will store at $03a0, $03a1

;enable the interrupt coding SYS $034b = SYS 843
*=$034b
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

;diSable interrupt coding SYS 868
*=$0364
  sei
  lda $03a0
  sta $0314
  lda $03a1
  sta $0315
  cli
  rts  
  