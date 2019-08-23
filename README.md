# craggy2019

---

**Table of Contents**

1. [cRaggy is Back - Looking at Housing and Evictions in King County](#craggy-is-back---looking-at-housing-and-evictions-in-king-county)
1. [Data Source](#data-source)
1. [Accessing the data](#accessing-the-data)
1. [Examples and kick-starters](#examples-and-kick-starters)
1. [Notes and resources](#notes-and-resources)
1. [License](#license)

---

<!-- badges: start -->
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

> Disclaimer: this package is experimental and intended for use simply as an informal exercise for working with data in the [R language](https://www.r-project.org/). Read the [NEWS.md](NEWS.md) for recent updates.
<!-- badges: end -->

---

## cRaggy is Back - Looking at Housing and Evictions in King County

cRaggy, our data exploration and visualization activity is back! For those of you unfamiliar with cRaggy, the [Portland R User Group](https://www.meetup.com/portland-r-user-group/) makes a large dataset available for visualization and analysis, so that you can present and share your results, visualizations, and insights about the dataset.

We will be looking at a combination of housing data and eviction data for King County, Washington, United States, hoping to gain insights about the nature of evictions in King County. This dataset comes courtesy of the planners of the [2019 Symposium for Data Science and Statistics](https://ww2.amstat.org/meetings/sdss/2019/). 

We encourage you to collaborate together and work on visualizations! Our goal is to encourage collaboration and share our code and insights.

In September, we'll have a visualization gallery and lightning talks about the visualizations and insights you've come up with. Event information will be posted on our [Meetup page](https://www.meetup.com/portland-r-user-group/events/).

All are welcome. Participation in cRaggy requires agreeing to the [Code of Conduct](.github/CODE_OF_CONDUCT.md)

## Data Source

King County Eviction Data for cRaggy 2019.

This dataset came from the [SDSS 2019 Data Hack Activity](https://ww2.amstat.org/meetings/sdss/2019/).

## Accessing the data

This project is organized as an [R package](https://r-pkgs.org/), which
contains the data. An easy way to access the data is to:

1. Clone this repository to your local machine.
1. Open the project in [RStudio](https://www.rstudio.com/products/rstudio/).
1. Click on the `Build > Install and Restart` button, which in the
    default application configuration
    is in the `Environment, History, ...` pane in the upper right of
    the application window.
1. The package will be built, installed in your local package library, 
    and loaded into your session. 
    When you see `library(craggy2019)` executed in
    the console, then the build and load is complete and your environment
    is ready for you to use the package.
1. The data files are in the `inst/extdata` directory, so you can refer to
    them through the file system, 
    e.g. `here::here("inst", "extdata", "evictions.csv")`.
1. However, often you will be using this package in another project
    where you are exploring and analyzing the data.
    In that case, you load the package into your session with
    a `library(craggy2019)` call.
    Then use the `base::system.file` function to reference a file
    within the package. 
    For example, 
    `readr::read_csv(system.file("extdata", "evictions.csv", package = "craggy2019"))`. 
    With `system.file`, you do not reference the
    `inst` directory level. When a package is loaded, 
    everything within the `inst` directory is placed at the 
    root level of the package.

## Examples and kick-starters

These examples can help you start analyzing the data:

  * Hosted [burro](https://laderast.github.io/burro/) demo: [Browse King County evictions data](https://tladeras.shinyapps.io/evictions_king_county/).
  * [Run burro in your local environment](vignettes/evictions.Rmd).
  * [Introduction to Geospatial Visualization](vignettes/Introduction_to_Visualizing_Geospatial_Data.md) for the King County data.
  * [Read data from the `oneNightCount.csv` file](vignettes/demo-1night-vroom-etc.md) with [vroom](https://cran.r-project.org/package=vroom) and summarize the contents with [skimr](https://cran.r-project.org/package=skimr) and [inspectdf](https://cran.r-project.org/package=inspectdf).

## Notes and resources

See the [NEWS](NEWS.md) for recent code changes, as well as links to resources outside of this project.

## License

This code is licensed under the [MIT License](LICENSE.md).
