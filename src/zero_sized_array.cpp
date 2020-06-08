#include <Rcpp.h>
using namespace std;
//' zero sized array
//' 
//' @param vectorvalue value at index zero
//' @return ptr value at zero index
// [[Rcpp::export]]
int rcpp_zero_sized_array(int vectorvalue){
  int size = 0;
  int* ptr = new int[size]; 
   ptr[0] = vectorvalue;
   return ptr[0];
   
} 
  