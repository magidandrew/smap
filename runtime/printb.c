
#include <stdio.h>

void printb(int x)
{
	if(x){
        printf("true");
	}
	else{
		printf("false");	
	}
	
}

#ifdef BUILD_TEST
int main()
{
	printint(1);
	return 0;
}
#endif