*=$1cb0 ;start after basic the program starts at $1c01

;program to multiply by ten first getting a number, and multiplying by 2 two times
;then adding the original number back and final multiplying by 2
;(((x*2)*2)+x)*2=x*10


;indirect addressing get the memory position on $2f low byte and $30 high byte
;containing the SOV Start of Variable pointer for basic in bank 1 of Commodore 128
;extract the first basic variable 
  ;high byte processing basic integers are stored high byte/low byte 
  ldy #$02 ;skip the bytes for the variable name
  sei ;stop interrupts while accesing bank 1
  lda #$2f ;load the indirect address of first variable in Bank 1 low byte
  ldx #$01 ; select bank1
  jsr $ff74 ; load from any memory bank with INDFET (indirect fetch)
  ;store the high byte twice to aid in multiplying by 10
  sta $0b00
  sta $0b02
  ;low byte processing
  ldy #$03
  lda #$2f ;load the indirect address of first variable in Bank 1 low byte
  ldx #$01 ; select bank1
  jsr $ff74 ; load from any memory bank with INDFET (indirect fetch)
  cli ; turn on interrupts again
  ;store the low byte twice to aid in multiplying by 10
  sta $0b01
  sta $0b03

;multiply (((x*2)*2)+x)*2=x*10
  ;multiply x*2
  asl $0b01 ;shift without taking in the carry and using a zero for the low byte
  rol $0b00 ;shift taking into account the carry from the low byte 
  ;multiply x*2
  asl $0b01 ;shift without taking in the carry and using a zero for the low byte
  rol $0b00 ;shift taking into account the carry from the low byte 
  ;add x
  clc ;clear the carry for addition
  lda $0b01 ;load the low byte tha was multiplied twice x*2*2
  adc $0b03 ;add and keep the carry for the low byte of x
  sta $0b01 ;save result
  lda $0b00 ;load the high byte tha was multiplied twice x*2*2
  adc $0b02 ;add and keep the carry for the high byte of x
  sta $0b00 ;save result
  ;multiply x*2
  asl $0b01 ;shift without taking in the carry and using a zero for the low byte
  rol $0b00 ;shift taking into account the carry from the low byte 

;save back to the original variable position
  sei ;stop interrupts while accesing bank 1
  ldy #$02
  lda #$2f ;load the indirect address of first variable in Bank 1 low byte
  sta $02b9 ;store the indirect variable with the place to write
  ldx #$01 ; select bank1
  lda $0b00 ; the integer high bytes
  jsr $ff77 ; call INDSTA the indirect stash subroutine

  ldy #$03
  ldx #$01 ; select bank1
  lda $0b01 ; the integer low bytes
  jsr $ff77 ; call INDSTA the indirect stash subroutine
  cli ; turn on interrupts again
  rts

;save the End of Basic Pointer after the machine language on position $1d1d
  lda #$1d
  sta $1210
  lda #$1d
  sta $1211
  rts        
