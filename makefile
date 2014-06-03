test : test.o test.c 
	gcc -o test test.o
	
test.o : test.c
	gcc -c test.c

clean :
	rm -rf *.o test
