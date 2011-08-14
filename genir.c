#include <stdio.h>
#include <stdint.h>
#include "types.h"
#include "y.tab.h"

#define IRSIZE 16

/* IR form:
 * T1 = num
 */

enum IRTYPE {
	ASSIGN,
	END
};

int ir_type_buf[IRSIZE];
int ir_num_buf[IRSIZE];

int *ir_type_ptr;
int *ir_num_ptr;

int genir_assign(int num)
{
	*ir_type_ptr++ = ASSIGN;
	*ir_num_ptr++ = num;

	printf("assign = %d\n", num);
	return 0;
}

int genir_done()
{
	*ir_type_ptr = END;
	*ir_num_ptr = 0;
}

void ir_init()
{
	ir_type_ptr = &ir_type_buf[0];
	ir_num_ptr = &ir_num_buf[0];
}

void gen_mov_code(int num)
{
	
}

void gen_asm_code(int type, int num)
{
	switch (type) {
		case ASSIGN:
			gen_mov_code(num);
			break;
	}
}

void gen_code()
{
	int type, num;
	do {
		type = *ir_type_ptr++;
		num = *it_num_ptr++;
		gen_asm_code(type, num);
	} while (type != END);
}
