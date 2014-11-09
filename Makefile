all: helloA helloB.so helloC.so helloA1.so  helloB1.so  helloC1.so


helloA:
	cc     helloA.c   -o helloA

helloB.so:
	R CMD SHLIB helloB.c


helloC.so:
	R CMD SHLIB helloC.c


helloA1.so:
	R CMD SHLIB helloA1.c

helloB1.so:
	R CMD SHLIB helloB1.c

helloC1.so:
	R CMD SHLIB helloC1.c

clean:
	rm helloA helloB.o helloB.so helloC.o helloC.so

