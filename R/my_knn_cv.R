#' k-Nearest Neighbors Cross-Validation Function
#'
#' This function uses k-Nearest Neighbors Cross-Validation merhosa to predict
#' output class using other covariates in R.
#'
#' @param train An input data frame.
#' @param cl A true class value of your training data.
#' @param k_nn An integer representing the number of neighbors.
#' @param k_cv An integer representing the number of folds.
#' @keywords prediction
#'
#' @return A list with object:
#' `class`: A vector of the predicted class Ŷ i for all observation.
#' `cv_err`: A numeric with the cross-validation misclassification error.
#'
#' @examples
#' data("my_penguins")
#' mod_penguins <- my_penguins %>% na.omit()
#' species <- as.vector(mod_penguins$species)
#' input_penguins <- mod_penguins %>% dplyr::select(bill_length_mm, bill_depth_mm,
#'  flipper_length_mm, body_mass_g)
#' my_knn_cv(input_penguins, species, 1, 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv){
  fold <- sample(rep(1:k_cv, length = length(cl)))
  data <- data.frame("x" = train, "y" = cl, "split" = fold, "n" = 1:length(cl))
  cv_err <- rep(NA, k_cv)
  for (i in 1:k_cv) {
    train_df <- data %>% dplyr::filter(split != i)
    test_df <- data %>% dplyr::filter(split == i)
    pred <- class::knn(train_df[, 1:4], test_df[, 1:4], train_df$y, k = k_nn)
    cv_err[i] <- sum(as.numeric(as.character(pred) != test_df$y)) / nrow(test_df)
  }
  all_pred <- class::knn(train = train, test = train, cl, k = k_nn)
  return(list("class" = all_pred, "cv_err" = mean(cv_err)))
}
