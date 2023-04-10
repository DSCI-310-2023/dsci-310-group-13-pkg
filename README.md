
<!-- README.md is generated from README.Rmd. Please edit that file -->

# youtubeFunction

<!-- badges: start -->

![](https://github.com/DSCI-310/dsci-310-group-13-pkg/actions/workflows/test-coverage.yaml/badge.svg)
[![codecov](https://codecov.io/gh/DSCI-310/dsci-310-group-13-pkg/branch/main/graph/badge.svg?token=akuR6bS6ic)](https://codecov.io/gh/DSCI-310/dsci-310-group-13-pkg)

<!-- badges: end -->

# youtubeFunction (1.0.0)

The goal of youtubeFunction is to build functions that are used for
DSCI-310 group 13 term project instead of using repetitive lines of
codes. The functions in this package are built on functions in other
packages, such as tidyverse, dplyr, parsnip, workflows, etc. These
functions have similar abilities as their built-on functions; however,
they have more specific functionalities, such as: reading specific data
from the container we built, cleaning the data in a specific way, and
fitting the model in a specific workflow. Therefore, this package may
not be practical other than in this project.

If you are interested at reading the vignettes for this package, you can
click
[here](https://dsci-310.github.io/dsci-310-group-13-pkg/articles/Intro_to_youtubeFunction.html).
The vignettes are very similar to the Usage section below, but with a
little bit more details on how the functions are used in the container.

### Functions included:

- `read_raw_data()`
- `bind_tables()`
- `read_uncleaned_data()`
- `wrangling_data()`
- `fit_regression()`

## Installation

You can install the development version of youtubeFunction from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DSCI-310/dsci-310-group-13-pkg")
```

## Usage

  

### read_raw_data()

The function read_raw_data() read the URL of specific data sets from our
project repository on
[Github](https://github.com/DSCI-310/dsci-310-group-13) or an absolute
path to the data files stored in our Docker container:

``` r
library(youtubeFunction)
## This example reads the raw data sets for 2007 YouTube data
table0007 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0007.txt")
table0107 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0107.txt")
table0207 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0207.txt")
table0307 <- read_raw_data("https://raw.githubusercontent.com/DSCI-310/dsci-310-group-13/main/data/0307.txt")
```

  

### bind_tables()

The function bind_tables() takes in four tables that contains Youtube
data for one year, binds them into one table, and omit the rows with NA:

``` r
library(youtubeFunction)
## This examples binds tables that contains YouTube data for 2007 into one table 
data2007_uncleaned <- bind_tables(table0007,table0107,table0207, table0307)

## change the column names of the dataset to meaningful ones
youtube_col_names <- c("Video ID", "uploader", "age", 'category','length',
                       'views','rate','ratings','comments','related IDs')
colnames(data2007_uncleaned) <- youtube_col_names

## show the first five rows of the raw data for 2007 with changed column names
head(data2007_uncleaned)
#>      Video ID        uploader age        category length   views rate ratings
#> 1 82-FJyniP7A     blahinsider 807   Entertainment     28 1393810 4.16    1397
#> 2 x30kYRp6Y68         oskar79 808 News & Politics    133  208383 3.47     318
#> 3 Gh9VeIjkuNY         jonghea 807  People & Blogs     28  135882 3.89      92
#> 4 ZcuiMTpIIw4          anwad1 807     Howto & DIY     41  153590 1.58    2074
#> 5 SqmlS_lvs8Q     maratontube 807          Sports     99   92520 2.32      78
#> 6 CbY9wnf7WlQ NiggaTubeDotCom 807   Entertainment     28  115085 3.73      84
#>   comments related IDs          NA          NA          NA          NA
#> 1     2888 fyatIukPXp0 lgTXaCfmnQc CUtLBzJr_xk 9pUPGc6QyiY 2YXpIlh5148
#> 2      769 BPYDOam_qec ZHFY0u4n-bw e99wLCb8qoA DwrZHZbuvsk QLhuVxrqvAY
#> 3      276 U_1mBp8NXuc 2YXpIlh5148 47-0qdkS5Qs x30kYRp6Y68 Dlzoq8ctCWc
#> 4     1230 3kwdEyAXd1s 85b1eI8UsDU uva8TAKMlBE EyrcxLu6ctg -XQu7jP1cDc
#> 5      155 OVm8xhnCLTU xIt__cWB_S0 58e7Rysge_Q 6FoX6ubW3wA SQEjNPZRrx4
#> 6      207 bjqTO5R3Drk 41hONevXuMY hhVhB4ylXMI 8bb5xsA1EYs yTDwxhK4I3w
#>            NA          NA          NA          NA          NA          NA
#> 1 heMz4hcGaWI UsFIDJqIAL8 TUVr5GmPY1c OwZFa2XbnYw XtImEoglFmI arhWMhIn4cY
#> 2 cdzbI1BRS-0 2uhlJ67YaIw qi4Yj1qwY6M fmmUV1z8n2s geFi5nq9nqM 5jXi32eCuCE
#> 3 lSpJNgi2l-g DWOzNjoQZbc Nom2z4HeAj0 dWfLsaF6KRw jI85JohIl3c tVNxinqJBgk
#> 4 1uBjnyflEy0 xATzaBPmD8w X1bPuU8WtLU JZDFtAm7mE0 6r3ABJ54Y68 5am8jSaap-s
#> 5 1GRJNOvW3K0 OjBy3b4ZaHI u2VxXrrUwOc Bjbg526sdeg UnNntSjgWHk LIfE7p3r9_g
#> 6 ZYuIYNaKynI Zt5-wn3fvlw 4ikH9ZRcF2Q 46wakJ8oggM RXVBoiSTqVw YiSFxDJQU48
#>            NA          NA          NA          NA          NA          NA
#> 1 Gh9VeIjkuNY TMd2cYS3sjs i7IRP9ZkyT0 k6KV_HfdayI 1Q8fvpcGyv4 p44ttd-T1nY
#> 2 gHzK4gvsmJs bBrqJp4bD1c R-yPX6IbgiU oYj6TceYio0 enwo1jWsxFE H3dkH34wHJs
#> 3 -dfJI_SL_cU geFi5nq9nqM uIsxOpufz3c kGOQQt_qZZA vfnY__WKPPk 1AgmFNnJT0U
#> 4 S9Sk46J8KHg 5v7Q2hYDaac X5-jxD-xGFM yiSArFW2p_c ISfaeQw9ReQ 3ZZHIP4X9uw
#> 5 bPM7ZXK_aas yu6-lR6vsZc nYxdA1A0cjQ eK_3KacnZ34 r2Yz-70cFVE _T_gh8YnTTY
#> 6 og2Nj6hFGF4 AFc3OWZWyxM qM6vzMpf-GI _ZOxaBW3Xn8 YyqEjatCSe0 lHSiqQpg7Uc
#>            NA          NA          NA
#> 1 dWfLsaF6KRw kGOQQt_qZZA uIsxOpufz3c
#> 2 8WsF5xF7YhU FpBoo0-GrKE PDn7tmsldg8
#> 3 hKVAQZo5Q18 ozvW5nNQQR0 hwap0gtiABQ
#> 4 LiOg5wJDUrM vRPyDDFcgno mf-gnYxeRRM
#> 5 KAlZkXI7Szg sPW-GaeaMZY eOg2hVp_zFc
#> 6 DVEnPIxJJYo hhfhgbmZe9s 3hWnA2dgE-M
```

  

### read_uncleaned_data()

The function read_uncleaned_data() takes in an absolute path to read a
saved out uncleaned data set from load.R, which reads in the raw data
tables, combines those tables based on the year the data belongs to, and
write out as txt files in the container, for example:

``` r
## This is an example of how read_uncleaned_data() is used in the container
## where "/home/rstudio/data/" is the path to where the uncleaned data is saved in the container

## data2007_uncleaned <- youtubeFunction::read_uncleaned_data("/home/rstudio/data/data2007_not_cleaned.txt")
```

  

### wrangling_data()

The function wrangling_data() takes in an uncleaned youtube data set and
tidies it so that the data set only contains “age”, “category”,
“length”, “views”, “rate”, “ratings”, “comments” as columns. For
instance:

``` r
## This is an example of using wrangling_data() to tidy up the 
## uncleaned YouTube data for 2007
data2007 <- youtubeFunction::wrangling_data(data2007_uncleaned)
head(data2007)
#>   age        category length   views rate ratings comments
#> 1 807   Entertainment     28 1393810 4.16    1397     2888
#> 2 808 News & Politics    133  208383 3.47     318      769
#> 3 807  People & Blogs     28  135882 3.89      92      276
#> 4 807     Howto & DIY     41  153590 1.58    2074     1230
#> 5 807          Sports     99   92520 2.32      78      155
#> 6 807   Entertainment     28  115085 3.73      84      207
```

  

### fit_regression()

The following R chunk prepossesses the data set and splits the data into
train data and test data, where the train data is used to fit the model
used for our prediction.

``` r
datareduced <- data2007 |>  select(c(views,age,ratings,comments))
split <- rsample::initial_split(datareduced, prop = 3/4, strata = views)
train <- rsample::training(split)
test <- rsample::testing(split)
```

The function fit_regression() takes in the training data and fits a
simple linear regression to chosen columns with the response variable
`views`.

``` r
lm_fit <- fit_regression(train)
lm_fit 
#> ══ Workflow [trained] ══════════════════════════════════════════════════════════
#> Preprocessor: Recipe
#> Model: linear_reg()
#> 
#> ── Preprocessor ────────────────────────────────────────────────────────────────
#> 0 Recipe Steps
#> 
#> ── Model ───────────────────────────────────────────────────────────────────────
#> 
#> Call:
#> stats::lm(formula = ..y ~ ., data = data)
#> 
#> Coefficients:
#> (Intercept)          age      ratings     comments  
#>    14504.44       -18.33       277.89       -47.33
```
