#include <stdio.h>

void clear_screen() {
	printf("\033[2J");
}

#ifdef BUILD_TEST
int main() {
	clear_screen();
	return 0;
}
#endif