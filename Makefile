TARGET = parse
CFLAGS = -Wall -Wextra

all:$(TARGET)

parse:parse.l parse.y genir.c
	flex parse.l
	yacc -d parse.y
	gcc $(CFLAGS) -c -o genir.o genir.c
	gcc -DYYDEBUG=1 -o $@ genir.o y.tab.c lex.yy.c -ly -ll

clean:
	rm -rf $(TARGET) *.o lex.yy.c y.tab.*
