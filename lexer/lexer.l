
%{
    #include <stdio.h>
     int yywrap(){return 1;}
    int tokencount = 0;
%}

%%
return                  {tokencount++; printf("return\n");}
int                    {tokencount++; printf("Integer\n");}
float         {tokencount++; printf("Float\n");}
double         {tokencount++; printf("Double\n");}
while          {tokencount++; printf("While\n");}
for          {tokencount++; printf("for\n");}
do          {tokencount++; printf("do\n");}
if          {tokencount++; printf("if\n");}
else          {tokencount++; printf("else\n");}
#include[ ]*(\"([a-zA-z]([a-zA-z0-9\+\/\.])*)\"|\<([a-zA-z]([a-zA-z0-9\+\/\.])*)\>)       {tokencount++; printf("include header\n");}
main          {tokencount++; printf("main\n");}
[+|-]?(([0-9])+(\.([0-9])*)?|([0-9])*(\.([0-9])+))     {tokencount++; printf("Num : %s\n", yytext);}
\"([a-zA-Z ])*\"          {tokencount++; printf("String Literal\n");}
[a-zA-Z][a-zA-z0-9]*      {tokencount++; printf("Identifier : %s\n", yytext);}
==             {tokencount++; printf("EQCOMP\n");}
\>\=             {tokencount++; printf("GREATEREQ\n");}
\<\=             {tokencount++; printf("LESSEREQ\n");}
\!\=            {tokencount++; printf("NEQ\n");}
\+\+             {tokencount++; printf("INC\n");}
\-\-             {tokencount++; printf("DEC\n");}
\|\|              {tokencount++; printf("OROR\n");}
\&\&              {tokencount++; printf("ANDAND\n");}
\!             {tokencount++; printf("NOT\n");}
\(             {tokencount++; printf("OPENB\n");}
\)             {tokencount++; printf("CLOSEB\n");}
\[             {tokencount++; printf("ARRAYOPEN\n");}
\]             {tokencount++; printf("ARRAYCLOSE\n");}
\{             {tokencount++; printf("OPENFB\n");}
\}             {tokencount++; printf("CLOSEFB\n");}
\;             {tokencount++; printf("SEMICOLON\n");}
\,          {tokencount++; printf("COMMA\n");}


%%

int main(){
     yylex();
     return 0;
}