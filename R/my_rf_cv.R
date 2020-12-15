#' Random Forest Cross-Validation Function
#'
#' This function predicts the `body_mass_g` of the penguins data using using
#' covariates `bill_length_mm`, `bill_depth_mm`, and `flipper_length_mm` in R.
#'
#' @param k Nnumber of folds.
#' @keywords prediction
#'
#' @return Numeric with the cross-validation error of \code{k}-fold
#' cross-validation.
#'
#' @examples
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k) {
  data <- na.omit(my_penguins)
  fold <- sample(rep(1:k, length = nrow(data)))
  data <- data %>% dplyr::mutate("split" = fold)
  mse <- rep(NA, k)
  for (i in 1:k) {
    data_train <- data %>% dplyr::filter(split != i)
    data_test <- data %>% dplyr::filter(split == i)
    model <- randomForest::randomForest(body_mass_g ~ bill_length_mm +
                                        bill_depth_mm + flipper_length_mm,
                                        data = data_train, ntree = 100)
    pred <- predict(model, data_test[, -1])
    mse[i] <- mean((data_test$body_mass_g - pred)^2)
  }
  return(mean(mse))
}
