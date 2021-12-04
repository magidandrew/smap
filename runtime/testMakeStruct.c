// Type your code here, or load an example.
#include <stdlib.h>
#include <string.h>


struct test {
    char* data;
    int length;
};

struct test* testMakeStruct(char* str, int len){
    struct test* aThing = (struct test*) malloc(sizeof(struct test));
    aThing->data = (char*) malloc(len);
    strcpy(aThing->data,str);
    aThing->length = len;
    return aThing;
}

#ifdef BUILD_TEST
int main() {
    char greeting[6] = "howdy";
    struct test* aThing = makeStruct (greeting,6);
    return 0;
}
#endif
