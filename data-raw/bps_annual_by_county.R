library(dplyr, warn.conflicts = FALSE)
library(readr)
library(stringr)
library(usethis)

by_county <- function(year) {
  if (year %in% 2000:2021) {
    by_county_2000_through_2021(year)
  }
}

by_county_2000_through_2021 <- function(year) {
  nms <- c('survey_date', 'fips_state', 'fips_county', 'region_code', 'division_code',
           'name', 'buildings_1', 'units_1', 'value_1', 'buildings_2',
           'units_2', 'value_2', 'buildings_3_4', 'units_3_4', 'value_3_4',
           'buildings_5_more', 'units_5_more', 'value_5_more',
           'buildings_rep_1', 'units_rep_1', 'value_rep_1', 'buildings_rep_2',
           'units_rep_2', 'value_rep_2', 'buildings_rep_3_4', 'units_rep_3_4',
           'value_rep_3_4', 'buildings_rep_5_more', 'units_rep_5_more',
           'value_rep_5_more')

  year2 <- str_sub(as.character(year), 3, 4)
  url <- paste0('https://www2.census.gov/econ/bps/County/co', year2, '12y.txt')
  raw <- read_csv(url, skip=2, show_col_types=F, col_names=nms)

  clean <- raw %>%
    mutate(
      fips = paste0(fips_state, fips_county),
      year = year,
      total_units = units_1 + units_2 + units_3_4 + units_5_more
    ) %>%
    select(year, fips, name, total_units, tidyselect::starts_with('units'), tidyselect::starts_with('value'), tidyselect::starts_with('buildings'), tidyselect::everything())

  clean
}

bps_annual_by_county <- bind_rows(lapply(2000:2021, by_county))
write_csv(bps_annual_by_county, 'data-raw/bps_annual_by_county.csv')

use_data(bps_annual_by_county, overwrite = TRUE)
