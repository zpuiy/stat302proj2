test_that("my_knn_cv works", {
  mod_penguins <- my_penguins %>% na.omit()
  input_penguins <- mod_penguins %>%
    dplyr::select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)
  expect_is(my_knn_cv(input_penguins, mod_penguins$species, 1, 5), "list")
  expect_is(my_knn_cv(input_penguins, mod_penguins$species, 1, 5)$class,
            "character")
  expect_is(my_knn_cv(input_penguins, mod_penguins$species, 1, 5)$cv_err,
            "numeric")
})
