test_that("parse-work", {
  expect_equal(parseSpec("stick", "red"), "stick:color=red")
})
