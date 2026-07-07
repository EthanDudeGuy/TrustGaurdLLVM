#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

int main() {
	uint64_t x = 3;
	volatile uint64_t* y = (volatile uint64_t*)malloc(sizeof(uint64_t));
	*y = 10;
	printf("%ld\n", *y);
	free((void*)y);
}



