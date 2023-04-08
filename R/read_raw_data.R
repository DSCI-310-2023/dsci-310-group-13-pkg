#' This function takes in a URL to where the file located in our Github page or
#' a path to the file saved locally  and read the data
#'
#' @param path_to_file The path_to_file to where the file is located
#'
#' @returns a data frame that contains raw data in the file
#' @export
#'
#' @examples
#' data0007 <- read_raw_data("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0007.txt")
#' data0107 <- read_raw_data("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0107.txt")
#' # data0107 <- read_raw_data("/home/rstudio/data/0107.txt")
#'

read_raw_data <- function(path_to_file){
  file_paths <- list("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0007.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0107.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0207.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0307.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0008.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0108.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0208.txt",
                     "https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0308.txt",
                     "/home/rstudio/data/0007.txt", "/home/rstudio/data/0107.txt",
                     "/home/rstudio/data/0207.txt", "/home/rstudio/data/0307.txt",
                     "/home/rstudio/data/0008.txt", "/home/rstudio/data/0108.txt",
                     "/home/rstudio/data/0208.txt", "/home/rstudio/data/0308.txt")
  if (!({{path_to_file}} %in% file_paths)) {
    stop("Please provide a valid path_to_file of the data set in the data folder in the docker container or github page!")

  }
  read.delim({{path_to_file}}, header = FALSE, sep = "\t", dec = ".")
}


