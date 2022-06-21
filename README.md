
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
head(bps_annual_by_county)
#>   year  fips                       name total_units units_1 units_2 units_3_4
#> 1 2000 01001             Autauga County         165     165       0         0
#> 2 2000 01081                 Lee County         574     330     132        18
#> 3 2000 01113             Russell County         358     108       2         0
#> 4 2000 02000    Alaska Balance of State          72      72       0         0
#> 5 2000 02013     Aleutians East Borough           1       1       0         0
#> 6 2000 02016 Aleutians West Census Area          51      19       0         0
#>   units_5_more units_rep_1 units_rep_2 units_rep_3_4 units_rep_5_more  value_1
#> 1            0         165           0             0                0  9854805
#> 2           94         330         132            18               94 46679876
#> 3          248         108           2             0              248  8218417
#> 4            0          NA          NA            NA               NA 12544724
#> 5            0           0           0             0                0    85000
#> 6           32          19           0             0               32  2732002
#>   value_2 value_3_4 value_5_more value_rep_1 value_rep_2 value_rep_3_4
#> 1       0         0            0     9854805           0             0
#> 2 6717524   1452440      4717784    46679876     6717524       1452440
#> 3   90000         0     13499064     8218417       90000             0
#> 4       0         0            0          NA          NA            NA
#> 5       0         0            0           0           0             0
#> 6       0         0      4584720     2732002           0             0
#>   value_rep_5_more buildings_1 buildings_2 buildings_3_4 buildings_5_more
#> 1                0         165           0             0                0
#> 2          4717784         330          66             6                9
#> 3         13499064         108           1             0               13
#> 4               NA          72           0             0                0
#> 5                0           1           0             0                0
#> 6          4584720          19           0             0                4
#>   buildings_rep_1 buildings_rep_2 buildings_rep_3_4 buildings_rep_5_more
#> 1             165               0                 0                    0
#> 2             330              66                 6                    9
#> 3             108               1                 0                   13
#> 4              NA              NA                NA                   NA
#> 5               0               0                 0                    0
#> 6              19               0                 0                    4
#>   survey_date fips_state fips_county region_code division_code
#> 1      200012         01         001           3             6
#> 2      200012         01         081           3             6
#> 3      200012         01         113           3             6
#> 4      200012         02         000           4             9
#> 5      200012         02         013           4             9
#> 6      200012         02         016           4             9
```

### BPS by metropolitan statistical area

Years 2004-2014, annual figures

``` r
head(bps_annual_by_msa)
#>   year                        name total_units units_1 units_2 units_3_4
#> 1 2004                 Abilene, TX         291     283       8         0
#> 2 2004                   Akron, OH        2934    2480      70       102
#> 3 2004                  Albany, GA         873     671      52        32
#> 4 2004 Albany-Schenectady-Troy, NY        3268    2608      42         4
#> 5 2004             Albuquerque, NM        7455    7065       0        66
#> 6 2004              Alexandria, LA         685     683       2         0
#>   units_5_more structures_units_5_more
#> 1            0                       0
#> 2          282                      23
#> 3          118                      15
#> 4          614                      61
#> 5          324                      16
#> 6            0                       0
#>                                                                                note
#> 1                                                                              <NA>
#> 2                                                                              <NA>
#> 3                                                                              <NA>
#> 4                                                                              <NA>
#> 5 Metropolitan areas where all permit offices are\n    requested to report monthly.
#> 6                                                                              <NA>
```
