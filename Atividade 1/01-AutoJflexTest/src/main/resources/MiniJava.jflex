package br.ufpe.cin.if688.jflex;

%%

/* Não altere as configuraçoes a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class MiniJava
%eofclose

/* Insira as regras lexicas abaixo */
Inteiros = [0-9]+
Identificadores = ([A-Za-z]|[_])([A-Za-z]|[0-9]|[_])*
Whitespace =[ \n|\t|\r|\f|] 
Comentarios = ["/*" [^*] ~"*/" | "//".* ]
Reservados = "class"|"static"|"extends"|"public"|"main"|"void"|"String"|"int"|"boolean"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println"
Operadores = ["<"]|["=="]|["!="]|["+"]|["-"]|["*"]|["!"]|["&&"]
Delimitadores = ";"|"."|","|"="|"("|")"|"]"|"["|"{"|"}"

%%
{Reservados} {System.out.println("token gerado foi um reservado: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);} 
{Delimitadores} {System.out.println("token gerado foi um delimitador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}   
{Whitespace} {}    
{Comentarios} {System.out.print(" ");}
{Operadores} {System.out.println("token gerado foi um operador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);} 
{Inteiros} {System.out.println("token gerado foi um integer: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{Identificadores} {System.out.println("token gerado foi um id: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}

 

 

/* Insira as regras lexicas no espaco acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
