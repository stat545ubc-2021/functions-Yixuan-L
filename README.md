
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
devtools::install_github("https://github.com/stat545ubc-2021/functions-Yixuan-L.git")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/functions-Yixuan-L", ref = "v0.1.0")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
suppressPackageStartupMessages(library(newpkg))
summarize_stat(datateachr::apt_buildings, property_type, no_of_storeys)
```

You can preview the help file of function `summarize_stat` by:

``` r
?summarize_stat
```


