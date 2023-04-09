data2007 = read_uncleaned_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/datatable2007_uncleaned.txt")
data2007 = wrangling_data(data2007)

#Testing fit_regression()
# Selecting variables for reduced model
datareduced <- data2007 |>  select(c(views,age,ratings,comments))

# Split data into training and testing set
split <- rsample::initial_split(datareduced, prop = 3/4, strata = views)
train <- rsample::training(split)
test <- rsample::testing(split)

# Fit the regression model
lm_fit <- fit_regression(train)
# The results our model performed
lm_test_results <- lm_fit |> predict(test) |> bind_cols(test) |> yardstick::metrics(truth = views, estimate = .pred)

test_that("fit_regression expects error", {
  #test if parameter is a data frame
  testthat::expect_error(fit_regression(c(1:5)))
  testthat::expect_error(fit_regression("hello"))
})

test_that("if the model is formed properly", {
  # coefficients
  testthat::expect_equal(as.numeric(broom::tidy(lm_fit)$estimate[1]), as.numeric(lm(views~.,train)$coefficients[1]))
  # rmse
  testthat::expect_equal(lm_test_results$.estimate[1],
                         sqrt(mean((test$views - predict(lm_fit, test)$.pred)^2)))
})
