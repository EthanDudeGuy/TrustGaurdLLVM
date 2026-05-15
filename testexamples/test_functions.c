#include <stdio.h>

long long int global = 2;

int addemup(int x, int y) {
	return x + y;
}

int factorial(int n) {
    unsigned long long result = 1;

    if (n == 0 || n == 1) {
        return 1;
    }

    for (unsigned int i = 2; i <= n; i++) {
        result *= i;
    }

    return result;
}

int main() {
	printf("hello\n");
	volatile int x = 1;
	volatile int y = 2;
	int result = addemup(x, global);
	int fact_result = factorial(result);
	printf("the result was %d\n", fact_result);
	return fact_result;
}
