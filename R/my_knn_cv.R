#' k-Nearest Neighbors Cross-Validation Function
#'
#' This function uses k-Nearest Neighbors Cross-Validation merhosa to predict
#' output class using other covariates in R.
#'
#' @param train An input data frame.
#' @param cl A true class value of your training data.
#' @param k_nn An integer representing the number of neighbors.
#' @param k_cv An integer representing the number of folds.
#'
#' @return a `list` with object:
#' `class` A vector of the predicted class Ŷ i for all observation.
#' `cv_err` A numeric with the cross-validation misclassification error.
#' `train_err` A numeric with the training error.
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
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  class <- c()
  cv_err <- rep(NA, k_cv)
  fold <- sample(rep(1:k_cv, length = nrow(train)))
  data <- cbind("cl" = cl, "split" = fold, train)
  t_class <- c()
  for (i in 1:k_cv) {
    data_train <- data %>% dplyr::filter(split != i)
    input_cl <- as.vector(data_train$cl)
    data_test <- data %>% dplyr::filter(split == i)
    true_cl <- as.vector(data_test$cl)
    t_class <- c(t_class, true_cl)
    data_test <- data_test[, -c(1:2)]
    data_train <- data_train[, -c(1:2)]
    pred <- class::knn(data_train, data_test, input_cl, k = k_nn, prob = FALSE)
    class <- c(class, as.vector(pred))
    cv_err[i] <- sum(as.numeric(pred != true_cl)^2) / length(true_cl)
  }
  cv_error <- mean(cv_err)
  train_err <- sum(as.numeric(t_class != class)^2) / nrow(train)
  return(list("class" = class, "cv_err" = cv_error, "train_err" = train_err))
}
