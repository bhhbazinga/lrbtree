CC = gcc
CFLAGS = -c -g3 -Wall -pedantic -fPIC
SOFILE = lrbtree.so

all : $(SOFILE)

$(SOFILE) : rbtree.o lrbtree.o
	$(CC) -o $@ $^ --shared -dynamiclib -Wl,-undefined,dynamic_lookup

rbtree.o : rbtree.c rbtree.h
	$(CC) -o $@ $(CFLAGS) $<

lrbtree.o : lrbtree.c rbtree.h
	$(CC) -o $@ $(CFLAGS) $<

run :
	lua test.lua

clean :
	rm -f *.o *.so

.PHONY : clean run
