context("plot_explainer")

source("objects_for_tests.R")

test_that("Output", {
  expect_is(plot(x=surve_cph), "ggsurvplot")
})
