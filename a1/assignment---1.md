Assignment-1
================
Yixuan Li(61261814)
03/11/2021

### Exercise 1&2: Make a function and document your function

#### Load packages

``` r
library(tibble)
library(dplyr)
library(tidyr)
library(datateachr)
library(testthat)
library(splitstackshape)
```

#### Function for summary statistics

I make a function to summarize statistics (mean, lowest, highest, std,
median) of a numeric column within a category column in a dataset.

``` r
#' @title Summary Statistics of a numeric column within a category column in a dataset
#' @description This function outputs mean, lowest value, highest value, std, median summary statistics for a numeric column grouped by a category. 
#' @params dataset, the dataset.
#' @params category, the category which can be divided into several types, and then we will summarize a numeric column grouped by this category.
#' @params column, the numeric column for computing summary statistics.
#' @return A tibble of the summary statistics.
 
Function1 <- function(dataset, category, column) {
# make sure the class of dataset should be dataframe
  if(!is.data.frame(dataset)) {
    stop("Error: type of dataset must be dataframe rather than:", class(dataset)[1], "please input again")}
# make sure the class of column should be numeric
  flg <- summarise(dataset, is.numeric({{ column }}))
  if (!flg[[1]]) {
     stop("Error: type of column must be numeric, please input again")}


result <- dataset %>%
# filter none values for column
  filter(!is.na({{ column }})) %>%
# group by category
  group_by({{ category }}) %>%
# summarize for mean, lowest, highest, std, median of column
  summarise(
    mean.col = mean({{ column }}, na.rm = TRUE),
    lowest.col = range({{ column }})[1],
    highest.col = range({{ column }})[2],
    std.col = sd({{ column }}, na.rm = TRUE),
    median.col = median({{ column }}, na.rm = TRUE)
  )
# print the result with tibble format
print(result)

 }
```

### Exercise 3: Include Examples

The original summary statistics code without using function. This code
is going to summarize `no_of_storeys` for each `property_type` of
`apt_buildings` dataset.

``` r
storeys_stat <- apt_buildings %>%
  filter(!is.na(no_of_storeys)) %>%
  group_by(property_type) %>%
  summarise(
    mean.storey = mean(no_of_storeys, na.rm = TRUE),
    lowest.storey = range(no_of_storeys)[1],
    highest.storey = range(no_of_storeys)[2],
    std.storey = sd(no_of_storeys, na.rm = TRUE),
    median.storey = median(no_of_storeys, na.rm = TRUE)
  )
print(storeys_stat)
```

    ## # A tibble: 3 × 6
    ##   property_type  mean.storey lowest.storey highest.storey std.storey
    ##   <chr>                <dbl>         <dbl>          <dbl>      <dbl>
    ## 1 PRIVATE               7.63             0             51       6.40
    ## 2 SOCIAL HOUSING        6.58             3             22       3.79
    ## 3 TCHC                  9.55             3             41       5.93
    ## # … with 1 more variable: median.storey <dbl>

Example: With the `Function1`, this code is going to print out the same
summary information as chunk3.

``` r
Function1(apt_buildings, property_type, no_of_storeys)
```

    ## # A tibble: 3 × 6
    ##   property_type  mean.col lowest.col highest.col std.col median.col
    ##   <chr>             <dbl>      <dbl>       <dbl>   <dbl>      <dbl>
    ## 1 PRIVATE            7.63          0          51    6.40          4
    ## 2 SOCIAL HOUSING     6.58          3          22    3.79          5
    ## 3 TCHC               9.55          3          41    5.93          8

Example: With the `Function1`, this code is going to print out the
summary information of `year_built` for different `air_conditioning`
types of `apt_buildings` dataset.

``` r
Function1(apt_buildings, air_conditioning, year_built)
```

    ## # A tibble: 4 × 6
    ##   air_conditioning mean.col lowest.col highest.col std.col median.col
    ##   <chr>               <dbl>      <dbl>       <dbl>   <dbl>      <dbl>
    ## 1 CENTRAL AIR         1988.       1928        2019    18.8      1989 
    ## 2 INDIVIDUAL UNITS    1963.       1888        2019    25.4      1965 
    ## 3 NONE                1960.       1805        2015    16.8      1960 
    ## 4 <NA>                1951.       1902        2019    20.1      1954.

Example: With the `Function1`, this code is going to print out the
summary information of `year_built` for different `window_type` types of
`apt_buildings` dataset.

``` r
Function1(apt_buildings, window_type, year_built)
```

    ## # A tibble: 4 × 6
    ##   window_type mean.col lowest.col highest.col std.col median.col
    ##   <chr>          <dbl>      <dbl>       <dbl>   <dbl>      <dbl>
    ## 1 DOUBLE PANE    1962.       1805        2019    18.8       1961
    ## 2 SINGLE PANE    1959.       1885        2006    18.1       1962
    ## 3 THERMAL        1968.       1900        2017    25.7       1966
    ## 4 <NA>           1995.       1929        2019    38.6       2018

### Exercise 4: Test the Function

Test1: If for parameter `dataset`, we input a parameter not in dataframe
type, it will throw an error.

``` r
test_that("Test 1", {
expect_error(Function1('apt_buildings', property_type, year_built)) })
```

    ## Test passed 🎉

Test2: If for parameter `column`, we input a parameter not in numeric
type, it will throw an error.

``` r
test_that("Test 2", {
expect_error(Function1(apt_buildings, property_type, air_conditioning)) })
```

    ## Test passed 🥳

Test3: Confirm whether the output format of the function is
dataframe(tibble).

``` r
test_that("Test 3", {
  Func <- Function1(apt_buildings, property_type, year_built)
  expect_true(is.data.frame(Func))
})
```

    ## # A tibble: 3 × 6
    ##   property_type  mean.col lowest.col highest.col std.col median.col
    ##   <chr>             <dbl>      <dbl>       <dbl>   <dbl>      <dbl>
    ## 1 PRIVATE           1959.       1805        2019    17.1       1960
    ## 2 SOCIAL HOUSING    1983.       1885        2019    23.3       1991
    ## 3 TCHC              1976.       1918        2018    15.2       1973
    ## Test passed 🥳
