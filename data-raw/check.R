set.seed(20150619L)

PROB <- list(uniform = function(n) rep(1, n),
             linear = seq_len,
             linear_double = . %>% seq_len %>% multiply_by(2) %>% add(-1),
             linear_half = . %>% seq_len %>% multiply_by(0.5) %>% add(0.5),
             exp = . %>% seq_len %>% raise_to_power(2, .),
             rexp = . %>% seq_len %>% raise_to_power(0.5, .)
            )
k <- 10000

.check <- function() {
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
              s <- trunc(n * r)
              plyr::ldply(
                setNames(nm = seq_len(k)),
                function(i) {
                  data.frame(
                    j=seq_len(s),
                    R=sample_int_R(n, s, prob),
                    ccrank=sample_int_crank(n, s, prob),
                    crank=sample_int_crank(n, s, prob),
                    rank=sample_int_rank(n, s, prob),
                    rej=sample_int_rej(n, s, prob),
                    R2=sample_int_R(n, s, prob)
                  )
                }) %>%
                dplyr::mutate(i = as.integer(.id), .id = NULL)
            }) %>%
            dplyr::mutate(r = as.numeric(.id), .id = NULL)
        }) %>%
        dplyr::mutate(n = as.integer(.id), .id = NULL)
    }) %>%
    dplyr::rename(prob = .id)
}
