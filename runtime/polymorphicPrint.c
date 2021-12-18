
#include <stdio.h>
#include <string.h>
// void printstr(const char *str)
// {
// 	puts(str);
// }


void printb(int x)
{
	if(x){
        printf("true\n");
	}
	else{
		printf("false\n");	
	}
	
}

void printint(int x)
{
	printf("%d\n", x);
}

void printstr(char* x)
{
	printf("%s\n", x);
}




//Some methods which were defined in the LRM

int absolute(int x) {

	if (x < 0) {
		return -x;
	}
	
	return x;

}


int stringLength(char* x)
{
	if (*x == '\0') {
		return 0;
	}

  return (1 + stringLength(++x));
	
}

void stringReverse(char* x) {

    int len = stringLength(x);  

	for (int j = len; j > -1; j--) { //Not efficient but my code with recurstion was failing idk why :-(
		printf("%c", x[j]);
	}
	printf("\n");

}



#ifdef BUILD_TEST
int main()
{
	printstr("42");
	return 0;
}
#endif