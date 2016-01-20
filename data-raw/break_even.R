library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "benchmark.R"))


N <- trunc(10 ** seq(1, 3.5, by = 0.02)) %>% unique %>% setNames(nm = .)
R <- (10 ** seq(-2, 0, by = 0.25)) %>% setNames(nm = .)

break_even <- .benchmark()

rextdata::use_extdata(break_even, overwrite = TRUE, compress = "xz")
