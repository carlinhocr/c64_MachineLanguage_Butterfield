10 rem preserve data statements for all our program
20 for  j = 2816 to 2835:print peek(j);:next j
50 data 162,0,189,14,11,32,210,255,232,224,6
60 data 208,245,96,72,69,76,76,79,13
80 for j = 2816 to 2835:read x:poke j,x:next j
100 bank 15
110 for j = 1 to 3
120 sys 2816
130 next j