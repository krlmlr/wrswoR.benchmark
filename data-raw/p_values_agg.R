library(dplyr)
library(ggplot2)

pkg <- devtools::as.package(".")

(r <- wrswoR.correctness::get_range_pairwise())
#(r <- wrswoR.correctness::get_range())

r_df <- do.call(expand.grid, r)


# r_df <-
#   r_df %>%
#   filter(n <= 40)

p_values_all <- r_df %>%
  rowwise() %>%
  do({
    #wrswoR.correctness::p_values(n = .$n, skew = .$skew)
    wrswoR.correctness::p_values_pairwise(n = .$n)
  }) %>%
  ungroup

p_values_unskewed <-
  p_values_all %>%
  ungroup %>%
  select(n, N, p_value, warnings, skew, func) %>%
  mutate(p_value = ifelse(is.na(p_value), 1, p_value)) %>%
  filter(is.na(warnings)) %>%
  select(-warnings) %>%
  mutate(p_value = pmax(p_value, .Machine$double.xmin))

r_N_df <- expand.grid(n = r_df$n, N = unique(p_values_unskewed$N))

meta_p_values <- p_values_unskewed %>%
  group_by(n, N, func, skew) %>%
  do({
    p_value <- metap::sumlog(.$p_value)$p
    data_frame(p_value = p_value)
  })

rextdata::use_extdata(p_values_agg, compress = "xz", overwrite = TRUE)

# meta_growing_n %>%
#   filter(skew == 1 & func != "R") %>%
#   ggplot(aes(x=factor(N), y=n, fill=p_value)) +
#   geom_tile() +
#   facet_wrap(~func)
#
# meta_growing_n %>%
#   filter(func == "R") %>%
#   ggplot(aes(x=factor(N), y=n, fill=p_value)) +
#   geom_tile() +
#   facet_wrap(~skew, ncol = 2)
