test_that("my_t_test works when alternatife is two.sided", {
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$p_val, "numeric")
})

test_that("my_t_test works when alternatife is less", {
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$p_val, "numeric")
})

test_that("my_t_test works when alternatife is greater", {
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$p_val, "numeric")
})
