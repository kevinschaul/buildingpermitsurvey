test_that("by_county(2004)", {
  actual <- by_county(2004)

  expect_equal(names(actual), c('year', 'fips', 'name', 'total_units', 'units_1', 'units_2', 'units_3_4', 'units_5_more', 'units_rep_1', 'units_rep_2', 'units_rep_3_4', 'units_rep_5_more', 'value_1', 'value_2', 'value_3_4', 'value_5_more', 'value_rep_1', 'value_rep_2', 'value_rep_3_4', 'value_rep_5_more', 'buildings_1', 'buildings_2', 'buildings_3_4', 'buildings_5_more', 'buildings_rep_1', 'buildings_rep_2', 'buildings_rep_3_4', 'buildings_rep_5_more', 'survey_date', 'fips_state', 'fips_county', 'region_code', 'division_code'))
})
