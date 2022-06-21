library(dplyr, warn.conflicts = FALSE)
library(readr)
library(stringr)
library(usethis)

by_msa <- function(year) {
  if (year %in% 2004:2014) {
    by_msa_2004_through_2014(year)
  }
}

by_msa_2004_through_2014 <- function(year) {
  url <- paste0('https://www.census.gov/construction/bps/txt/tb3u', year, '.txt')
  raw <- read_fwf(url, skip=11, show_col_types=F, fwf_cols(
    name=37,
    total_units=8,
    units_1=8,
    units_2=8,
    units_3_4=8,
    units_5_more=8,
    structures_units_5_more=8
  ), col_types=cols(
    name=col_character(),
    total_units=col_integer(),
    units_1=col_integer(),
    units_2=col_integer(),
    units_3_4=col_integer(),
    units_5_more=col_integer(),
    structures_units_5_more=col_integer()
  ))

  # Fix metro areas where names take up two rows
  # In these cases the values of the first row will be NA
  na_total_units <- raw %>%
    mutate(
      i = row_number()
    ) %>%
    filter(is.na(.data$total_units)) %>%
    pull(.data$i)

  clean <- raw %>%
    mutate(
      i = row_number(),
      name = if_else(
        lag(.data$i) %in% na_total_units,
        paste0(lag(.data$name), ' ', .data$name),
        .data$name
      ),
      year = year
    ) %>%
    filter(!is.na(.data$total_units)) %>%
    select(-.data$i)

  # TODO fixes for New York-Northern New Jersey-Long Island,* NY-NJ-PA,
  # Myrtle Beach-Conway-North Myrtle Beac
  # which run into the next column

  # Add note for metros with an asterisk
  clean <- clean %>%
    mutate(
      note = if_else(str_detect(.data$name, '\\*'), 'Metropolitan areas where all permit offices are
    requested to report monthly.', NA_character_),
      name = str_remove(.data$name, '\\*')
    ) %>%
    filter(!str_detect(.data$name, 'Metropolitan areas where all perm'))

  clean <- clean %>%
    select(year, name, everything())

  clean
}

bps_annual_by_msa <- bind_rows(lapply(2004:2014, by_msa))
write_csv(bps_annual_by_msa, 'data-raw/bps_annual_by_msa.csv')

use_data(bps_annual_by_msa, overwrite = TRUE)
