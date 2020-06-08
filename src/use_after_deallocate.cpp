#include <Rcpp.h>
using namespace std;

//' use after deallocate
//' 
//' @param size of array 
//' @return index of array after deleting it
// [[Rcpp::export]]
int rcpp_use_after_deallocate(int size){
  char *x = new char[size];
  delete[] x;
  return x[5];
} 
  
