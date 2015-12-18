library(dplyr)

pkg <- devtools::as.package(".")

(r <- wrswoR.correctness::get_range())

p_values_7_list <- lapply(
  r$skew,
  function(skew) {
    wrswoR.correctness::p_values(n = 7, skew) %>%
      mutate(skew = global(skew))
  }
)

p_values_7 <- bind_rows(p_values_7_list) %>%
  select(n, skew, everything())

rextdata::use_extdata(p_values_7, overwrite = TRUE, compress = "xz")
