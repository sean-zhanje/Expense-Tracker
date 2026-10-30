CC      ?= cc
CFLAGS  = -Wall -Wextra -std=c99 -g
OBJS    = main.o input.o storage.o budget.o modes.o
HEADERS = $(wildcard *.h)

expense_tracker: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(OBJS) expense_tracker

run: expense_tracker
	./expense_tracker

.PHONY: clean run
