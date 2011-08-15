/*
 * Copyright (C) 2011 Doremi Lin  <doremi.lin@garmin.com>
 *
 * This source code is licensed under the GNU General Public License,
 * Version 2.  See the file COPYING for more details.
 */

%{
#include <stdint.h>
#include <stdio.h>
#include "genir.h"
%}

%union {
	int num;
	char varname[80];
}

%token <varname> VAR
%token <num> NUM
%token TYPE ASSIGNMENT SEMICOLON

%%
statements: expression
	|   statements expression

expression: TYPE VAR ASSIGNMENT NUM SEMICOLON {
		printf("var: %s, number: %d\n",
			$2, $4);
		genir_assign($4);
	};
%%

int main()
{
        printf("Doremi C Compiler #Build on %s\n", __TIMESTAMP__);
        ir_init();
        yyparse();
        gen_code();
        return 0;
}

