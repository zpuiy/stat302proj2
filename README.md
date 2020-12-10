`stat302proj2` is an `R` package for modeling relative abundance and testing hypotheses about the effect of covariates on relative abundance. The `corncob` methodology was specifically developed for modelling microbial abundances based on high throughput sequencing data, such as 16S or whole-genome sequencing.


<!-- badges: start -->
  [![Travis build status](https://travis-ci.com/zpuiy/stat302proj2.svg?branch=master)](https://travis-ci.com/zpuiy/stat302proj2)
  
  [![Codecov test coverage](https://codecov.io/gh/zpuiy/stat302proj2/branch/master/graph/badge.svg)](https://codecov.io/gh/zpuiy/stat302proj2?branch=master)
  <!-- badges: end -->
  
## Installation

To download the stat302proj2 package, use the code below.

``` r{eval = FALSE}
# install.packages("devtools")
devtools::install_github("zpuiy/stat302proj2")
library(stat302proj2)
```

## Use

The vignette demonstrates example usage of all main functions. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):


``` r
# install.packages("devtools")
devtools::install_github("zpuiy/stat302proj2", build_vignette = TRUE, build_opts = c())
library(stat302proj2)
# Use this to view the vignette in the stat302proj2 HTML help
help(package = "stat302proj2", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "stat302proj2")
```
