#' Census Building Permit Survey data by county
#'
#' A dataset containing annual bps data by county, for 2000-2021.
#'
#' @format A data frame with lots variables:
#' \describe{
#'   \item{year}{year of survey}
#'   \item{fips}{county fips}
#'   \item{name}{county name}
#'   \item{total_units}{estimated total units}
#'   \item{units_1}{estimated 1-unit units}
#'   \item{units_2}{estimated 2-unit units}
#'   \item{units_3_4}{estimated 3-4 unit units}
#'   \item{units_5_more}{estimated 5+ unit units}
#'   \item{units_rep_1}{reported 1-unit units}
#'   \item{units_rep_2}{reported 2-unit units}
#'   \item{units_rep_3_4}{reported 3-4 unit units}
#'   \item{units_rep_5_more}{reported 5+ unit units}
#'   \item{buildings_1}{estimated 1-unit buildings}
#'   \item{buildings_2}{estimated 2-unit buildings}
#'   \item{buildings_3_4}{estimated 3-4 unit buildings}
#'   \item{buildings_5_more}{estimated 5+ unit buildings}
#'   \item{buildings_rep_1}{reported 1-unit buildings}
#'   \item{buildings_rep_2}{reported 2-unit buildings}
#'   \item{buildings_rep_3_4}{reported 3-4 unit buildings}
#'   \item{buildings_rep_5_more}{reported 5+ unit buildings}
#'   \item{value_1}{estimated 1-unit value}
#'   \item{value_2}{estimated 2-unit value}
#'   \item{value_3_4}{estimated 3-4 unit value}
#'   \item{value_5_more}{estimated 5+ unit value}
#'   \item{value_rep_1}{reported 1-unit value}
#'   \item{value_rep_2}{reported 2-unit value}
#'   \item{value_rep_3_4}{reported 3-4 unit value}
#'   \item{value_rep_5_more}{reported 5+ unit value}
#'   \item{survey_date}{survey date}
#'   \item{fips_state}{state fips}
#'   \item{fips_county}{county fips (without state included)}
#'   \item{region_code}{Census region code}
#'   \item{division_code}{Census division code}
#' }
#' @source \url{https://www.census.gov/construction/bps/}
"bps_annual_by_county"


#' Census Building Permit Survey data by msa
#'
#' A dataset containing annual bps data by msa, for 2004-2014.
#'
#' @format A data frame with the following variables:
#' \describe{
#'   \item{year}{year of survey}
#'   \item{name}{msa name}
#'   \item{total_units}{total units}
#'   \item{units_1}{1-unit units}
#'   \item{units_2}{2-unit units}
#'   \item{units_3_4}{3-4 unit units}
#'   \item{units_5_more}{5+ unit units}
#'   \item{structures_units_5_more}{5+ unit structures}
#'   \item{note}{note}
#' }
#' @source \url{https://www.census.gov/construction/bps/}
"bps_annual_by_msa"
