#' Run time data
#'
#' Run times measured on an Intel(R) Xeon(R) CPU X5680 clocked at 3.33 GHz
#' with 12 MB cache, running RedHat Enterprise Linux, R 3.2.3 and gcc 4.8.5,
#' using version 0.4 of the \code{wrswoR} package.
#' The data are created by the corresponding scripts in the \code{data_raw}
#' directory.
#'
#' @details \code{timings} contains run times for a larger range of values
#'   for the \code{n} argument.
#'
#' @name timings
#' @export
#' @examples
#' head(timings)
NULL

#' @rdname timings
#'
#' @details \code{timings_sort} contains run times for sorting probabilities
#'   with the given distributions.
#'
#' @export
"timings_sort"

#' @details \code{break_even} contains detailed run times for the analysis of
#' break-even points between the various implementations.
#'
#' @format A data frame with 5 columns:
#'
#' \describe{
#'   \item{\code{prob}}{
#'     A description of the probability distribution used.
#'     See \code{data_raw/benchmark.R} for details.
#'   }
#'   \item{\code{expr}}{
#'     Function name without the \code{sample_int_} prefix.
#'   }
#'   \item{\code{time}}{
#'     Run time in nanoseconds, as measured by
#'     \code{\link[microbenchmark]{microbenchmark}}
#'   }
#'   \item{\code{r}}{
#'     Ratio between the \code{size} and \code{n} arguments.
#'   }
#'   \item{\code{n}}{
#'     The \code{n} argument.
#'   }
#' }
#'
#' @rdname timings
#' @name break_even
#' @export
#' @examples
#' head(break_even)
NULL
