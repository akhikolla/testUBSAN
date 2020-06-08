#include <Rcpp.h>
using namespace std;
//' read out of bound
//' 
//' @param sizeofarray gives size of array 
//' @return index of array out of bound
// [[Rcpp::export]]
int rcpp_read_out_of_bound(int sizeofarray){
  int *stack_array = new int[sizeofarray];
  return stack_array[sizeofarray+100];
  	
} 
  
