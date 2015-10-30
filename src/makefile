
paser: tokenizer.l grammer.y *.cpp
	bison -d grammer.y
	flex tokenizer.l
	g++ -o parser grammer.tab.c lex.yy.c *.cpp -ll -I../include
