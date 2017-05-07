%option noyywrap debug

%{
#include <iostream>
#include "1.tab.h"

using namespace std;

#define YY_DECL extern "C" int yylex()
%}

%%

[ \t\n]         ;
[0-9]+          { yylval.sval = strdup(yytext); return INT; }
[\+]            { yylval.sval = strdup(yytext); return PLUS; }
[\-]            { yylval.sval = strdup(yytext); return MINUS; }
[\*]            { yylval.sval = strdup(yytext); return MULT; }
[\/]            { yylval.sval = strdup(yytext); return DIV; }
[\=]            { yylval.sval = strdup(yytext); return EQUALS; }
[a-zA-Z]+[0-9]* { yylval.sval = strdup(yytext); return ID; }
.               ;

%%
