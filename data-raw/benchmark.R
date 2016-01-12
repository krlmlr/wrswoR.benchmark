set.seed(20150619L)

R <- c(0.01, 0.1, 1) %>% setNames(nm = .)
PROB <- list(uniform = function(n) rep(1, n),
             linear = seq_len,
             rev_linear = . %>% seq_len %>% rev,
             shuffled_linear = sample.int)

.benchmark <- function() {
  plyr::ldply(
    PROB,
    function(probf) {
      plyr::ldply(
        N,
        function(n) {
          prob <- probf(n)
          plyr::ldply(
            R,
            function(r) {
              s <- as.integer(ceiling(n * r))
              print(list(n=n, s=s, prob=summary(prob)))
              experiments <- list(
                ccrank=quote(sample_int_crank(n, s, prob)),
                crank=quote(sample_int_crank(n, s, prob)),
                rank=quote(sample_int_rank(n, s, prob)),
                rej=quote(sample_int_rej(n, s, prob)),
                expj=quote(sample_int_expj(n, s, prob)),
                expjs=quote(sample_int_expjs(n, s, prob)),
                R=quote(sample_int_R(n, s, prob)),
              )
              if (n * s >= 0.999e9) {
                experiments[["R"]] <- NULL
              }
              microbenchmark::microbenchmark(
                list = experiments,
                control = list(order = "block", warmup = 10)
              )
            }) %>%
            dplyr::mutate(r = as.numeric(.id), .id = NULL)
        }) %>%
        dplyr::mutate(n = as.integer(.id), .id = NULL)
    }) %>%
    dplyr::rename(prob = .id)
}
