100 v%=0
110 input "enter a number less than 256";v%
120 if v% > 255 goto 110
130 poke 828,v%
135 sys 829
140 r%=peek(828)
150 print "half the number",r%