%{
include <iostream>

using namespace std;

#define YY_DECL extern "C" int yylex()
%}

%%

[ \t\n]         ;
[0-9]+          { yylval.ival = atoi(yytext); return INT; }
[a-zA-Z]+[0-9]* { yylval.sval = strdup(yytext); << endl; return ID; }
.               ;

%%

int main(int, char**) 
{
    // lex through the input:
    yylex();
}
