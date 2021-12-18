#include <stdlib.h>
#include <stdio.h>
#include "list.h"

int init_list(list *l) {
    l->capacity = INITIAL_LIST_CAPACITY;
    l->size = 0;

    l->data = (char **) malloc(INITIAL_LIST_CAPACITY * sizeof(char *));
    if (!l->data)
        return -1; // failure

    return 0; // success
}

// checks if list is at capacity
// ret 1 if needs resizing, ret 0 if doesn't
int check_resizing(list *l) {
    if (l->size == l->capacity) {return 1;} else {return 0;}
}

// ret 1 if empty
// ret 0 if non-empty
int check_empty(list *l) {
    if (l->size == 0) {return 1;} else {return 0;}
}

// ret 0 if successful
// ret -1 on failure
int resize(list *l) {
    l->data = (char **) realloc(l->data, l->capacity * 2 * sizeof(char *));
    if (l->data == NULL)
        return -1;
    l->capacity *= 2;
    return 0;
}

void push_back(list *l, char *item) {
    if (check_resizing(l))
        resize(l);
    // set item
    l->data[l->size] = item;
    l->size++;
}

void push_front(list *l, char *item) {
    if (check_resizing(l))
        resize(l);

    // shift everything over by 1
    for (int i=l->size; i > 0; i--) {
        l->data[i] = l->data[i-1];
    }

    l->data[0] = item;
    l->size++;
}

// ret 0 on success
// ret -1 on failure
// WARNING: WILL CAUSE MEMORY LEAKS! DATA DOES NOT GET FREE'D
int del_back(list *l) {
    if (check_empty(l))
        return -1;

    l->size--;
    return 0;
}

// ret 0 on success
// ret -1 on failure
// WARNING: WILL CAUSE MEMORY LEAKS! DATA DOES NOT GET FREE'D
int del_front(list *l) {
    if (check_empty(l))
        return -1;

    // shift over data
    for (int i=0; i < (l->size - 1); i++)
        l->data[i] = l->data[i+1];

    l->size--;
    return 0;
}

// ret 0 on success
// ret -1 on failure
// WARNING: WILL CAUSE MEMORY LEAKS! DATA DOES NOT GET FREE'D
int del_at(list *l, int i) {
    if (check_empty(l))
        return -1;

    // shift over data
    for (int j=i; j < (l->size - 1); j++)
        l->data[j] = l->data[j+1];

    l->size--;
    return 0;
}

char *get_back(list *l) {
    if (l->size == 0)
        return NULL; // list is empty

    // offset data pointer by size of array
    return l->data[l->size - 1];
}

char *get_front(list *l) {
    if (l->size == 0)
        return NULL; // list is empty

    // get index 0, ie. first element
    return l->data[0];
}

char *get_at(list *l, int i) {
    if (check_empty(l))
        return NULL;

    // check if index is within bounds of array
    if (i < l->size && i >= 0)
        return NULL;

    return l->data[i];
}

void print_list_int(list *l) {
    printf("[");
    for (int i=0; i<l->size; i++)
        printf("%d, ", *(int *)l->data[i]);
    printf("]\n");
}

#ifdef BUILD_TEST
int main() {
	list l;
    init_list(&l);

    int a = 0;
    int *p = &a;

    for (int i=0; i<10; i++) {
        p = (int *) malloc(sizeof(int));
        *p = a;
        printf("pushing: %d\n", *p);
        push_back(&l, (char *) p);
        a++;
    }

    del_front(&l);
    del_front(&l);
    del_front(&l);
    printf("%d\n", *((int *) get_front(&l)));

	return 0;
}
#endif