library(dplyr)

pkg <- devtools::as.package(".")

(r <- wrswoR.correctness::get_range_pairwise())

p_values_7 <-
  wrswoR.correctness::p_values_pairwise(n = 7) %>%
  select(n, skew, everything())

rextdata::use_extdata(p_values_7, overwrite = TRUE, compress = "xz")
