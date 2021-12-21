
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


//Methods for enigma

int stringLength(char* x) {
	if (*x == '\0') {
		return 0;
	}

  return (1 + stringLength(++x));
	
}


int corresponding_int(char* x, int index) {

	char current_elem = x[index];
	int ascii_val = (int) current_elem;
	return ascii_val - 65;
}


int modulus_operation(int x, int y) {
	return x%y;
}



#ifdef BUILD_TEST
int main()
{
	printstr("42");
	return 0;
}
#endif