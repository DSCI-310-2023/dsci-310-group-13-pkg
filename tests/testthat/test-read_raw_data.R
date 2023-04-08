table0007 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0007.txt")
table0308 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0308.txt")

test_that("read_raw_data reads data correctly", {
  testthat::expect_equal(nrow(table0007), 227)
  testthat::expect_equal(ncol(table0007), 29)

  testthat::expect_equal(nrow(table0308), 58187)
  testthat::expect_equal(ncol(table0308), 29)

})

test_that("read_raw_data provides error message", {

  testthat::expect_error(read_raw_data(""),"Please provide a valid path_to_file of the data set in the data folder in the docker container or github page!")

  testthat::expect_error(read_raw_data("333"),"Please provide a valid path_to_file of the data set in the data folder in the docker container or github page!")


})

rm(list = ls())


