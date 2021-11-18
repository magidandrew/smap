#include <stdio.h>

// void printstr(const char *str)
// {
// 	puts(str);
// }

void printstr(int x)
{
	fprintf(stderr, "%d\n", x);
}

#ifdef BUILD_TEST
int main()
{
	printstr(42);
	return 0;
}
#endif