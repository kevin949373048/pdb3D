
library(testthat)

test_that("parse protein structure specs", {
  expect_equal(parseSpec("cartoon","green"), "cartoon:color=green")
  expect_equal(parseSpec("a","b"), "a:color=b")
})