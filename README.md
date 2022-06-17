
<!-- README.md is generated from README.Rmd. Please edit that file -->

# buildingpermitsurvey

<!-- badges: start -->
<!-- badges: end -->

Aims to provide uniformly formatted data from the U.S. Census Bureau’s
[Building Permits Survey](https://www.census.gov/construction/bps/) for
R.

Very much a work in progress. The format of the output is very likely to
change!

## Installation

You can install the development version of buildingpermitsurvey like so:

``` r
devtools::install_github('kevinschaul/buildingpermitsurvey')
```

## What’s implemented

### BPS by metropolitan statistical area

Years 2004-2014

``` r
library(buildingpermitsurvey)

msa_2004 <- by_msa(2004)
msa_2004
#> # A tibble: 363 × 8
#>    name      total_units units_1 units_2 units_3_4 units_5_more structures_unit…
#>    <chr>     <chr>       <chr>     <dbl>     <dbl>        <dbl>            <dbl>
#>  1 Abilene,… 291         283           8         0            0                0
#>  2 Akron, OH 2934        2480         70       102          282               23
#>  3 Albany, … 873         671          52        32          118               15
#>  4 Albany-S… 3268        2608         42         4          614               61
#>  5 Albuquer… 7455        7065          0        66          324               16
#>  6 Alexandr… 685         683           2         0            0                0
#>  7 Allentow… 4612        4461         18        40           93               10
#>  8 Altoona,… 496         293          18         0          185                9
#>  9 Amarillo… 1010        737           6         0          267               13
#> 10 Ames, IA  736         317          18         3          398               17
#> # … with 353 more rows, and 1 more variable: note <chr>
```
