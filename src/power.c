#include <stdio.h>

int power(int m, int n);

int main()
{
    int i;
    for (i = 0; i <= 100; ++i) {
        printf("%d = %d\n", i, power(2, i));
    }
    return 0;
}

int power(int base, int n)
{
    int p;
    for (p = 1; n > 0; --n) {
        p = p * base;
    }
    return p;
}
