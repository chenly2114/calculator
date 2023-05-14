%{
#include <iostream>

extern int yylex();
extern int yyparse();

int yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%
statement: expression { std::cout << "Result: " << $1 << std::endl; }
         ;

expression: expression '+' expression { $$ = $1 + $3; }
          | expression '-' expression { $$ = $1 - $3; }
          | expression '*' expression { $$ = $1 * $3; }
          | expression '/' expression { $$ = $1 / $3; }
          | '(' expression ')'           { $$ = $2; }
          | NUMBER                      { $$ = $1; }
          ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char* msg) {
    std::cerr << "Error: " << msg << std::endl;
    return -1;
}
