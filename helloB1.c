

#include <R.h>
#include <Rdefines.h>
#include <Rinternals.h>

SEXP helloB1() {
  SEXP result;
  PROTECT(result = NEW_CHARACTER(1));
  SET_STRING_ELT(result, 0, mkChar("B1: Hello World!"));
  UNPROTECT(1);
  return(result);
}


