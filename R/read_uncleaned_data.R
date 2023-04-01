#' This function takes in a path to where the uncleaned data file saved by load.R
#' located and read the data
#'
#' @param path_to_file The path to where the file is located
#'
#' @returns a data frame that contains uncleaned data saved by R/load.R
#' @export
#'
#' @examples
#' # read_raw_data("/home/rstudio/data/data2007_not_cleaned.txt")
#' # read_raw_data("/home/rstudio/data/data2008_not_cleaned.txt")
#'

read_uncleaned_data <- function(path_to_file){
  file_paths <- list("/home/rstudio/data/data2008_not_cleaned.txt",
                     "/home/rstudio/data/data2007_not_cleaned.txt",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/uncleaned_data_2007_function_test_only",
                     "https://raw.githubusercontent.com/chris-ckh/dsci-310-group-13/main/data/uncleaned_data_2008_function_test_only")
  if (!({{path_to_file}} %in% file_paths)) {
    stop("Please look at the data folder and provide a valid input!")
  }

  youtube_col_names <- c("Video ID", "uploader", "age", 'category','length',
                         'views','rate','ratings','comments','related IDs')

  result = read.delim({{path_to_file}}, sep = "\t", dec = ".", header = TRUE)
  colnames(result) <- youtube_col_names
  return(result)

}
