.PHONY: clean $(OBJ_DIR)

CC = gcc
CFLAGS = -Wall -g3 -ggdb -std=c99 -I./include
LDFLAGS += -L/usr/local/lib/ -lflint -lgmp -lmpfr

LDIR = lib
OBJ_DIR = obj
HEADERS_DIR = include
SRC_DIR = src

_SRC = $(shell find $(SRC_DIR)/* -name '*.c')
OBJECTS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(_SRC:.c=.o))
HEADERS = $(shell find $(HEADERS_DIR)/* -name '*.h')

all: test

test: $(OBJ_DIR) $(OBJECTS)
	$(CC) -o test $(OBJECTS) $(LDFLAGS)

library: $(OBJ_DIR) $(OBJECTS)
	ar rcs scarab.a $(OBJECTS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HEADERS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)/*.o test_suite obj
