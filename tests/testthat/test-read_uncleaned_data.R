##Test for read_uncleaned_data()

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


uncleaned_2007 <- read_uncleaned_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/uncleaned_data_2007_function_test_only")
uncleaned_2008 <- read_uncleaned_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/uncleaned_data_2008_function_test_only")

test_that("read_uncleaned_data works properly", {
  testthat::expect_equal(ncol(uncleaned_2007), ncol(data2007_test))
  testthat::expect_equal(ncol(uncleaned_2008), ncol(data2008_test))
  testthat::expect_equal(nrow(uncleaned_2007), nrow(data2007_test))
  testthat::expect_equal(nrow(uncleaned_2008), nrow(data2008_test))
})

test_that("read_uncleaned_data produce error message when not valid input", {
  testthat::expect_error(read_uncleaned_data(""),"Please look at the data folder and provide a valid input!")
  testthat::expect_error(read_uncleaned_data("/home/rstudio/data/0008.txt"),"Please look at the data folder and provide a valid input!")
})
