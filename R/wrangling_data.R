#' This function takes in a YouTube Data that read from raw data and
#' Remove unnecessary data and convert category variable as factor class
#'
#' @param data The YouTube data frame that reads from raw file and requires
#' removing it's unnecessary data and converting it's category variable
#'
#' @returns a YouTube data frame that only contains "age", 'category',
#' 'length','views','rate','ratings','comments' as columns; If it is
#' not a data frame, an error message would be "Please input a valid
#' data frame!";
#'
#' @export
#'
#' @examples
#' # wrangling_data(data2007_test)
#' # wrangling_data(data2008_test)
#'
wrangling_data <- function(data) {
  if (!(is.list(data))){
    stop("Please have a valid dataframe as input!")
  }
  data|> dplyr::select(-c(1,2,10:29)) |> dplyr::mutate(category = as.factor(category))
}
