LDFLAGS = `pkg-config --libs libuv`

main: src/main.c
	$(CC) -o main src/main.c $(LDFLAGS)
clean:
	rm -f main
