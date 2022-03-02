
<!-- [![GitHub Super-Linter](https://github.com/USDAForestService/FIESTA/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter) -->

<b>Authors:</b> Frescino, Tracey S.; Moisen, Gretchen G.; Patterson,
Paul L.; Toney, Chris; White, Grayson W.

# 🎉 FIESTA <img src="https://github.com/USDAForestService/FIESTA/blob/master/figs/fiesta_grey.png?raw=true" align="right" width=150 />

## Overview

The R package, `FIESTA` (Forest Inventory ESTimation and Analysis) is a
research estimation tool for analysts that work with sample-based
inventory data from the U.S. Department of Agriculture, Forest Service,
Forest Inventory and Analysis (FIA) Program. `FIESTA` can generate FIA’s
traditional state-wide estimates while also accommodate: unique
population boundaries, different evaluation time periods, customized
stratification schemes, non-standard variance equations, integration of
multi-scale remotely-sensed data and other auxiliary information, and
interaction with other modeling and estimation tools from CRAN’s library
of packages. `FIESTA` contains a collection of functions that can access
FIA databases, summarize and compile plot and spatial data, and generate
estimates with associated sampling errors.

Functions are organized by type or objective and are named with a
corresponding prefix (Fig. 1). `FIESTA` core functions (CORE) facilitate
data extraction and compilation of data input information and are used
independently or within the `FIESTA` estimation modules. `FIESTA`
estimation modules (MODULE) combine multiple functions from `FIESTA` or
other packages to generate population estimates using different
estimation strategies. Each module has an associated `mod*pop` function
for compiling the population data and calculations (e.g., adjustments
for nonresponse, standardizing auxiliary data) for a custom boundary and
can be used for generating multiple estimates. `FIESTA` analysis
functions, found in the `FIESTAnalysis` package, streamline different
estimation routines by wrapping (i.e., combining) estimation modules and
other functions for a specific purpose.

##### Core Functions

-   Database tools (`DB*`) - functions for querying and extracting data
    from FIA’s national database.
-   Data tools (`dat*`) - functions for summarizing and exploring FIA
    data.
-   Spatial tools (`sp*`) - functions for manipulating and summarizing
    spatial data.

##### Estimation Modules (mod)

-   Green-Book (`modGB*`) - functions for FIA’s standard Green-Book
    estimators.
-   Photo-Based (`modPB*`) - functions for supplementary photo-based
    estimators.
-   Small Area (`modSA*`) - functions for integration with available
    small area estimators (SAE).
-   Model-Assisted (`modMA*`) - functions for integration with available
    Model-Assisted estimators.

##### Analysis Functions

-   Analysis functions (`an*`) - wrapper functions for steam-lining
    estimation processes. These functions reside in the `FIESTAnalysis`
    package.

## Installation

Currently, to install `FIESTA`, you must go through a few steps:

#### 1. Install Rtools or xcode

If you are using the Windows OS, in order to install source code from
GitHub, you must install Rtools from
[CRAN](https://cran.r-project.org/). Install the most current Rtools for
Windows 64-bit at [this
link](https://cran.r-project.org/bin/windows/Rtools/).

If you are using macOS, you’ll need to install xcode developer tools. To
do so, run the following code in your terminal (not the R console):

    xcode-select --install

#### 2. Create token for GitHub

For ease of installing and updating `FIESTA`, generate a token from
GitHub settings. Note: `FIESTA` is frequently updated. You will use this
token each time you update `FIESTA` (until public release).

1.  In the upper-right corner of any page, click your profile photo,
    then click Settings in dropdown menu.
2.  In the left sidebar, click Developer settings.
3.  Go to Personal access tokens.
4.  Click Generate new token.
5.  Give your token a descriptive name.
6.  Check all boxes
7.  Save token (\~30 character string) to a file and as an R object.

#### 3. Install FIESTA package from source code

If you are updating `FIESTA`, first make sure the `FIESTA` library is
not attached, then uninstall from your library.

``` r
detach("package:FIESTA", unload=TRUE)
remove.packages("FIESTA", lib=.libPaths()) 
```

Next install `FIESTA` from GitHub, using the token you saved as an R
object.

``` r
## Set your token to an R character object, in quotes (Replace your_token with ~30 character string)
token <- "your_token"

## Install from github
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
devtools::install_github("https://github.com/USDAForestService/FIESTA", 
        auth_token = token,
        build_vignettes = TRUE,
        INSTALL_opts = c("--compile-both"),
        dependencies=c("Depends", "Imports"))
```

#### 4. Load FIESTA

Then, you can load `FIESTA`:

``` r
library(FIESTA)
```

## License

This code was written and prepared by a U.S. Government employee on
official time, and therefore it is in the public domain and not subject
to copyright.

<!-- ## HELP and vignettes -->
<!-- To get help for the `FIESTA` package -->
<!-- ```{r, eval = F} -->
<!-- help(package="FIESTA") -->
<!-- ``` -->
<!-- To get tutorials from `FIESTA` package -->
<!-- ```{r, eval = F} -->
<!-- vignette(package="FIESTA") -->
<!-- ``` -->
<!-- Core functions -->
<!-- ```{r, eval = F} -->
<!-- vignette("FIESTA_tutorial_DB", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_dat", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_sp", package="FIESTA") -->
<!-- ``` -->
<!-- Modules -->
<!-- ```{r, eval = F} -->
<!-- vignette("FIESTA_tutorial_GB", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_GBcustom", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_PB", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_SA", package="FIESTA") -->
<!-- vignette("FIESTA_tutorial_MA", package="FIESTA") -->
<!-- ``` -->

## Examples

These examples make use of vignettes that come with `FIESTA`, and these
vignettes can be found by calling `vignette(package = "FIESTA")`. The
data used in these examples come with the `FIESTA` package and are from
Wyoming, inventory years 2011-2013 (Evaluation 561301).

### Example 1: Green-book estimation

In order to produce estimates based on the Green-book, we first use the
`GBpopdat` function to produce population data for our areas of
interest. We can look at a summary of the population data below.

``` r
GBpopdat <- modGBpop(popTabs = popTables(cond = FIESTA::WYcond,
                                         tree = FIESTA::WYtree,
                                         seed = FIESTA::WYseed),
                     popTabIDs = popTableIDs(cond = "PLT_CN"),
                     pltassgn = FIESTA::WYpltassgn,
                     pltassgnid = "CN",
                     pjoinid = "PLT_CN",
                     unitarea = FIESTA::WYunitarea,
                     unitvar = "ESTN_UNIT",
                     strata = TRUE,
                     stratalut = FIESTA::WYstratalut,
                     strata_opts = strata_options(getwt = TRUE))

summary(GBpopdat)
#>             Length Class      Mode     
#> popType      1     -none-     character
#> condx       12     data.table list     
#> pltcondx    41     data.table list     
#> cuniqueid    1     -none-     character
#> condid       1     -none-     character
#> ACI.filter   1     -none-     character
#> unitarea     2     data.table list     
#> areavar      1     -none-     character
#> areaunits    1     -none-     character
#> unitvar      1     -none-     character
#> unitvars     1     -none-     character
#> strata       1     -none-     logical  
#> stratalut   18     data.table list     
#> strvar       1     -none-     character
#> strwtvar     1     -none-     character
#> expcondtab  12     data.table list     
#> plotsampcnt  3     data.table list     
#> condsampcnt  3     data.table list     
#> states       1     -none-     character
#> invyrs       1     by         list     
#> estvar.area  1     -none-     character
#> adj          1     -none-     character
#> treex       21     data.table list     
#> tuniqueid    1     -none-     character
#> adjtree      1     -none-     logical  
#> seedx       11     data.table list
```

Note that the `GBpopdat` list generated by `modGBpop` contains many
items. Some examples include the number of plots by plot status
(`plotsampcnt`), the number of conditions by condition status
(`condsampcnt`), the strata-level population data, including number of
plots and adjustment factors (`stratalut`), and the adjustment factors
added to the condition-level, tree-level, and seedling data (`condx`,
`treex`, and `seedx`, respectfully).

Now, with the `GBpopdat` object, we can quickly produce estimates of
forest land (`landarea = "FOREST"`) by forest type
(`rowvar = "FORTYPCD`) in Wyoming for the 2011-2013 years.

``` r
area_estimates <- modGBarea(
    GBpopdat = GBpopdat,
    landarea = "FOREST",
    rowvar = "FORTYPCD"
    )
```

We again output a list, now with estimates/standard errors, raw data,
state code, and inventory year:

``` r
str(area_estimates, max.level = 2)
#> List of 4
#>  $ est    :'data.frame': 19 obs. of  3 variables:
#>   ..$ Forest type           : chr [1:19] "182" "184" "185" "201" ...
#>   ..$ Estimate              : chr [1:19] "632481.7" "339749.8" "14854.7" "881189" ...
#>   ..$ Percent Sampling Error: chr [1:19] "17.28" "23.85" "100" "14.21" ...
#>  $ raw    :List of 11
#>   ..$ unit_totest:'data.frame':  23 obs. of  17 variables:
#>   ..$ totest     :'data.frame':  1 obs. of  13 variables:
#>   ..$ unit_rowest:'data.frame':  135 obs. of  18 variables:
#>   ..$ rowest     :'data.frame':  18 obs. of  13 variables:
#>   ..$ domdat     :'data.frame':  590 obs. of  14 variables:
#>   ..$ module     : chr "GB"
#>   ..$ esttype    : chr "AREA"
#>   ..$ GBmethod   : chr "PS"
#>   ..$ rowvar     : chr "FORTYPCD"
#>   ..$ colvar     : chr "NONE"
#>   ..$ areaunits  : chr "acres"
#>  $ statecd: int 56
#>  $ invyr  : int [1:3] 2011 2012 2013
```

### Example 2:

Pull in data with `spGetPlots` and `FIESTAnalysis::ecomap` and then
produce MA and SAE estimates for those ecoregions.

### Example 3:

Maybe something photo-based? We also may want to stick with just two
relatively simple examples.
