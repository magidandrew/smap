// implementation of the probability data structure
// WARNING: data does not get freed --> memory leaks galore
// NOTE: underlying probability buckets have 5 points of precision
//       --> this value is chosen to suit most needs and is used to have
//       --> proper rounding and so sum(probs) == 1.0
//       --> allows to thousandth percent: .001% or .00001

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "list.h"

#ifndef min
#define min(a,b)     (((a) < (b)) ? (a) : (b))
#endif

#ifndef prob_at
#define prob_at(prob, i)   *(double *) prob->probs.data[i]
#endif

#define PROB_PRECISION 5

typedef struct prob {
    list probs;
    list vals;
    int length;
} prob;

double precision(double num, int precision) {
    return floor(pow(10,precision)*num)/pow(10,precision);
}

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

    // store this in struct so easy to pull out later
    p->length = minlen;

    // zip and copy
    for (int i = 0; i < minlen; i++) {
        p->probs.data[i] = gprobs->data[i];
        p->vals.data[i] = gdata->data[i];
    }

    // seed rng
    srand48(time(NULL));

    return 0;
}

void normalize(prob *p) {

}

list *get_probs(prob *p) { return &p->probs; }

list *get_vals(prob *p) { return &p->vals; }

int get_length(prob *p) { return p->length; }

// returns a value based on the probability distribution
void *peek(prob *p) {
    // double *rnd = (double *) malloc(sizeof(double));

    double rnd = precision(drand48(), PROB_PRECISION);

    // printf("rnd: %f\n", rnd);

    // given: [.25, .5, .25]
    // intervals: -->edge case w/ 0 : [0, .25], (.25, .75], (.75, 1.0]
    // which interval is rnd in?

    for (int i = 0; i < p->length; i++) {
        double min_interval = 0;
        double max_interval = 0;

        // for min_interval
        for (int j=0; j < i; j++) {
            min_interval += prob_at(p, j);
        }

        // for max_interval
        for (int j=0; j < (i+1); j++) {
            max_interval += prob_at(p,j);
        }

        // printf("i=%d\n(%f, %f]\n\n", i, min_interval, max_interval);

        // edge case for i==0
        if (i==0) {
            if (rnd >= min_interval && rnd <= max_interval)
                return p->vals.data[i];
        }
        else{
            if (rnd > min_interval && rnd <= max_interval)
                return p->vals.data[i];
        }
    }

    return NULL;
}

#ifdef BUILD_TEST
int main() {
	list l1;
    init_list(&l1);
	list l2;
    init_list(&l2);

    prob prb;
    int a=5;
    int *p;
    double *d;

    puts("probabilities");

    d = (double *) malloc(sizeof(double));
    *d = .25;
    printf("pushing: %f\n", *d);
    push_back(&l1, (void *) d);

    d = (double *) malloc(sizeof(double));
    *d = .5;
    printf("pushing: %f\n", *d);
    push_back(&l1, (void *) d);

    d = (double *) malloc(sizeof(double));
    *d = .25;
    printf("pushing: %f\n", *d);
    push_back(&l1, (void *) d);

    puts("values");

    for (int i=0; i<3; i++) {
        p = (int *) malloc(sizeof(int));
        *p = a;
        printf("pushing: %d\n", *p);
        push_back(&l2, (void *) p);
        a++;
    }

    init_prob(&prb, &l1, &l2);
    // print_list_int(&prb.probs);
    // print_list_int(&prb.vals);

    int x; int y; int z;
    for(int i=0; i< 100000; i++) {
        int num = *(int *) peek(&prb);
        if (num == 5)
            x++;
        else if (num == 6)
            y++;
        else if (num == 7)
            z++;
    }
    printf("results: 5: %d // 6: %d // 7: %d\n", x, y, z);

    // printf("%d\n", *(int *) peek(&prb));

 	return 0;
}
#endif