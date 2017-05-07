%{

#include <cstdio>
#include <iostream>
#include <stack>

using namespace std;

// stuff from flex that bison needs to know about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

std::stack<char *> my_stack;

void yyerror(const char *s);

%}

%union {
    char *sval;
}

%token <sval> INT
%token <sval> ID
%token <sval> PLUS
%token <sval> MINUS
%token <sval> DIV
%token <sval> MULT
%token <sval> EQUALS

%%

assign:
    ID EQUALS expression { my_stack.push($1); my_stack.push($2); }
    ;
expression:
    expression PLUS term { my_stack.push($2); }
    ;
expression:
    expression MINUS term { my_stack.push($2); }
    ;
expression:
    term
    ;
term:
    term MULT factor { my_stack.push($2); }
    ;
term:
    term DIV factor { my_stack.push($2); }
    ;
term:
    factor
    ;
factor:
    INT { my_stack.push($1); }
    ;

%%

int main(int, char**) {
	// open a file handle to a particular file:
	FILE *myfile = fopen("in.txt", "r");
	
	// make sure it's valid:
	if (!myfile) {
		cout << "I can't open the file!" << endl;
		return -1;
	}

	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;

	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));

	while (!my_stack.empty()) {
		std::cout << ' ' << my_stack.top(); 
		my_stack.pop();
	}
	
}

void yyerror(const char *s) {
	cout << "EEK, parse error on line " << "{UKNOWN}" << "!  Message: " << s << endl;
	
	// might as well halt now:
	exit(-1);
}
