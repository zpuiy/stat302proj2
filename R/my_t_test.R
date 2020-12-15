#' T.test Function
#'
#' This function performs a one sample t-test in R.
#'
#' @param x A numeric vector of data.
#' @param alternative A character string specifying the alternative hypothesis.
#' This should only accept "two.sided", "less", or "greater". Otherwise, the
#' function should throw an informative error.
#' @param mu A number indicating the null hypothesis value of the mean.
#' @keywords inference
#'
#' @return A list with elements:
#' `test_stat`: The numeric test statistic.
#' `df`: The degrees of freedom.
#' `alternative`: The value of \code{alternative}.
#' `p_val`: The numeric p-value.
#'
#' @examples
#' set.seed(100)
#' my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0)
#' my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0)
#' my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0)
#'
#' @export
my_t_test <- function(x, alternative, mu) {
  # df, the degree of freedom
  df <- length(x) - 1
  # se, the standard error
  se <- sd(x) / sqrt(length(x))
  # test_stat, the numeric test statistic
  test_stat <- (mean(x) - mu) / se
  # p_val, the numeric p-value
  if (alternative == "two.sided") {
    p_val <- pt(test_stat, df, lower.tail = TRUE) + pt(abs(test_stat), df, lower.tail = FALSE)
  } else if (alternative == "less") {
    p_val <- pt(test_stat, df, lower.tail = TRUE)
  } else if (alternative == "greater") {
    p_val <- pt(test_stat, df, lower.tail = FALSE)
  } else {
    stop("Alternative value must be 'two.sided', 'less', or 'greater'.")
  }
  return(list("test_stat" = test_stat, "df" = df, "alternative" = alternative, "p_val" = p_val))
}
