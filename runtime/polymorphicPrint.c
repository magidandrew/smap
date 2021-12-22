
#include <stdio.h>
#include "list.h"
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

int stringLength(list* x) {

  return x->size;
	
}


int corresponding_int(list* x, int index) {

	char* current_elem = get_at(x,index);
	int ascii_val = (int) (*current_elem);
	return ascii_val - 65;
}

void corresponding_char(int number) {

	char element = (number + 65);

	printf("%c", element);

}


int modulus_operation(int x, int y) {
	return x%y;
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