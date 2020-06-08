R_HOME=/home/akhila/lib/R
COMMON_FLAGS= write_index_outofbound_DeepState_TestHarness.o  -I/home/akhila/R/RcppDeepState/inst/include/ -L/usr/lib/R/site-library/RInside/include/lib -Wl,-rpath=/usr/lib/R/site-library/RInside/include/lib -L${R_HOME}/lib -Wl,-rpath=${R_HOME}/lib -L/home/akhila/deepstate/src/lib -Wl,-rpath=/home/akhila/deepstate/src/lib -lR -lRInside -ldeepstate
write_index_outofbound_DeepState_TestHarness : write_index_outofbound_DeepState_TestHarness.o
	 clang++ -Wall -g -pedantic -o write_index_outofbound_DeepState_TestHarness ${COMMON_FLAGS} ~/R/testUBSAN/src/*.o
	./write_index_outofbound_DeepState_TestHarness --fuzz
write_index_outofbound_DeepState_TestHarness.o : write_index_outofbound_DeepState_TestHarness.cpp
	 clang++ -Wall -g -pedantic -I${R_HOME}/include -I/home/akhila/deepstate/src/include -I/usr/lib/R/site-library/Rcpp/include -I/usr/lib/R/site-library/RInside/include -I/home/akhila/R/RcppDeepState/inst/include/ write_index_outofbound_DeepState_TestHarness.cpp -o write_index_outofbound_DeepState_TestHarness.o -c