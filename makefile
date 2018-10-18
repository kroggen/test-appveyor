SHORT = main
EXEC = $(SHORT).exe

all: $(EXEC)

$(EXEC): $(SHORT).o
	gcc $^ -o $@
	strip $@

$(SHORT).o: $(SHORT).c
	gcc $(CFLAGS) -c $<

test:
	python -mpip install lmdb
	python test-lmdb.py

clean:
	rm -f *.o $(EXEC)
