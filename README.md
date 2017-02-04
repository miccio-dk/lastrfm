
<!-- README.md is generated from README.Rmd. Please edit that file -->
lastrfm
=======

Read data from the [last.fm](www.last.fm) [APIs](http://www.last.fm/api). The following methods are available:

-   **Artist**: info, correction, similar, tags, albums, tracks
-   **Album**: info, tags
-   **Track**: info, correction, similar, tags

### Installation

``` r
devtools::install_github("miccio-dk/lastrfm")
```

### Quick demo

Gets top 5 Radiohead albums:

``` r
library(lastrfm)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: readr
#> Loading required package: jsonlite
#> Loading required package: httr
albums <- lrfm_artist_get_top_albums("Radiohead", n = 5)
albums$name
#> [1] "OK Computer" "In Rainbows" "The Bends"   "Kid A"       "Pablo Honey"
```
