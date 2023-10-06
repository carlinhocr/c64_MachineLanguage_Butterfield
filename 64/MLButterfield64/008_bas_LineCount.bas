100 print "count the numbers of returns 0d in a sequential file"
105 print "equal to the number of lines of the file"
110 input "input from (disk, tape)";a$
120 if left$(a$,1)="t" then open 1:goto 160
130 if left$(a$,1)<>"d" goto 110
140 input "disk file name";n$
150 open 1,8,3,n$
160 sys 2560
170 close 1
180 print "the number of lines are":print peek(2815)
 