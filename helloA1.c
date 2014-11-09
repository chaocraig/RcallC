
#include <R.h>
#include <Rdefines.h>
#include <Rinternals.h>

#include <stdio.h>


SEXP helloA1() {
  printf("A1: Hello World!\n");
  return(R_NilValue);
}


