#' Get BPS data by county
#'
#' @param year Survey year to get
#'
#' @export
by_county <- function(year) {
  if (year %in% 2000:2021) {
    by_county_2000_through_2021(year)
  }
}

#' @importFrom magrittr %>%
#' @importFrom rlang .data
by_county_2000_through_2021 <- function(year) {
  nms <- c('survey_date', 'fips_state', 'fips_county', 'region_code', 'division_code',
           'name', 'buildings_1', 'units_1', 'value_1', 'buildings_2',
           'units_2', 'value_2', 'buildings_3_4', 'units_3_4', 'value_3_4',
           'buildings_5_more', 'units_5_more', 'value_5_more',
           'buildings_rep_1', 'units_rep_1', 'value_rep_1', 'buildings_rep_2',
           'units_rep_2', 'value_rep_2', 'buildings_rep_3_4', 'units_rep_3_4',
           'value_rep_3_4', 'buildings_rep_5_more', 'units_rep_5_more',
           'value_rep_5_more')

  year2 <- stringr::str_sub(as.character(year), 3, 4)
  url <- paste0('https://www2.census.gov/econ/bps/County/co', year2, '12y.txt')
  raw <- readr::read_csv(url, skip=2, show_col_types=F, col_names=nms)

  clean <- raw %>%
    dplyr::mutate(
      fips = paste0(.data$fips_state, .data$fips_county),
      year = year,
      total_units = .data$units_1 + .data$units_2 + .data$units_3_4 + .data$units_5_more
    ) %>%
    dplyr::select(.data$year, .data$fips, .data$name, .data$total_units, tidyselect::starts_with('units'), tidyselect::starts_with('value'), tidyselect::starts_with('buildings'), tidyselect::everything())

  clean
}
