#' This function combines all the raw data tables that contains raw data in one
#' year and remove all rows with NA in the table
#'
#' @param t1 The first raw data table to be combined
#' @param t2 The second raw data table to be combined
#' @param t3 The third raw data table to be combined
#' @param t4 The fourth raw data table to be combined
#'
#' @returns a data frame that contains all raw data in one year
#' @export
#'
#' @examples
#' # bind_tables(table0007,table0107,table0207, table0307)
#' # bind_tables(table0008,table0108,table0208, table0308)
#'
bind_tables <- function(t1, t2, t3, t4){
  rbind(t1, t2, t3, t4)|> na.omit()
}
