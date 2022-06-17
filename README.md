
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

## Usage

``` r
library(buildingpermitsurvey)
```

## What’s implemented

### BPS by county

Years 2000-2021, annual figures

``` r
by_county(2021)
#> # A tibble: 749 × 33
#>     year fips  name           total_units units_1 units_2 units_3_4 units_5_more
#>    <dbl> <chr> <chr>                <dbl>   <dbl>   <dbl>     <dbl>        <dbl>
#>  1  2021 01001 Autauga County         277     277       0         0            0
#>  2  2021 01007 Bibb County             10      10       0         0            0
#>  3  2021 01009 Blount County           26      24       2         0            0
#>  4  2021 01021 Chilton County         150     150       0         0            0
#>  5  2021 01073 Jefferson Cou…        2118    1569       2         3          544
#>  6  2021 01075 Lamar County             0       0       0         0            0
#>  7  2021 01081 Lee County            1851    1487      42        28          294
#>  8  2021 01083 Limestone Cou…         631     473       6        26          126
#>  9  2021 01089 Madison County        5587    3794       2         0         1791
#> 10  2021 01113 Russell County         186     172      14         0            0
#> # … with 739 more rows, and 25 more variables: units_rep_1 <dbl>,
#> #   units_rep_2 <dbl>, units_rep_3_4 <dbl>, units_rep_5_more <dbl>,
#> #   value_1 <dbl>, value_2 <dbl>, value_3_4 <dbl>, value_5_more <dbl>,
#> #   value_rep_1 <dbl>, value_rep_2 <dbl>, value_rep_3_4 <dbl>,
#> #   value_rep_5_more <dbl>, buildings_1 <dbl>, buildings_2 <dbl>,
#> #   buildings_3_4 <dbl>, buildings_5_more <dbl>, buildings_rep_1 <dbl>,
#> #   buildings_rep_2 <dbl>, buildings_rep_3_4 <dbl>, …
```

### BPS by metropolitan statistical area

Years 2004-2014, annual figures

``` r
by_msa(2004)
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
