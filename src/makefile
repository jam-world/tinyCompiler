
paser: tokenizer.l grammer.y
	bison -d grammer.y
	flex tokenizer.l
	g++ -o $@ grammer.tab.c lex.yy.c -ll
