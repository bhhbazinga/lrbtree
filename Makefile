CC = gcc
CFLAGS = -g -O0 -Wall -pedantic
SHARED = -fPIC --shared
SO = lrbtree.so

all : $(SO)

$(SO) : rbtree.c lrbtree.c
	$(CC) $(CFLAGS) $(SHARED) -o $@ $^

run :
	lua test.lua

clean :
	rm *.so

.PHONY : clean run
