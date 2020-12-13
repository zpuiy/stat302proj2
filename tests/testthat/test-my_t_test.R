test_that("Assuming that given life expectancies are random, there is only a
          5% probability that the true mean of life expectancy is equal to 60.
          Therefore, I reject the null hypothesis that the true mean of life
          expectancy is equal to 60 and accept the hypothesis that the true mean
          of life expectancy is two-sided.", {
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "two.sided", 60)$p_val, "numeric")
})

test_that("Assuming that given life expectancies are random, there is only a
          5% probability that the true mean of life expectancy is equal to 60.
          Therefore, I reject the null hypothesis that the true mean of life
          expectancy is equal to 60 and accept the hypothesis that the true mean
          of life expectancy is less than 60.", {
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "less", 60)$p_val, "numeric")
})

test_that("Assuming that given life expectancies are random, there is only a
          5% probability that the true mean of life expectancy is equal to 60.
          Therefore, I reject the null hypothesis that the true mean of life
          expectancy is equal to 60 and accept the hypothesis that the true mean
          of life expectancy is greater than 60.", {
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60), "list")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$test_stat,
            "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$df, "numeric")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$alternative,
            "character")
  expect_is(my_t_test(my_gapminder$lifeExp, "greater", 60)$p_val, "numeric")
})
