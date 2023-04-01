#' This function takes in a url to where the file located and read the data
#'
#' @param url The URL to where the file is located
#'
#' @returns a data frame that contains raw data in the file
#' @export
#'
#' @examples
#' data0007 <- read_raw_data("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0007.txt")
#' data0107 <- read_raw_data("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0107.txt")
#'

read_raw_data <- function(url){
  file_paths <- list("https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0007.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0107.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0207.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0307.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0008.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0108.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0208.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/0308.txt")
  if (!({{url}} %in% file_paths)) {
    stop("Please provide a valid url of the data set in the data folder in the github page!")

  }
  read.delim({{url}}, header = FALSE, sep = "\t", dec = ".")
}


