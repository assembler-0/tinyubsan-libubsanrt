TARGET ?= tinyubsan
SRC_DIRS ?= ./src
CC = gcc

SRCS := tests/test.c
OBJS := $(addsuffix .o,$(basename $(SRCS)))

CFLAGS ?= -ggdb -fsanitize=undefined -Wall -Wextra -Wno-builtin-declaration-mismatch -I.
%.o: %.c
	@echo CC $<
	@$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)

	@echo LD $@
	@$(CC) $(OBJS) -o $@

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) 

