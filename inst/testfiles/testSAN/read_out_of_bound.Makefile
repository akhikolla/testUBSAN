R_HOME= /home/akhila/lib/R
 COMMON_FLAGS = /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.o -I/home/akhila/R/x86_64-pc-linux-gnu-library/3.6/RcppDeepState/include/deepstate -L/usr/lib/R/site-library/RInside/lib -Wl,-rpath=/usr/lib/R/site-library/RInside/lib -L${R_HOME}/lib -Wl,-rpath=${R_HOME}/lib -L -Wl,-rpath= -lR -lRInside -ldeepstate 

/home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness : /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.o 
	 clang++ -o /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness ${COMMON_FLAGS} /home/akhila/R/testUBSAN/inst/testpkgs/testSAN/src/*.o
	cd /home/akhila/R/testUBSAN/inst/testfiles/testSAN && ./read_out_of_bound_DeepState_TestHarness --fuzz 
 /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.o : /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.cpp
	clang++ -I${R_HOME}/include -I/usr/lib/R/site-library/Rcpp/include -I/usr/lib/R/site-library/RInside/include -I/home/akhila/R/x86_64-pc-linux-gnu-library/3.6/RcppDeepState/include /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.cpp -o /home/akhila/R/testUBSAN/inst/testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.o -c
