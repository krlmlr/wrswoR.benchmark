set.seed(20150619L)

PROB <- setNames(nm = c("uniform", "linear", "exp"))
MIX <- setNames(nm = c("asc", "desc", "shuffle"))

.benchmark_sort <- function() {
  plyr::ldply(
    N,
    function(n) {
      plyr::ldply(
        PROB,
        function(prob_name) {
          MY_MIX <- MIX
          if (prob_name == "uniform") MY_MIX <- MIX[1L]
          plyr::ldply(
            MY_MIX,
            function(mix_name) {
              alpha <- 1.0007
              #alpha <- 10 ** (300 / n)
              prob <- wrswoR.sample::mix()[[mix_name]](wrswoR.sample::prob(alpha)[[prob_name]](n))
              experiments <- list(
                sort_shell = quote(sort.int(prob, method = "shell", decreasing = TRUE)),
                sort_quick = quote(sort.int(prob, method = "quick", decreasing = TRUE)),
                sort_radix = quote(sort.int(prob, method = "radix", decreasing = TRUE))
              )
              print(list(time=Sys.time(), n=n, prob=prob_name, mix=mix_name, experiments=names(experiments)))
              microbenchmark::microbenchmark(
                list = experiments,
                control = list(order = "block", warmup = 10)
              )
            }) %>%
            dplyr::rename(mix = .id)
        }) %>%
      dplyr::rename(prob = .id)
  }) %>%
  dplyr::mutate(n = as.integer(.id), .id = NULL)
}
