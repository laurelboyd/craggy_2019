library(testthat)
TOLERANCE = 0.0001
EXPECTED_MAX_YEAR <- 2018
EXPECTED_MIN_YEAR <- 2007

context("getting PIT for King County")

test_that("data set has the expected years", {
  pit <- get_king_pit()

  expect_equal(max(pit$year), EXPECTED_MAX_YEAR)
  expect_equal(min(pit$year), EXPECTED_MIN_YEAR)

  actual_n_rows = dim(pit)[1]
  expect_equal(actual_n_rows, EXPECTED_MAX_YEAR - EXPECTED_MIN_YEAR + 1)
})

