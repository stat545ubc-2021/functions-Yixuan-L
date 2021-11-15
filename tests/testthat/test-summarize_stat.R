#test 1
test_that("Class of 'dataset' should be dataframe", {
  expect_error(summarize_stat('apt_buildings', property_type, year_built)) })
#test 2
test_that("Class of 'column' should be numeric", {
  expect_error(summarize_stat(datateachr::apt_buildings, property_type, air_conditioning)) })
#test 3
test_that("Class of output should be dataframe", {
  Func <- summarize_stat(datateachr::apt_buildings, property_type, year_built)
  expect_true(is.data.frame(Func))
})
