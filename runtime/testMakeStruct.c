// Type your code here, or load an example.
#include <stdlib.h>
#include <string.h>
#include "list.h"

/************hacky editing of Andrew's list struct and methods ***********************/
//replace void* with char* because LLVM doesn't like void*.
// #define INITIAL_LIST_CAPACITY 10

// typedef struct list{
//     char **data;
//     int capacity;
//     int size;
// } list;

// int init_list(list *l) {
//     l->capacity = INITIAL_LIST_CAPACITY;
//     l->size = 0;

//     l->data = (char **) malloc(INITIAL_LIST_CAPACITY * sizeof(char *));
//     if (!l->data)
//         return -1; // failure

//     return 0; // success
// }

int bad_add_head(list* l,char* elt){
    init_list(l);
    l->data[0] = elt;
    return(0);
}

int very_bad_get_head(list* l){
    return (int) *(l->data[0]);
}










/***********************************/



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
