test_that("my_knn_cv works", {
  mod_penguins <- my_penguins %>% na.omit()
  input_penguins <- mod_penguins %>%
    dplyr::select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)
  result <- my_knn_cv(input_penguins, mod_penguins$species, 1, 5)
  expect_is(result, "list")
  expect_is(result$class, "factor")
  expect_is(result$cv_err, "numeric")
})
