#ifndef __LIST_H__
#define __LIST_H__

#include <stdio.h>

#define INITIAL_LIST_CAPACITY 10

typedef struct list{
    void **data;
    int capacity;
    int size;
} list;

int init_list(list *l);
int check_resizing(list *l);
int check_empty(list *l);
int resize(list *l);
void push_back(list *l, void *item);
void push_front(list *l, void *item);
void *get_back(list *l);
void *get_front(list *l);
int del_back(list *l);
int del_front(list *l);
int del_at(list *l, int i);
int get_at(list*l, int i);

void print_list_int(list *l);

#endif