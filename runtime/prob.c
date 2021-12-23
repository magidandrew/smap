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
#include "prob.h"

double precision(double num, int precision) {
    return floor(pow(10,precision)*num)/pow(10,precision);
}

// return -1 on error
// return 0 on success
int init_prob(prob *p, list *gprobs, list *gdata) {
    // min len of both lists
    int minlen = min(gprobs->size, gdata->size);

    // malloc both arrays in prob --> these are copies
    p->probs.data = (char **) malloc(sizeof(char *) * minlen);
    if (p->probs.data == NULL)
        return -1;
    p->vals.data = (char **) malloc(sizeof(char *) * minlen);
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

    // check for negative values
    for (int i = 0; i < minlen; i++) {
        if (prob_at(p, i) < 0)
            return -1;
    }

    // normalize
    normalize(p);

    // seed rng
    srand48(time(NULL));

    return 0;
}

void normalize(prob *p) {
    // cannot normalize 0 vector
    if (check_nonzero(p) == 0)
        return;

    // calculate magnitude
    double sum = 0;
    for (int i=0; i < p->length; i++) {
        sum += prob_at(p, i);
    }

    // divide each element by sum and round
    for (int i=0; i< p->length; i++)
        prob_at(p, i) = precision(prob_at(p, i)/sum, PROB_PRECISION);

    // last element will be automatically calculated to ensure sum(n) == 1.0
    // WARNING: slight error is allowed
    double sum_of_probs = 0;
    for (int i=0; i < p->length-1; i++)
        sum_of_probs += prob_at(p, i);
    prob_at(p, (p->length - 1)) = (1.0 - sum_of_probs);
}

// checks that probability bucket vector is non-zero
// ret 0 if zero
// ret 1 if non-zero
int check_nonzero(prob *p) {
    for (int i = 0; i < p->length; i++) {
        if (prob_at(p, i) != 0)
            return 1;
    }
    return 0;
}

list *get_probs(prob *p) { return &p->probs; }

list *get_vals(prob *p) { return &p->vals; }

int get_length(prob *p) { return p->length; }

// returns a value based on the probability distribution
char *peek(prob *p) {
    // seed rng
    double rnd = precision(drand48(), PROB_PRECISION);

    #ifdef debug
    // printf("rnd: %f\n", rnd);
    #endif

    // given: [.25, .5, .25]
    // intervals: -->edge case w/ 0 : [0, .25], (.25, .75], (.75, 1.0]
    // which interval is rnd in?

    for (int i = 0; i < p->length; i++) {
        double min_interval = 0;
        double max_interval = 0;

        // for min_interval
        for (int j=0; j < i; j++)
            min_interval += prob_at(p, j);

        // for max_interval
        for (int j=0; j < (i+1); j++)
            max_interval += prob_at(p,j);

        #ifdef debug
        // printf("i=%d\n(%f, %f]\n\n", i, min_interval, max_interval);
        #endif

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

    // error
    fprintf(stderr, "probability peek error: no matching value found.\n");
    int val_0 = *(int*)p->vals.data[0];
    double probs_0 = *(double*)p->probs.data[0];
    fprintf(stderr, "Rand is %f. Length is %d. \nprobs[0] is %f. vals[0] is %d.",rnd,p->length, probs_0,val_0);
    return NULL;
}

int print_prob_int_debug(prob* p){
    printf("Prob's length is %d\n",p->length);
    for(int i =0;i<3;i++){
        printf("probs[%d] = %f\n",i, *(double*)p->probs.data[i]);
        printf("vals[%d] = %d\n",i, *(int*)p->vals.data[i]);
    }
    return 0;
}

// changes the probabilities of the target argument
void add_probs(prob *target, prob *p2) {
    int minlen = min(target->length, p2->length);
    for (int i = 0; i < minlen; i++)
        prob_at(target, i) = prob_at(target, i) + prob_at(p2, i);

    normalize(target);
}

// changes the probabilities of the target argument
void sub_probs(prob *target, prob *p2) {
    int minlen = min(target->length, p2->length);
    for (int i = 0; i < minlen; i++)
        prob_at(target, i) = prob_at(target, i) - prob_at(p2, i);

    normalize(target);
}

// changes the probabilities of the target argument
void times_probs(prob *target, prob *p2) {
    int minlen = min(target->length, p2->length);
    for (int i = 0; i < minlen; i++)
        prob_at(target, i) = prob_at(target, i) * prob_at(p2, i);

    normalize(target);
}

// changes the probabilities of the target argument
void div_probs(prob *target, prob *p2) {
    int minlen = min(target->length, p2->length);
    for (int i = 0; i < minlen; i++)
        prob_at(target, i) = prob_at(target, i) / prob_at(p2, i);

    normalize(target);
}

// TODO: return pointer to malloced list of the values that
// satisfy the condition
char *get_values_by_range(prob *p, int min, int max) {
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
    push_back(&l1, (char *) d);

    d = (double *) malloc(sizeof(double));
    *d = .5;
    printf("pushing: %f\n", *d);
    push_back(&l1, (char *) d);

    d = (double *) malloc(sizeof(double));
    *d = .25;
    printf("pushing: %f\n", *d);
    push_back(&l1, (char *) d);

    puts("values");

    for (int i=0; i<3; i++) {
        p = (int *) malloc(sizeof(int));
        *p = a;
        printf("pushing: %d\n", *p);
        push_back(&l2, (char *) p);
        a++;
    }

    init_prob(&prb, &l1, &l2);
    // print_list_int(&prb.probs);
    // print_list_int(&prb.vals);

    if(check_nonzero(&prb))
        printf("non zero!\n");

    int x; int y; int z;
    x = y = z = 0;
    for(int i=0; i< 100000; i++) {
        int num = *(int *) peek(&prb);
        if (num == 5)
            x++;
        else if (num == 6)
            y++;
        else if (num == 7)
            z++;
    }

    printf("probs: ");
    print_probs(&prb);

    printf("values: ");
    print_list_int(&prb.vals);

    printf("results: 5: %d // 6: %d // 7: %d\n", x, y, z);

    // printf("%d\n", *(int *) peek(&prb));

 	return 0;
}
#endif