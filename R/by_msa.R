#' Get BPS data by metropolitan statistical area
#'
#' @param year
#'
#' @export
by_msa <- function(year) {
  if (year %in% 2004:2014) {
    by_msa_2004_through_2014(year)
  }
}

#' @importFrom magrittr %>%
by_msa_2004_through_2014 <- function(year) {
  url <- paste0('https://www.census.gov/construction/bps/txt/tb3u', year, '.txt')
  raw <- readr::read_fwf(url, skip=11, show_col_types=F, readr::fwf_cols(
    name=37,
    total_units=8,
    units_1=8,
    units_2=8,
    units_3_4=8,
    units_5_more=8,
    structures_units_5_more=8
  ))

  # Fix metro areas where names take up two rows
  # In these cases the values of the first row will be NA
  na_total_units <- raw %>%
    dplyr::mutate(
      i = dplyr::row_number()
    ) %>%
    dplyr::filter(is.na(total_units)) %>%
    dplyr::pull(i)

  clean <- raw %>%
    dplyr::mutate(
      i = dplyr::row_number(),
      name = dplyr::if_else(
        dplyr::lag(i) %in% na_total_units,
        paste0(dplyr::lag(name), ' ', name),
        name
      )
    ) %>%
    dplyr::filter(!is.na(total_units)) %>%
    dplyr::select(-i)

  # Myrtle Beach-Conway-North Myrtle Beac
  # TODO fix for New York-Northern New Jersey-Long Island,* NY-NJ-PA
  # which runs into the next column

  # Add note for metros with an asterisk
  clean <- clean %>%
    dplyr::mutate(
      note = dplyr::if_else(stringr::str_detect(name, '\\*'), 'Metropolitan areas where all permit offices are
    requested to report monthly.', NA_character_),
      name = stringr::str_remove(name, '\\*')
    ) %>%
    dplyr::filter(!stringr::str_detect(name, 'Metropolitan areas where all perm'))

  clean
}

