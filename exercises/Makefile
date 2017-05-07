1.tab.c 1.tab.h: 1.y
	bison -d 1.y

lex.yy.c: 1.l 1.tab.h
	flex 1.l

exercise: lex.yy.c 1.tab.c 1.tab.h
	g++ 1.tab.c lex.yy.c -o exercise

