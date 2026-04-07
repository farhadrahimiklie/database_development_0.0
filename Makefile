CC      = gcc
CSTD    = c18
TARGET  = main
# -fsanitize=address,undefined -O0 \

# Directories
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj

CFLAGS  = -g -Wall -Wextra -Wpedantic -Werror \
		  -std=$(CSTD) -fstack-protector-strong \
		  -fno-omit-frame-pointer -march=native \
		  -Iinclude

# SRC     = $(wildcard *.c)
# OBJ     = $(SRC:.c=.o)

# Source and Object file
SRC     = $(wildcard src/*.c)
OBJ     = $(SRC:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(TARGET)
	rm -f $(OBJ)

# fix pattern rule for src/
src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)

run: $(TARGET)
	./$(TARGET)
