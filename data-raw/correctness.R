library(magrittr)
library(wrswoR)

pkg <- devtools::as.package(".")
source(file.path(pkg$path, "data-raw", "check.R"))


N <- 5 %>% setNames(nm = .)
R <- c(0.2, 0.4, 1) %>% setNames(nm = .)

correctness <- .check()

devtools::use_data(correctness, overwrite = TRUE, compress = "xz")
