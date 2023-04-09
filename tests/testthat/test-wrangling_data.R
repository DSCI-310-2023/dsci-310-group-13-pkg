youtube_col_names <- c("Video ID", "uploader", "age", 'category','length',
                       'views','rate','ratings','comments','related IDs')
# Load in May 5th 2007 data
table0007 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0007.txt", header = FALSE, sep = "\t", dec = ".")
table0107 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0107.txt", header = FALSE, sep = "\t", dec = ".")
table0207 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0207.txt", header = FALSE, sep = "\t", dec = ".")
table0307 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0307.txt", header = FALSE, sep = "\t", dec = ".")

# Load in May 4th 2008 data
table0008 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0008.txt", header = FALSE, sep = "\t", dec = ".")
table0108 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0108.txt", header = FALSE, sep = "\t", dec = ".")
table0208 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0208.txt", header = FALSE, sep = "\t", dec = ".")
table0308 <- read.delim("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0308.txt", header = FALSE, sep = "\t", dec = ".")


data2007_test <- bind_tables(table0007,table0107,table0207, table0307)
colnames(data2007_test) <- youtube_col_names

data2008_test <- bind_tables(table0008,table0108,table0208, table0308)
colnames(data2008_test) <- youtube_col_names

data2007 = wrangling_data(data2007_test)
data2008 = wrangling_data(data2008_test)

test_that("wrangling_data() correctly filter out unwanted columns", {
  testthat::expect_equal(ncol(data2007), 7)
  testthat::expect_equal(ncol(data2008), 7)
})

test_that("wrangling_data() not changing wanted data", {
  # test expects that the age in the first and last row
  # of the wrangled data is the same
  testthat::expect_equal(dplyr::select(data2007, c('age'))[1,],
                         dplyr::select(data2007_test, c('age'))[1,])

  testthat::expect_equal(dplyr::select(data2007, c('age'))[62101,],
                         dplyr::select(data2007_test, c('age'))[62101,])

  # test expects that the comments in the first and last row
  # of the wrangled data is the same
  testthat::expect_equal(dplyr::select(data2008, c('comments'))[1,],
                         dplyr::select(data2008_test, c('comments'))[1,])

  testthat::expect_equal(dplyr::select(data2008, c('comments'))[62101,],
                         dplyr::select(data2008_test, c('comments'))[62101,])
})

test_that("wrangling_data() creates error message", {
  testthat::expect_error(wrangling_data(""), "Please have a valid dataframe as input!")
  testthat::expect_error(wrangling_data(7), "Please have a valid dataframe as input!")
})

rm(list = ls())
