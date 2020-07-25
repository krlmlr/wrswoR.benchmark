#' Run time data
#'
#' Run times measured on an Intel(R) Xeon(R) CPU X5680 clocked at 3.33 GHz
#' with 12 MB cache, running RedHat Enterprise Linux, R 3.2.3 and gcc 4.8.5,
#' using version 0.4 of the `wrswoR` package.
#' The data are created by the corresponding scripts in the `data_raw`
#' directory.
#'
#' @details `timings` contains run times for a larger range of values
#'   for the `n` argument.
#'
#' @name timings
#' @export
#' @examples
#' head(timings)
NULL

#' @rdname timings
#'
#' @details `timings_sort` contains run times for sorting probabilities
#'   with the given distributions.
#'
#' @export
"timings_sort"

#' @details `break_even` contains detailed run times for the analysis of
#' break-even points between the various implementations.
#'
#' @format A data frame with 5 columns:
#'
#' \describe{
#'   \item{`prob`}{
#'     A description of the probability distribution used.
#'     See `data_raw/benchmark.R` for details.
#'   }
#'   \item{`expr`}{
#'     Function name without the `sample_int_` prefix.
#'   }
#'   \item{`time`}{
#'     Run time in nanoseconds, as measured by
#'     [microbenchmark::microbenchmark()]
#'   }
#'   \item{`r`}{
#'     Ratio between the `size` and `n` arguments.
#'   }
#'   \item{`n`}{
#'     The `n` argument.
#'   }
#' }
#'
#' @rdname timings
#' @name break_even
#' @export
#' @examples
#' head(break_even)
NULL
