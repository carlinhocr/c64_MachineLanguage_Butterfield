;add a basic command
; print ten * when an & is found as a basic command


*=$033c
  ;look ahead of the current basic instruction
  ldy #$01
  lda ($7a),y ;$7a is the TXTPTR of basic (go to the contents in $7a and add one later)
  cmp #$26 ;compare to the ascii &
  beq AMPERSAND ; if it is & branch to address 0347

GOTONORMALBASIC
  jmp ($03a0) ;if not ampersand go to the regular basic interpreter through and
              ;lindirect address we put on $03a0
AMPERSAND
  jsr $0073 ; call $CHRGET to get the & character
  ;lets print 10 asterisks
  ldy #$00
  lda #$2a ;load to the accumulator the asterisk character
PRINTASTERISK  
  jsr $ffd2 ;print to screen what is in the accumulator
  iny ;increase y so we will count to 10
  cpy #$0a ; compare register y to 10
  bcc PRINTASTERISK ; keep printing the asterisk if it is less than $0a
  lda #$0d ;load the return character
  jsr $ffd2 ;print to screen what is in the accumulator
  jmp GOTONORMALBASIC
  
;now lets link the program and activate it
;starting at $035e and suing sys 862 to activate it

*=$035e
  ;load and store at memory position $03a0 $03a1 the basic interpreter
  lda $0308  
  sta $03a0
  lda $0309
  sta $03a1
  ;add our new interpreter at $033c
  lda #$3c
  sta $0308
  lda #$03
  sta $0309
  rts
  
  
  


