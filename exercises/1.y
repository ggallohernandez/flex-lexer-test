%{

#include <cstdio>
#include <iostream>

using namespace std;

// stuff from flex that bison needs to know about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;
 
void yyerror(const char *s);

%}

%union {
    int ival;
    char *sval;
}

%token <ival> INT
%token <sval> ID

%%

assign:
    ID = expression {   }
    ;
expression:
    expression + term
    ;
expression:
    expression - term
    ;
expression:
    term
    ;
term:
    term * factor
    ;
term:
    term / factor
    ;
term:
    factor
    ;
factor:
    INT
    ;
