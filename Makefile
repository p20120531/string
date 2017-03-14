CC = g++
CFLAGS = -g3
all: main.o kaluzaMgrRead.o kaluzaMgrDG.o pt.o ptnode.o dg.o dgnode.o utility.o autopMgr.o aut.o
	$(CC) $(CFLAGS) main.o kaluzaMgrRead.o kaluzaMgrDG.o pt.o ptnode.o dg.o dgnode.o utility.o autopMgr.o aut.o -o smt2dg
main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp -c
kaluzaMgrRead.o: kaluzaMgrRead.cpp
	$(CC) $(CFLAGS) kaluzaMgrRead.cpp -c
kaluzaMgrDG.o: kaluzaMgrDG.cpp
	$(CC) $(CFLAGS) kaluzaMgrDG.cpp -c
pt.o: pt.cpp
	$(CC) $(CFLAGS) pt.cpp -c
ptnode.o: ptnode.cpp
	$(CC) $(CFLAGS) ptnode.cpp -c
dg.o: dg.cpp
	$(CC) $(CFLAGS) dg.cpp -c
dgnode.o: dgnode.cpp
	$(CC) $(CFLAGS) dgnode.cpp -c
utility.o: utility.cpp
	$(CC) $(CFLAGS) utility.cpp -c
autopMgr.o: autopMgr.cpp
	$(CC) $(CFLAGS) autopMgr.cpp -c
aut.o: aut.cpp
	$(CC) $(CFLAGS) aut.cpp -c
clean:
	rm *.o smt2dg
