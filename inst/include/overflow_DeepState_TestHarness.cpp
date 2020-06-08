#include <deepstate/DeepState.hpp>
#include <RInside.h>
#include <iostream>
#include <RcppDeepState.h>
#include <fstream>
int rcpp_overflow(int);

TEST(overflow_randomdatatypes,rcpp_overflow_test){

std::ofstream val_stream;
//int argc; 
 //char **argv; 
 RInside();
int val =RcppDeepState_int();
rcpp_overflow(val);
}



/*
// double d = 9223372036854775807L;
  //  int i = (int)d ;
try{
}
catch(Rcpp::exception& e){
std::cout<<"Exception Handled"<<std::endl;
}*/


