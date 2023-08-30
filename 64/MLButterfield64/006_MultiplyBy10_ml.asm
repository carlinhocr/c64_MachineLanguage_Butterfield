*=$0880

;program to multiply by ten first getting a number, and multiplying by 2 two times
;then adding the original number back and final multiplying by 2
;(((x*2)*2)+x)*2=x*10


;indirect addressing get the memory position on $2d low byte and $2e high byte
;containing the SOV Start of Variable pointer for basic
;extract the first basic variable 
  ;high byte processing basic integers are stored high byte/low byte 
  ldy #$02
  lda ($2d),y ;load the high byte
  ;store the high byte twice to aid in multiplying by 10
  sta $033c
  sta $033e
  ;low byte processing
  ldy #$03
  lda ($2d),y ;load the low byte
  ;store the low byte twice to aid in multiplying by 10
  sta $033d
  sta $033f

;multiply (((x*2)*2)+x)*2=x*10
  ;multiply x*2
  asl $033d ;shift without taking in the carry and using a zero for the low byte
  rol $033c ;shift taking into account the carry from the low byte 
  ;multiply x*2
  asl $033d ;shift without taking in the carry and using a zero for the low byte
  rol $033c ;shift taking into account the carry from the low byte 
  ;add x
  clc ;clear the carry for addition
  lda $033d ;load the low byte tha was multiplied twice x*2*2
  adc $033f ;add and keep the carry for the low byte of x
  sta $033d ;save result
  lda $033c ;load the high byte tha was multiplied twice x*2*2
  adc $033e ;add and keep the carry for the high byte of x
  sta $033c ;save result
  ;multiply x*2
  asl $033d ;shift without taking in the carry and using a zero for the low byte
  rol $033c ;shift taking into account the carry from the low byte 

;save back to the original variable position
  ldy #$02
  lda $033c 
  sta ($2d),y ;save the high byte
  ldy #$03
  lda $033d 
  sta ($2d),y ;save the low byte

;save the Start of VAriable Pointer after the machine language on position $08d0
  lda #$d0
  sta $2d
  lda #$08
  sta $2e
  rts        
