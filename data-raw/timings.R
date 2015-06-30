library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "benchmark.R"))


N <- trunc(10 ** seq(1.5, 5, by = 0.5)) %>% setNames(nm = .)

timings <- .benchmark()

devtools::use_data(timings, overwrite = TRUE, compress = "xz")
