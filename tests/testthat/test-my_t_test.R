test_that("my_t_test works when alternatife is two.sided", {
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0), "list")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0)$test_stat,
            "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0)$df, "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0)$alternative,
            "character")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "two.sided", 0)$p_val, "numeric")
})

test_that("my_t_test works when alternatife is less", {
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0), "list")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0)$test_stat,
            "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0)$df, "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0)$alternative,
            "character")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "less", 0)$p_val, "numeric")
})

test_that("my_t_test works when alternatife is greater", {
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0), "list")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0)$test_stat,
            "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0)$df, "numeric")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0)$alternative,
            "character")
  expect_is(my_t_test(rnorm(100, mean = 0, sd = 1), "greater", 0)$p_val, "numeric")
})

test_that("unaccepted alternative input shows message", {
  expect_error(my_t_test(rnorm(100, mean = 0, sd = 1), 1, 0)$alternative,
                 "Alternative value must be 'two.sided', 'less', or 'greater'.")
})
