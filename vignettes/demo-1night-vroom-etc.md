Demo OneNightCount.csv and vroom
================
[John D. Smith](https://github.com/smithjd/)
2019-08-23

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────── tidyverse 1.2.1 ──

    ## ✔ tibble  2.1.3     ✔ readr   1.3.1
    ## ✔ tidyr   0.8.3     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ forcats 0.4.0

    ## ── Conflicts ────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(vroom)
library(inspectdf)
library(skimr)
```

    ## 
    ## Attaching package: 'skimr'

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

``` r
library(janitor)
```

    ## 
    ## Attaching package: 'janitor'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

Generate a minimally serviceable data frame:

``` r
oneNightCount <- vroom("https://raw.githubusercontent.com/pdxrlang/craggy_2019/master/data/oneNightCount.csv")
```

    ## Observations: 130
    ## Variables: 14
    ## chr [ 1]: Location
    ## dbl [13]: YEAR, SEATTLE, KENT, NORTH END, EAST SIDE, SW KING CO, WHITE CNTR, FEDERAL ...
    ## 
    ## Call `spec()` for a copy-pastable column specification
    ## Specify the column types with `col_types` to quiet this message

``` r
oneNightCount <- oneNightCount %>% 
  clean_names %>% 
  select(-total) %>% 
  filter(location != "TOTAL")
```

Inspect with a few skimr and inspectdf:

``` r
skim(oneNightCount)
```

    ## Skim summary statistics
    ##  n obs: 120 
    ##  n variables: 13 
    ## 
    ## ── Variable type:character ─────────────────────
    ##  variable missing complete   n min max empty n_unique
    ##  location       0      120 120   5  18     0       12
    ## 
    ## ── Variable type:numeric ───────────────────────
    ##         variable missing complete   n    mean     sd   p0  p25    p50
    ##           auburn      12      108 120    5.88  11.67    0    0    1  
    ##        east_side       0      120 120   13.48  24.72    0    0    3  
    ##      federal_way       0      120 120   10.78  25.36    0    0    2  
    ##             kent       0      120 120    8.63  15.97    0    1    2.5
    ##  night_owl_buses       0      120 120   11.2   38.42    0    0    0  
    ##        north_end       0      120 120    5.16  13.54    0    0    1  
    ##           renton       0      120 120    6.97  12.09    0    0    3  
    ##          seattle       0      120 120  176.88 193.1     4   26  109  
    ##       sw_king_co      96       24 120   21.83  38.46    0    0    4  
    ##    vashon_island      96       24 120    2      6.53    0    0    0  
    ##       white_cntr      24       96 120    3.84   9.76    0    0    0  
    ##             year       0      120 120 2011.5    2.88 2007 2009 2011.5
    ##      p75 p100     hist
    ##     4      54 ▇▁▁▁▁▁▁▁
    ##     9     109 ▇▁▁▁▁▁▁▁
    ##     7     199 ▇▁▁▁▁▁▁▁
    ##     9     126 ▇▁▁▁▁▁▁▁
    ##     0     174 ▇▁▁▁▁▁▁▁
    ##     3      89 ▇▁▁▁▁▁▁▁
    ##     7      75 ▇▁▁▁▁▁▁▁
    ##   273.75  914 ▇▃▂▁▁▁▁▁
    ##    25.25  161 ▇▁▁▁▁▁▁▁
    ##     0      31 ▇▁▁▁▁▁▁▁
    ##     2      54 ▇▁▁▁▁▁▁▁
    ##  2014    2016 ▇▃▃▃▃▃▃▇

``` r
inspectdf::inspect_cor(oneNightCount) %>% show_plot()
```

![](demo-1night-vroom-etc_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
inspectdf::inspect_num(oneNightCount) %>% show_plot()
```

![](demo-1night-vroom-etc_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

``` r
inspectdf::inspect_na(oneNightCount) 
```

    ## # A tibble: 13 x 3
    ##    col_name          cnt  pcnt
    ##    <chr>           <dbl> <dbl>
    ##  1 sw_king_co         96    80
    ##  2 vashon_island      96    80
    ##  3 white_cntr         24    20
    ##  4 auburn             12    10
    ##  5 location            0     0
    ##  6 year                0     0
    ##  7 seattle             0     0
    ##  8 kent                0     0
    ##  9 north_end           0     0
    ## 10 east_side           0     0
    ## 11 federal_way         0     0
    ## 12 renton              0     0
    ## 13 night_owl_buses     0     0
