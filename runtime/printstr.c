
#include <stdio.h>

// void printstr(const char *str)
// {
// 	puts(str);
// }

void printstr(char* x)
{
	printf("%s", x);
}

#ifdef BUILD_TEST
int main()
{
	printstr("42");
	return 0;
}
#endif