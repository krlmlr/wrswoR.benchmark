library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "benchmark.R"))


N <- trunc(10 ** seq(1.5, 6, by = 0.5)) %>% setNames(nm = .)
R <- c(0.01, 0.1, 1) %>% setNames(nm = .)

timings <- .benchmark()

rextdata::use_extdata(timings, overwrite = TRUE, compress = "xz")
