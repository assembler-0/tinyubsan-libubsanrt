TARGET ?= tinyubsan
SRC_DIRS ?= ./src
CC ?= gcc

SRCS := tests/test.c tinyubsan.c
OBJS := $(addsuffix .o,$(basename $(SRCS)))

CFLAGS ?= -ggdb -fsanitize=undefined,bounds,shift,alignment,null,vla-bound,object-size,return -Wall -Wextra -I. -O2 -fno-sanitize-recover=all
%.o: %.c
	@echo CC $<
	@$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)

	@echo LD $@
	@$(CC) $(OBJS) -o $@

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) 

