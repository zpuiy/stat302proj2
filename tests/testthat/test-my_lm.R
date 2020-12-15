test_that("my_lm works", {
  expect_is(my_lm(lifeExp ~ gdpPercap + continent, my_gapminder), "matrix")
  expect_is(my_lm(lifeExp ~ gdpPercap + continent, my_gapminder)[, 1], "numeric")
  expect_is(my_lm(lifeExp ~ gdpPercap + continent, my_gapminder)[, 2], "numeric")
  expect_is(my_lm(lifeExp ~ gdpPercap + continent, my_gapminder)[, 3], "numeric")
  expect_is(my_lm(lifeExp ~ gdpPercap + continent, my_gapminder)[, 4], "numeric")
})
