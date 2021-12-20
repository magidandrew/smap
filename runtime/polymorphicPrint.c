#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <regex.h>
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




//Some methods which were defined in the LRM

int absolute(int x) {

	if (x < 0) {
		return -x;
	}

	return x;

}


int stringLength(char* x) {
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


int ascii(char* x) {

	int ascii_val = (int) *x;
	return ascii_val;
}


char* int_to_char(int x) {
    
    char z = x;
	char *str = malloc(2);
	str[0] = z;
	str[1] = '\0';
    return str;
}


int ceilFloat(double x) {

	
	int y = (int) x;
	float z = x - y;

	if(z >= 0.5) {
		return y+1;
	}

	return y;

}

int characterLocation(char* x, char *y) {

    int z = 0;
	for(;*x;*x++) {
	    
	    if(*x == y[0]) {
	        return z;
	    }
	    z = z + 1;
	}

	return -1;

}


int isCompDivisible(int x) {

	if(x%2 == 0) {
		return 1;
	}

	return 0;

}


int divisible(int x, int y) {

	if(x < y) {
		return 0;
	}
	if(x%y == 0) {
		return 1;
	}

	return 0;

}


int power(int x, int y) { //Exponentiation by squaring

	int result = 1;
    for (;;)
    {
        if (y & 1)
            result *= x;
        y >>= 1;
        if (!y)
            break;
        x *= x;
    }

    return result;

}


#ifdef BUILD_TEST
int main()
{
	printstr("42");
	return 0;
}
#endif