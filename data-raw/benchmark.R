set.seed(20150619L)

PROB <- setNames(nm = c("uniform", "linear", "exp"))
MIX <- setNames(nm = c("asc", "desc", "shuffle"))

.benchmark <- function() {
  plyr::ldply(
    N,
    function(n) {
      plyr::ldply(
        R,
        function(r) {
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
                  s <- as.integer(ceiling(n * r))
                  experiments <- list(
                    #ccrank=quote(sample_int_crank(n, s, prob)),
                    crank=quote(sample_int_crank(n, s, prob)),
                    rank=quote(sample_int_rank(n, s, prob)),
                    rej=quote(sample_int_rej(n, s, prob)),
                    expj=quote(sample_int_expj(n, s, prob)),
                    #expjs=quote(sample_int_expjs(n, s, prob)),
                    R=quote(sample_int_R(n, s, prob))
                  )
                  if (n * s >= 0.999e9) {
                    experiments[["R"]] <- NULL
                  }
                  if (n * s >= 0.999e10) {
                    experiments[["rej"]] <- NULL
                  }
                  print(list(time=Sys.time(), n=n, s=s, prob=prob_name, mix=mix_name, experiments=names(experiments)))
                  microbenchmark::microbenchmark(
                    list = experiments,
                    control = list(order = "block", warmup = 10)
                  )
                }) %>%
                dplyr::rename(mix = .id)
            }) %>%
          dplyr::rename(prob = .id)
      }) %>%
      dplyr::mutate(r = as.numeric(.id), .id = NULL)
  }) %>%
  dplyr::mutate(n = as.integer(.id), .id = NULL)
}
