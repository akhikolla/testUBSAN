library(testthat)
context("deepstate_compile_run")
library(testUBSAN)


path <- system.file("testpkgs/testSAN", package = "testUBSAN")
print(path)
res<-deepstate_pkg_create(path)
test_that("create files testSAN package", {
  expect_identical(res,"Testharness created!!")
})

files.list<-harness_files(path)
test_that("check for harness files existence testSAN package", {
  expect_true(file.exists(files.list[[1]]))
  expect_identical(files.list[[1]],system.file("testfiles/testSAN/read_out_of_bound_DeepState_TestHarness.cpp",package = "testUBSAN"))
  expect_true(file.exists(files.list[[2]]))
  expect_identical(files.list[[2]],system.file("testfiles/testSAN/use_after_deallocate_DeepState_TestHarness.cpp",package="testUBSAN"))
  expect_true(file.exists(files.list[[3]]))
  expect_identical(files.list[[3]],system.file("testfiles/testSAN/use_after_free_DeepState_TestHarness.cpp",package="testUBSAN"))
  expect_true(file.exists(files.list[[4]]))
  expect_identical(files.list[[4]],system.file("testfiles/testSAN/write_index_outofbound_DeepState_TestHarness.cpp",package="testUBSAN"))
  expect_true(file.exists(files.list[[5]]))
  expect_identical(files.list[[5]],system.file("testfiles/testSAN/zero_sized_array_DeepState_TestHarness.cpp",package="testUBSAN"))
})


test_that("check for harness files existence testSAN package", {
  expect_true(file.exists(files.list[[6]]))
  expect_identical(files.list[[6]],system.file("testfiles/testSAN/read_out_of_bound.Makefile",package = "testUBSAN"))
  expect_true(file.exists(files.list[[7]]))
  expect_identical(files.list[[7]],system.file("testfiles/testSAN/use_after_deallocate.Makefile",package="testUBSAN"))
  expect_true(file.exists(files.list[[8]]))
  expect_identical(files.list[[8]],system.file("testfiles/testSAN/use_after_free.Makefile",package="testUBSAN"))
  expect_true(file.exists(files.list[[9]]))
  expect_identical(files.list[[9]],system.file("testfiles/testSAN/write_index_outofbound.Makefile",package="testUBSAN"))
  expect_true(file.exists(files.list[[10]]))
  expect_identical(files.list[[10]],system.file("testfiles/testSAN/zero_sized_array.Makefile",package="testUBSAN"))
})

log_path <- system.file("include/read_out_of_bound_log", package = "testUBSAN")
print(log_path)
user.display <- user_error_display(log_path)
test_that("valgrind errors", {
  expect_match(user.display$arg.name,"sizeofarray")
  expect_match(user.display$src.file.lines,"read_out_of_bound.cpp")
  expect_match(user.display$error.message[1],"Invalid read of size 4")
  expect_match(user.display$error.message[2],"std::bad_array_new_length")
})


log_path <- system.file("include/use_after_deallocate_log", package = "testUBSAN")
print(log_path)
user.display <- user_error_display(log_path)
test_that("valgrind use after deallocate errors", {
  expect_match(user.display$arg.name,"size")
  expect_match(user.display$src.file.lines,"use_after_deallocate.cpp")
  expect_match(user.display$error.message[1],"Invalid read of size 1")
  
})

test_that("negative size array", {
  expect_lt(as.numeric(user.display$value[3]),0)
  #expect_match(user.display$error.message[3],"function has a fishy value")
})
log_path <- system.file("include/write_index_outofbound_log", package = "testUBSAN")
print(log_path)
user.display <- user_error_display(log_path)
test_that("valgrind writing index out of bound", {
  expect_match(user.display$arg.name,"boundvalue")
  #expect_match(user.display$src.file.lines,"write_index_outofbound.cpp")
  #expect_match(user.display$error.message[1],"Invalid read of size 4")
})

log_path <- system.file("include/zero_sized_array_log", package = "testUBSAN")
print(log_path)
user.display <- user_error_display(log_path)
test_that("valgrind writing index out of bound", {
  expect_match(user.display$arg.name,"vectorvalue")
  expect_match(user.display$src.file.lines,"zero_sized_array.cpp")
  expect_match(user.display$error.message[1],"Invalid write of size 4")
})


log_path <- system.file("include/use_after_free_log", package = "testUBSAN")
print(log_path)
user.display <- user_error_display(log_path)
test_that("valgrind use after free check", {
  expect_match(user.display$arg.name,"size_free")
  expect_match(user.display$src.file.lines,"use_after_free.cpp")
  expect_match(user.display$error.message[1],"Invalid read of size 4")
})


path <- system.file("testpkgs/testSAN", package = "testUBSAN")
dhc<-deep_harness_compile_run(path)
logfiles<-list_log_files(path)
test_that("check for log files existence testSAN package", {
  expect_true(file.exists(logfiles[[1]]))
  expect_identical(logfiles[[1]],system.file("testfiles/testSAN/read_out_of_bound_log",package = "testUBSAN"))
  expect_true(file.exists(logfiles[[2]]))
  expect_identical(logfiles[[2]],system.file("testfiles/testSAN/use_after_deallocate_log",package = "testUBSAN"))
  expect_true(file.exists(logfiles[[3]]))
  expect_identical(logfiles[[3]],system.file("testfiles/testSAN/use_after_free_log",package = "testUBSAN"))
  expect_true(file.exists(logfiles[[4]]))
  expect_identical(logfiles[[4]],system.file("testfiles/testSAN/write_index_outofbound_log",package = "testUBSAN"))
  expect_true(file.exists(logfiles[[5]]))
  expect_identical(logfiles[[5]],system.file("testfiles/testSAN/zero_sized_array_log",package = "testUBSAN"))
})
bin_dir<- list_bin_directory(path)
test_that("check for binary file directories existence testSAN package", {
  expect_true(dir.exists(bin_dir[[1]]))
  expect_identical(bin_dir[[1]],system.file("testfiles/testSAN/read_out_of_bound_output",package = "testUBSAN"))
  expect_true(dir.exists(bin_dir[[2]]))
  expect_identical(bin_dir[[2]],system.file("testfiles/testSAN/use_after_deallocate_output",package = "testUBSAN"))
  expect_true(dir.exists(bin_dir[[3]]))
  expect_identical(bin_dir[[3]],system.file("testfiles/testSAN/use_after_free_output",package = "testUBSAN"))
  expect_true(dir.exists(bin_dir[[4]]))
  expect_identical(bin_dir[[4]],system.file("testfiles/testSAN/write_index_outofbound_output",package = "testUBSAN"))
  expect_true(dir.exists(bin_dir[[5]]))
  expect_identical(bin_dir[[5]],system.file("testfiles/testSAN/zero_sized_array_output",package = "testUBSAN"))
  
})
