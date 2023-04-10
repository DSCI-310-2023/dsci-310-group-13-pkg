#' The function accepts the wrangled Youtube dataset of type dataframe and fits a linear regression
#' model to the data.
#'
#' @param traindata Typically a portion of the dataset that is used for training a regression model
#'
#' @returns a linear regression model with 'views' as the response variable and the chosen variables
#' as the explanatory variables
#' @export
#'
#' @examples
#' # fit_regression(training)


fit_regression <- function(traindata){
  stopifnot(is.data.frame(traindata))
  lm_spec <- parsnip::linear_reg() |> parsnip::set_engine('lm') |> parsnip::set_mode('regression')

  lm_recipe <- recipes::recipe(views~., data = traindata)

  lm_fit <- workflows::workflow() |> workflows::add_recipe(lm_recipe) |> workflows::add_model(lm_spec) |> generics::fit(data = traindata)

  lm_fit
}
