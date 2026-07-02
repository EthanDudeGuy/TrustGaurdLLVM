#include<stdint.h>
#include<stdio.h>

int main() {
	uint64_t x = 0xFFFFFFFFFFFFFFFF;
	__builtin_riscv_put_sentry(x);
	x = __builtin_riscv_get_sentry();
	printf("%lx",x);
	return x;

}
