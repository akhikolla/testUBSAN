#include <Rcpp.h>
using namespace std;

//' use after free 
//' 
//' @param size_free free size of the array 
//' @return index of array after freeing it
// [[Rcpp::export]]
int rcpp_use_after_free(int size_free){
  int *x =  (int *)malloc(sizeof(int)*size_free);    
  free(x);
  return x[10];
} 
  
