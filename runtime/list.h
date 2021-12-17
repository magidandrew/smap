#ifndef __LIST_H__
#define __LIST_H__

#include <stdio.h>

#define INITIAL_LIST_CAPACITY 10

typedef struct list{
    char **data;
    int capacity;
    int size;
} list;

int init_list(list *l);
int check_resizing(list *l);
int check_empty(list *l);
int resize(list *l);
void push_back(list *l, char *item);
void push_front(list *l, char *item);
char *get_back(list *l);
char *get_front(list *l);
int del_back(list *l);
int del_front(list *l);
int del_at(list *l, int i);
char *get_at(list*l, int i);

void print_list_int(list *l);

#endif