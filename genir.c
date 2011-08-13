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

void ir_init()
{
	ir_type_ptr = &ir_type_buf[0];
	ir_num_ptr = &ir_num_buf[0];
}
