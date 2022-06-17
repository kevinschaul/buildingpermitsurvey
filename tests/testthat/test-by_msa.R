test_that("by_msa(2004)", {
  actual <- by_msa(2004)

  expect_equal(names(actual), c('name', 'total_units', 'units_1', 'units_2', 'units_3_4', 'units_5_more', 'structures_units_5_more', 'note'))
})
