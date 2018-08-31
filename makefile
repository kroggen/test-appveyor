SHORT = main
EXEC = $(SHORT).exe

all: $(EXEC)

$(EXEC): $(SHORT).o
	gcc $^ -o $@
	strip $@

$(SHORT).o: $(SHORT).c
	gcc $(CFLAGS) -c $<

clean:
	rm -f *.o $(EXEC)
