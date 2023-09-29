100 print "count a letters in a sequential file"
110 input "input from (disk, tape)";a$
120 if left$(a$,1)="t" then open 1:goto 160
130 if left$(a$,1)<>"d" goto 110
140 input "disk file name";n$
150 open 1,8,3,n$
160 sys 2560
170 close 1
180 print "the amount of letters a is":print peek(2815)
 