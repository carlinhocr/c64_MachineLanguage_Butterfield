4 rem to print the assembler program as data statements
5 rem for j =828 to 847:print peek(j);:next j 
50 data 162,0,189,74,3,32,210,255,232,224,6
60 data 208,245,96,72,69,76,76,79,13
70 rem to put all into memory
80 rem for j =828 to 847:read x:poke j,x:next j 
100 for j=1to10
110 sys 828
120 next j