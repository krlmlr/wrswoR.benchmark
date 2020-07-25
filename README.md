
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wrswoR.benchmark

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![R build
status](https://github.com/krlmlr/wrswoR.benchmark/workflows/rcc/badge.svg)](https://github.com/krlmlr/wrswoR.benchmark/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/wrswoR.benchmark)](https://CRAN.R-project.org/package=wrswoR.benchmark)
<!-- badges: end -->

The goal of wrswoR.benchmark is to provide benchmark data for
[{wrswoR}](https://github.com/krlmlr/wrswoR), a package with different
implementations of weighted random sampling without replacement.

## Installation

You can install the released version of wrswoR.benchmark from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("wrswoR.benchmark")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("krlmlr/wrswoR.benchmark")
```

## Example

The package contains several datasets, this is one of them:

``` r
library(wrswoR.benchmark)
timings
#> # A tibble: 107,100 x 6
#>    prob    mix   expr     time     r     n
#>    <chr>   <chr> <fct>   <dbl> <dbl> <int>
#>  1 uniform asc   crank 1596193  0.01    31
#>  2 uniform asc   crank    8557  0.01    31
#>  3 uniform asc   crank    6263  0.01    31
#>  4 uniform asc   crank    6159  0.01    31
#>  5 uniform asc   crank    5672  0.01    31
#>  6 uniform asc   crank    5900  0.01    31
#>  7 uniform asc   crank    5821  0.01    31
#>  8 uniform asc   crank    6128  0.01    31
#>  9 uniform asc   crank    5811  0.01    31
#> 10 uniform asc   crank    5745  0.01    31
#> # … with 107,090 more rows
```
