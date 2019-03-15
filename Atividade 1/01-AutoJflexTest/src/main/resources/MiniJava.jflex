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
Identificador = [A-Za-z]|{letra}({letra}|{digito})*
letra = [A-Za-z]
digito = [0-9]
inteiro = 0 | [1-9][0-9]*
Whitespace =[\n|\t|\r|\f] 
Comentarios = ["/*" [^*] ~"*/" | "/*" "*"+ "/" ]
Reservados = "class"|"static"|"extends"|"public"|"main"|"void"|"String"|"int"|"boolean"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println"
Operadores = [&]|[<]|[==]|[!=]|[+]|[-]|[*]|[!]
Delimitadores = [";"|"."|","|"="|"("|")"|"]"|"["|"{"|"}"]

%%
{Reservados} {System.out.println("token gerado foi um reservado: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);} 
{Delimitadores} {System.out.println("token gerado foi um delimitador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{Operadores} {System.out.println("token gerado foi um operador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}   
{inteiro} {System.out.println("token gerado foi um integer: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);} 
{Identificador} {System.out.println("token gerado foi um id: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{Comentarios} {}
{Whitespace} {}    




 

 

/* Insira as regras lexicas no espaco acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
