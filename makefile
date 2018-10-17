SHORT = main
EXEC = $(SHORT).exe

all: $(EXEC)

$(EXEC): $(SHORT).o
	gcc $^ -o $@
	strip $@

$(SHORT).o: $(SHORT).c
	gcc $(CFLAGS) -c $<

test:
	mkdir temp && cd temp && easy_install lmdb
	python test-lmdb.py

clean:
	rm -f *.o $(EXEC)
