%{
#include <iostream>
#include "stdio.h"
#include "symbolTable.hpp"
#include "variable.hpp"
#include "function.hpp"
#include "scope.hpp"
#include "item.hpp"
#include <string>

symbolTable* current; // the current symbol table
string currentType; // current declaration type
string currentFunName; // current function name
int currentParaNum; // current function paramaeter number

// define some extern functions to make grammer.y suitable for cpp
void yyerror(const char *s)
{
	fprintf(stderr, "error: %s\n", s);
}

int counter = 0;

extern "C"
{
        int yyparse(void);
        int yylex(void);  
        int yywrap()
        {
                return 1;
        }

}

using namespace std;
 
%}

%token INT
%token STRING
%token <n> CONST_INT
%token <s> CONST_STRING

%token <s> IDENT

%token EXTERN

%token IF
%token ELSE
%token WHILE
%token DO
%token RETURN
%token FOR
%token THEN

%token ASSIGNMENT
%token INF
%token EGAL
%token SUP
%token INFEQUAL
%token SUPEQUAL
%token DIFF

%token PLUS
%token MINUS
%token MULTI
%token DIV

%token SHIFTRIGHT
%token SHIFTLEFT
%token MODULO


%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%type <s> function_definition function_declarator
%type <n> parameter_list 

%union
{
  char* s;
  int n;
}

%%
program :  
external_declaration 
| program external_declaration 
;

external_declaration :  
declaration 	// Declaration Global			
| EXTERN declaration
       {
         /* how to do it */
       }// Set Extern attribute
| function_definition  
;

function_definition :  
type function_declarator decl_glb_fct compound_instruction
    {
    }// generate code function
  
;

decl_glb_fct :
    {
      cout << "create new funtion name: " << currentFunName << " type: " << currentType << " parameter number: " << currentParaNum << endl;
      func* newFun = new func(currentType, currentParaNum);
      current->insert(currentFunName, newFun);
    }
// Get function name - Create a spot to store the function - set attributes
;

declaration :  
type declarator_list ';'
;

type :  
INT 			{cout << "set current type: int" << endl;  currentType = "int";}		// set INT
| STRING 		{ cout << "set current type: string" << endl; currentType = "string";}		// set String
;

declarator_list :  
declarator 				// Propagate code
| declarator_list ',' declarator 	
;

declaration_list :  
declaration 				// Set locals
| declaration_list declaration  	// Set locals
;

declarator :  
IDENT
   {
     cout << "create new variable: " << $1 << endl;
     variable* newVar = new variable(0,currentType);
     current->insert($1,newVar);
   }				// Create Variable
| function_declarator 		        // Create Function
;

function_declarator :  
IDENT '(' ')'
      {
        cout << "set current fun name: " << $1 << " parameter number: "<< 0 << endl;
        currentFunName = $1;
        currentParaNum = 0;
      }			// Create function name
| IDENT '(' parameter_list ')'
      {
        cout << "set current fun name: " << $1 << "parameter number: " << $3 <<endl;
        currentFunName = $1;
        currentParaNum = $3;
      }  	// Create partial function
;

parameter_list :  
parameter_declaration {$$=1;}			
| parameter_list ',' parameter_declaration {$$=$1+1;}// Insert parameters
;

parameter_declaration :  
type IDENT 				// Type declaration
;

instruction :  
';'  
| compound_instruction {}
| expression_instruction  {}
| iteration_instruction  {}
| select_instruction  {}
| jump_instruction {}
;

expression_instruction :              
expression ';'   
| assignment ';' 
;

assignment :  
IDENT ASSIGNMENT expression 
;

compound_instruction :  
block_start declaration_list instruction_list block_end {}
| block_start declaration_list block_end 
| block_start instruction_list block_end {}
| block_start block_end 
| ';'
;


block_start :  
'{' {
  cout << "start new block with new symbol table: " << endl;
  symbolTable *scopeTable = new symbolTable(current);
  current->insert("scope",new scope(scopeTable));
  current = scopeTable;
    } // Init your hash table - symbol table
;

block_end :  
'}' {
  cout << "end the block jump out of the symbol table: " << endl;
  current = current->upToSuperTable();
    } // Empty hash table
;

instruction_list :  
instruction  {}
| instruction_list instruction 
;

select_instruction :  
cond_instruction instruction %prec LOWER_THAN_ELSE
| cond_instruction instruction ELSE instruction 
;

cond_instruction :  
IF '(' condition ')' {} 
;

iteration_instruction :  
WHILE '(' condition ')' instruction // Handle while loop
| DO instruction WHILE '(' condition ')' 
| FOR '(' assignment ';' condition ';' assignment ')' instruction 
;

jump_instruction:  
RETURN expression ';' 
;

condition :  
expression comparison_operator expression 
;

comparison_operator :  
EGAL  {}
| DIFF {} 
| INF  {}
| SUP  {}
| INFEQUAL {}
| SUPEQUAL {} 
;

expression :  
expression_additive {}
| expression SHIFTLEFT expression_additive //  Compute expression
| expression SHIFTRIGHT expression_additive // Compute expression
;

expression_additive :  
expression_multiplicative {}
| expression_additive PLUS expression_multiplicative // Compute expression
| expression_additive MINUS expression_multiplicative // Compute expression
;

expression_multiplicative :  
unary_expression{}
| expression_multiplicative MULTI unary_expression
| expression_multiplicative DIV unary_expression
| expression_multiplicative MODULO unary_expression
;

unary_expression:  
expression_postfixee {}
| MINUS unary_expression
;

expression_postfixee :  
primary_expression {}
| IDENT '(' argument_expression_list')' 
| IDENT '(' ')' 
;

argument_expression_list:  
expression
| argument_expression_list',' expression 
;

primary_expression :  
IDENT  
| CONST_INT
| CONST_STRING 
| '(' expression ')'
;



%%

int main()
{
  current = new symbolTable(NULL);
  yyparse();
  cout << endl << "---------------------------------" << endl;
  current->printTable();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
