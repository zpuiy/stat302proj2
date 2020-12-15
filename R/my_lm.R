#' Linear Model Function
#'
#' This function fits a linear model in R.
#'
#' @param formula A formula class object, similar to lm().
#' @param data input data frame.
#'
#' @return a `table` with rows for each coefficient (including the (`Intercept`)!)
#' and columns for the `Estimate`, `Std. Error`, `t value`, and `Pr(>|t|)`.
#'
#' @examples
#' data("mtcars")
#' my_lm(mpg ~ hp + wt, mtcars)
#'
#' @export
my_lm <- function(formula, data) {
  # extract the model matrix X
  x <- model.matrix(formula, data)
  # extract a model frame object
  frame <- model.frame(formula, data)
  # extract the model response Y
  y <- model.response(frame)
  # estimates, the estimate coefficients values
  estimates <- solve(t(x) %*% x) %*% t(x) %*% y
  # df, the degree of freedom
  df <- nrow(frame) - ncol(x)
  # variance, the estimate σ2
  variance <- sum((y - x %*% estimates) ^ 2 / df)
  # se, the the standard error for the coefficients
  se <- sqrt(diag(variance * solve(t(x) %*% x)))
  # test_stat, the test statistic for the coefficients
  test_stat <- (estimates - 0) / se
  # pr, the p-value of two-sided t test
  pr <- 2 * pt(abs(test_stat), df, lower.tail = FALSE)
  # result, initiate the result matrix
  result <- matrix(NA, nrow = nrow(estimates), ncol = 4)
  result[, 1] <- estimates
  result[, 2] <- se
  result[, 3] <- test_stat
  result[, 4] <- pr
  # Set the column names and row names for the result matrix
  colnames(result) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  rownames(result) <- rownames(estimates)
  # Transform the result matrix into table
  data.frame(result)
  return(result)
}
