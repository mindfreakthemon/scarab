CC = gcc
CFLAGS = -Wall -g3 -ggdb -std=c99 -I./include
LDFLAGS += -lgmp -lflint

LDIR = lib
OBJ_DIR = obj
HEADERS_DIR = include
SRC_DIR = src

_SRC = $(shell find $(SRC_DIR)/* -name '*.c')
OBJECTS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(_SRC:.c=.o))
HEADERS = $(shell find $(HEADERS_DIR)/* -name '*.h')

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

test: $(OBJECTS)
	$(CC) -o test $^ $(LDFLAGS)
	./test

library: $(OBJECTS)
	ar rcs scarab.a $(OBJECTS)

all: test
	clean

.PHONY: clean
clean:
	rm -f $(OBJ_DIR)/*.o test_suite

