#include <Rcpp.h>
using namespace std;
//' write index outofbound
//' 
//' @param boundvalue value stored in index 
//' @return stack_array index greater than size
// [[Rcpp::export]]
int rcpp_write_index_outofbound(int boundvalue){
  int x = boundvalue; 
  int *stack_array = new int[100];
  stack_array[x+100] = boundvalue;
  return stack_array[x+100]; 

} 
