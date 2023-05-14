%{
#include "calculator.tab.hpp"
%}

%%
[0-9]+     { yylval = atoi(yytext); return NUMBER; }
[ \t]      ;  // Ignore whitespace
\n         return 0;  // End of line
.          return yytext[0];  // Return any other character as is
%%

int yywrap() {
    return 1;
}
