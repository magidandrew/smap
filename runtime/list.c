#include <stdlib.h>
#include <stdio.h>

#define INITIAL_LIST_CAPACITY 10

#define FLOAT_TYPE 1
#define CHAR_TYPE 2
#define BOOL_TYPE 3
#define LIST_TYPE 4
#define INT_TYPE 5

typedef struct list {
    void *data;
    int capacity;
    int size;
    int type;
} list;

int init_list(list *l, int type) {
    l->capacity = INITIAL_LIST_CAPACITY;
    l->size = 0;
    l->type = type;

    l->data = (void *) malloc(INITIAL_LIST_CAPACITY * sizeof(void *));
    printf("l->data ptr: %p\n", l->data);
    if (!l->data)
        return -1; // failure

    return 0; // success
}

int pushback_int(list *l, int *item) {
    if (l->type != INT_TYPE)
        return -1;

    // resizing
    if ((l->size + 1) > l->capacity) {
        puts("resizing");
        printf("l->data ptr realloc: %p\n", l->data);
        l->data = (void *) realloc(l->data, l->capacity * 2 * sizeof(void *));
        if (l->data == NULL)
            return -1;
        l->capacity *= 2;
    }

    // allocate space for this item on heap
    int *tmp = (int *) malloc(sizeof(int));
    // copy over value to this address
    // *tmp = *((int *) item);


    // inc arr size by 1
    l->size++;

    return 0;
}

// int pushfront_int(list *l, void *item) {

// }

// int pushback_float(list *l, void *item) {

// }

// int pushfront_float(list *l, void *item) {

// }

// int pushback_char(list *l, void *item) {

// }

// int pushfront_char(list *l, void *item) {

// }

void *get_back(list *l) {
    if (l->size == 0)
        return NULL; // list is empty

    // offset data pointer by size of array
    return (l->data) + l->size - 1;
}

void *get_front(list *l) {
    if (l->size == 0)
        return NULL; // list is empty

    // get index 0, ie. first element
    return (l->data);
}

#ifdef BUILD_TEST
int main() {
	list l;
    init_list(&l, INT_TYPE);

    int a = 0;
    int *p;

    for (int i=0; i < 50; i++){
        a++;
        pushback_int(&l, (void *) &a);
        p = (int *) get_front(&l);
        printf("%d\n", *p);
    }

	return 0;
}
#endif