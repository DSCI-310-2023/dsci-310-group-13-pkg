youtube_col_names <- c("Video ID", "uploader", "age", 'category','length',
                       'views','rate','ratings','comments','related IDs')
# Load in May 5th 2007 data
table0007 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0007.txt", header = FALSE, sep = "\t", dec = ".")
table0107 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0107.txt", header = FALSE, sep = "\t", dec = ".")
table0207 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0207.txt", header = FALSE, sep = "\t", dec = ".")
table0307 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0307.txt", header = FALSE, sep = "\t", dec = ".")

# Load in May 4th 2008 data
table0008 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0008.txt", header = FALSE, sep = "\t", dec = ".")
table0108 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0108.txt", header = FALSE, sep = "\t", dec = ".")
table0208 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0208.txt", header = FALSE, sep = "\t", dec = ".")
table0308 <- read.delim("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0308.txt", header = FALSE, sep = "\t", dec = ".")


data2007_test <- bind_tables(table0007,table0107,table0207, table0307)
colnames(data2007_test) <- youtube_col_names

data2008_test <- bind_tables(table0008,table0108,table0208, table0308)
colnames(data2008_test) <- youtube_col_names


test_that("bind_tables() bind tables correctly", {
  testthat::expect_equal(nrow(data2007_test),
                         nrow(na.omit(table0007))+nrow(na.omit(table0107))+
                           nrow(na.omit(table0207)) + nrow(na.omit(table0307)))


  testthat::expect_equal(nrow(data2008_test),
                         nrow(na.omit(table0008))+ nrow(na.omit(table0108))+
                           nrow(na.omit(table0208)) + nrow(na.omit(table0308)))
})

rm(list = ls())


