
#include <stdio.h>

// void printstr(const char *str)
// {
// 	puts(str);
// }
void printb(int x)
{
	if(x){
        printf("true");
	}
	else{
		printf("false");	
	}
	
}

void printint(int x)
{
	printf("%d\n", x);
}

void printstr(char* x)
{
	printf("%s", x);
}

void printchar(char c){
	printf("%c",c);
}

#ifdef BUILD_TEST
int main()
{
	printstr("42");
	return 0;
}
#endif