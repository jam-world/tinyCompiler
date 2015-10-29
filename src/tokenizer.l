%option noyywrap
%x QUOTE
%x MARCO


%{
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
extern "C"
{
  int yylex(void);
}
#include "grammer.tab.h"
%}


COMMENTS "//".*
COMMENTS_MULTILINE "/*"([^*]|\*+[^*/])*\*+"/"
DEFINE #define
IDENTIFIER [a-zA-Z]+[0-9]*
NUMBER [0-9]+ 

%%
{COMMENTS} {} // Comment Block
{COMMENTS_MULTILINE} 	{}

int {return INT;} // Reserved Words
extern {return EXTERN;}
string {return STRING;}
if {return IF;}
else {return ELSE;}
while {return WHILE;}
do {return DO;}
for {return FOR;}
return {return RETURN;}

"(" |
")" |
"," |
";" |
"{" |
"}" {return yytext[0];}



"/" {return DIV;}
"+" {return PLUS;}
"*" {return MULTI;}
"%" | {return MODULO;}
"<<" {return SHIFTLEFT;}
">>" {return SHIFTRIGHT;}
"<=" {return INFEQUAL;}
">=" {return SUPEQUAL;}
"==" {return EGAL;}
"!=" {return DIFF;}
"<" {return INF;}
">" {return SUP;}
"=" {return ASSIGNMENT;}
{IDENTIFIER} {return IDENT;}
{NUMBER} {return CONST_INT;}
\n {}
[ \t] {}

\" { BEGIN QUOTE;}

<QUOTE>([^\"])* {return CONST_STRING;}
<QUOTE>\" { BEGIN INITIAL;}

"#" {BEGIN MARCO;}

<MARCO>.* {}
<MARCO>\n {BEGIN INITIAL;}


. {printf("%s: invalid_lex_error\n", yytext);}
%%


