
#include <stdio.h>

void printint(int x)
{
	printf("%d\n", x);
}

#ifdef BUILD_TEST
int main()
{
	printint(42);
	return 0;
}
#endif