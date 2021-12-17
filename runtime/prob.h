#ifndef __PROB_H__
#define __PROB_H__

#include "list.h"

typedef struct prob {
    list probs;
    list vals;
    int length;
} prob;

#ifndef min
#define min(a,b)     (((a) < (b)) ? (a) : (b))
#endif

#ifndef prob_at
#define prob_at(prb, i)   *(double *) prb->probs.data[i]
#endif

#define PROB_PRECISION 5

double precision(double num, int precision);
int init_prob(prob *p, list *gprobs, list *gdata);
void normalize(prob *p);
int check_nonzero(prob *p);
list *get_probs(prob *p);
list *get_vals(prob *p);
int get_length(prob *p);
char *peek(prob *p);

// transformations
void add_probs(prob *target, prob *p2);
void sub_probs(prob *target, prob *p2);
void times_probs(prob *target, prob *p2);
void div_probs(prob *target, prob *p2);

void print_probs(prob *p) {
    printf("[");
    for (int i=0; i<p->length; i++)
        printf("%f, ", prob_at(p, i));
    printf("]\n");
}

#endif