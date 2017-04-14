library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "benchmark_sort.R"))


N <- trunc(10 ** seq(1.5, 6, by = 0.5)) %>% setNames(nm = .)

timings_sort <- .benchmark_sort()

rextdata::use_extdata(timings_sort, overwrite = TRUE, compress = "xz")
