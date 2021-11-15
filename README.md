
<!-- README.md is generated from README.Rmd. Please edit that file -->

# 

<!-- badges: start -->
<!-- badges: end -->

The goal of this package is to summarize statistics including mean,
minimum, maximum, standard deviation, median of a numeric column which
is grouped by a category in a dataset.

## Installation

You can install the released version of the package for function
`summarize_stat` from [CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("https://github.com/stat545ubc-2021/functions-Yixuan-L.git", ref = "0.1.0")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
suppressPackageStartupMessages(library(newpkg))
summarize_stat(datateachr::apt_buildings, property_type, no_of_storeys)
#> # A tibble: 3 × 6
#>   property_type  mean.col lowest.col highest.col std.col median.col
#>   <chr>             <dbl>      <dbl>       <dbl>   <dbl>      <dbl>
#> 1 PRIVATE            7.63          0          51    6.40          4
#> 2 SOCIAL HOUSING     6.58          3          22    3.79          5
#> 3 TCHC               9.55          3          41    5.93          8
```

You can preview the help file of function `summarize_stat` by:

``` r
?summarize_stat
```
