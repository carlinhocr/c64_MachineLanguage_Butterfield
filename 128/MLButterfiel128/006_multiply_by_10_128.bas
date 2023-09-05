100 v%=0:bank 15
110 for j = 1 to 5
120 input "value";v%
130 sys 7344 :REM basic starts at $1c01 + 127 bytes for the machine program = 7296 decimal
140 print "times ten =";v%
150 next j