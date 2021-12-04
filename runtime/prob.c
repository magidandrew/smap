#include <stdio.h>
#include <stdlib.h>
#include "list.h"

#ifndef min
#define min(a,b)     (((a) < (b)) ? (a) : (b))
#endif

typedef struct prob {
    list probs;
    list vals;
} prob;

int init_prob(prob *p, list *gprobs, list *gdata) {
    // min len of both lists
    int minlen = min(gprobs->size, gdata->size);

    // malloc both arrays in prob --> these are copies
    p->probs.data = (void **) malloc(sizeof(void **) * minlen);
    if (p->probs.data == NULL)
        return -1;
    p->vals.data = (void **) malloc(sizeof(void **) * minlen);
    if (p->vals.data == NULL)
        return -1;
    // set size and capacity to minlen
    p->probs.size = minlen; p->vals.size = minlen;
    p->probs.capacity = minlen; p->vals.capacity = minlen;

    // copy info over
    for (int i = 0; i < minlen; i++) {
        p->probs.data[i] = gprobs->data[i];
        p->vals.data[i] = gdata->data[i];
    }

    return 0;
}

void normalize(prob *p) {

}

list *get_probs(prob *p) {
    return &p->probs;
}

list *get_vals(prob *p) {
    return &p->vals;
}

// returns a value based on the probability distribution
void *peek() {

}

#ifdef BUILD_TEST
int main() {
	list l1;
    init_list(&l1);
	list l2;
    init_list(&l2);

    prob prb;
    // init_prob(&prb);

    int a = 0;
    int *p;

    for (int i=0; i<2; i++) {
        p = (int *) malloc(sizeof(int));
        *p = a;
        printf("pushing: %d\n", *p);
        push_back(&l1, (void *) p);
        a++;
    }

    puts("2nd arr");

    for (int i=5; i<12; i++) {
        p = (int *) malloc(sizeof(int));
        *p = a;
        printf("pushing: %d\n", *p);
        push_back(&l2, (void *) p);
        a++;
    }

    init_prob(&prb, &l1, &l2);
    print_list(&prb.probs);
    print_list(&prb.vals);

 	return 0;
}
#endif