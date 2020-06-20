R_HOME= /home/akhila/lib/R
 COMMON_FLAGS = use_after_free_DeepState_TestHarness.o -I -L/usr/local/lib/R/site-library/RInside/lib -Wl,-rpath=/usr/local/lib/R/site-library/RInside/lib -L${R_HOME}/lib -Wl,-rpath=${R_HOME}/lib -L -Wl,-rpath= -lR -lRInside -ldeepstate 

use_after_free_DeepState_TestHarness : use_after_free_DeepState_TestHarness.o 
	 clang++ -o use_after_free_DeepState_TestHarness ${COMMON_FLAGS} /home/akhila/R/testUBSAN/inst/testpkgs/testSAN/src/*.o
	valgrind --tool=memcheck --leak-check=yes ./use_after_free_DeepState_TestHarness --fuzz --fuzz_save_passing --output_test_dir /home/akhila/R/testUBSAN/inst/testfiles/testSAN/use_after_free_output > /home/akhila/R/testUBSAN/inst/testfiles/testSAN/use_after_free_log 2>&1 
 use_after_free_DeepState_TestHarness.o : /home/akhila/R/x86_64-pc-linux-gnu-library/3.6/RcppDeepState/testfiles/testSAN/use_after_free_DeepState_TestHarness.cpp
	clang++ -I${R_HOME}/include -I/usr/local/lib/R/site-library/Rcpp/include -I/usr/local/lib/R/site-library/RInside/include -I/home/akhila/R/x86_64-pc-linux-gnu-library/3.6/RcppDeepState/include /home/akhila/R/x86_64-pc-linux-gnu-library/3.6/RcppDeepState/testfiles/testSAN/use_after_free_DeepState_TestHarness.cpp -o use_after_free_DeepState_TestHarness.o -c
