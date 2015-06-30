library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "check.R"))


N <- 5:10 %>% setNames(nm = .)
R <- 1 %>% setNames(nm = .)

correctness <- .check()

devtools::use_data(correctness, overwrite = TRUE, compress = "xz")
