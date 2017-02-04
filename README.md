
<!-- README.md is generated from README.Rmd. Please edit that file -->
lastrfm
=======

[![Travis-CI Build Status](https://travis-ci.org/miccio-dk/lastrfm.svg?branch=master)](https://travis-ci.org/miccio-dk/lastrfm)

Read data from the [last.fm](www.last.fm) [APIs](http://www.last.fm/api). The following methods are available:

-   **Artist**: info, correction, similar, tags, albums, tracks
-   **Album**: info, tags
-   **Track**: info, correction, similar, tags

Installation
------------

Install the latest development version from GitHub:

``` r
devtools::install_github("miccio-dk/lastrfm")
```

Quick demo
----------

Gets top 5 Radiohead albums:

``` r
library(lastrfm)
albums <- lrfm_artist_get_top_albums("Radiohead", n = 5)
albums$name
#> [1] "OK Computer" "In Rainbows" "The Bends"   "Kid A"       "Pablo Honey"
```
