#include <stdio.h>

#define REPEATS 2000

volatile int guard = 0;

#pragma trusted
int formula_satisfied(
    int x1, int x2, int x3, int x4,
    int x5, int x6, int x7, int x8,
    int x9, int x10, int x11, int x12,
    int x13, int x14, int x15, int x16
) {
    if (!((x1 || x2) && (!x1 || x3))) return 0;
    if (!((!x2 || !x3 || x4) && (!x4 || x5))) return 0;
    if (!((!x5 || x6) && (!x6 || x7))) return 0;
    if (!((!x7 || x8) && (!x8 || x9))) return 0;
    if (!((!x9 || x10) && (!x10 || x11))) return 0;
    if (!((!x11 || x12) && (!x12 || x13))) return 0;
    if (!((!x13 || x14) && (!x14 || x15))) return 0;
    if (!((!x15 || x16) && (!x16 || x1))) return 0;
    if (!((!x1 || !x2) && (!x3 || !x4))) return 0;
    if (!((!x5 || !x6) && (!x7 || !x8))) return 0;
    if (!((!x9 || !x10) && (!x11 || !x12))) return 0;
    if (!((!x13 || !x14) && (!x15 || !x16))) return 0;

    return 1;
}

#pragma trusted
int solve_sat(int salt) {
    int x1, x2, x3, x4;
    int x5, x6, x7, x8;
    int x9, x10, x11, x12;
    int x13, x14, x15, x16;

    for (x1 = 0; x1 <= 1; x1++)
    for (x2 = 0; x2 <= 1; x2++)
    for (x3 = 0; x3 <= 1; x3++)
    for (x4 = 0; x4 <= 1; x4++)
    for (x5 = 0; x5 <= 1; x5++)
    for (x6 = 0; x6 <= 1; x6++)
    for (x7 = 0; x7 <= 1; x7++)
    for (x8 = 0; x8 <= 1; x8++)
    for (x9 = 0; x9 <= 1; x9++)
    for (x10 = 0; x10 <= 1; x10++)
    for (x11 = 0; x11 <= 1; x11++)
    for (x12 = 0; x12 <= 1; x12++)
    for (x13 = 0; x13 <= 1; x13++)
    for (x14 = 0; x14 <= 1; x14++)
    for (x15 = 0; x15 <= 1; x15++)
    for (x16 = 0; x16 <= 1; x16++) {
        if (formula_satisfied(
            x1, x2, x3, x4,
            x5, x6, x7, x8,
            x9, x10, x11, x12,
            x13, x14, x15, x16
        )) {
            return x1 + x2 + x3 + x4 +
                   x5 + x6 + x7 + x8 +
                   x9 + x10 + x11 + x12 +
                   x13 + x14 + x15 + x16 +
                   (salt & 0);
        }
    }

    return -1;
}

int main(void) {
    int checksum = 0;
    int result = 0;

    for (int i = 0; i < REPEATS; i++) {
        guard = i;
        result = solve_sat(guard);
        checksum += result;
    }

    printf("result=%d checksum=%d\n", result, checksum);

    return 0;
}
