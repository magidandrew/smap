
#include <stdio.h>
#include <stdlib.h>
#include "list.h"
// void printstr(const char *str)
// {
// 	puts(str);
// }
int all[17576][3];
int first = 0;
int l = 0;
	
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

int corresponding_int(list* x, int index) {

	char* current_elem = get_at(x,index);
	int ascii_val = (int) (*current_elem);
	return ascii_val - 65;
}

void corresponding_char(int number) {

	char element = (number + 65);

	printf("%c", element);

}

char current_char(int number) {
	char element = (number + 65);
	return element;
}

void initialize_potential_settings() {
	for(int i=0;i<26;i++){
		for(int j=0;j<26;j++){
			for(int k=0;k<26;k++){
				all[l][0] = i;
				all[l][1] = j;
				all[l][2] = k;
				l++;
			}
		}
	}
}

int key_test(int number, int index) {

	if(first==0) {
		initialize_potential_settings();
		first=first+1;
		
	}
	

	return all[number][index];
		
	
}



int modulus_operation(int x, int y) {
	return x%y;
}


//Methods defined in LRM

int stringLength(list* x) {

  return x->size;
	
}

int absolute(int x) {

	if (x < 0) {
		return -x;
	}

	return x;

}


void stringReverse(list* x) {

    int len = stringLength(x);  
	
	for (int j = len-1; j > -1; j--) { //Not efficient but my code with recurstion was failing idk why :-(
		char* temp = get_at(x,j);
		char res = *(temp);
		printf("%c", res);
	}

}


int ascii(list* x) {

	char* current_elem = (get_at(x,0));
	int ascii_val = (int) *current_elem;
	
	return ascii_val;
}


list* int_to_char(int x) {
    
    char* z = malloc(1);
	*z = x;
	list *str = malloc(sizeof(struct list));
	push_back(str,z);
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

int characterLocation(list* x, list* y) {


	int length_x = stringLength(x);
	char* first_element;
	char* second_element = get_at(y,0);
	for(int i=0; i < length_x;i++) {
		first_element = get_at(x,i);
		if(*first_element == *second_element) {
			return i;
		}
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

	int squared = 1;
    for (;;)
    {
        if (y & 1)
            squared *= x;
        y >>= 1;
        if (!y)
            break;
        x *= x;
    }

    return squared;

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