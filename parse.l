/*
 * Copyright (C) 2011 Doremi Lin  <doremi.lin@garmin.com>
 *
 * This source code is licensed under the GNU General Public License,
 * Version 2.  See the file COPYING for more details.
 */

%{
#include <stdint.h>
#include "genir.h"
#include "types.h"
#include "y.tab.h"
char *endptr;
int lineno;
%}

%%
int		{ return TYPE; }
([a-zA-Z]*)	{ strcpy(yylval.varname, yytext); return VAR; }
=		{ return ASSIGNMENT; }
([0-9]*)	{ yylval.num = strtol(yytext, &endptr, 10); return NUM; }
;		{ return SEMICOLON; }
[\t ]	;
\n      lineno++;
%%

int yyerror(char *s)
{
	fprintf(stderr, "%d: %s at %s\n", lineno, s, yytext);

    return 0;
}
