# craggy2019

---

**Table of Contents**

1. [cRaggy is Back - Looking at Housing and Evictions in King County](#craggy-is-back---looking-at-housing-and-evictions-in-king-county)
2. [Data Source](#data-source)
3. [Accessing the data](#accessing-the-data)
    3.1 [Add your code to the existing source code](#add-your-code-to-the-existing-source-code)
    3.2 [Use the `craggy2019` package from your own independent project](#use-the-craggy2019-package-from-your-own-independent-project)
4. [Examples and kick-starters](#examples-and-kick-starters)
5. [Notes and resources](#notes-and-resources)
6. [License](#license)

---

<!-- badges: start -->
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

> Disclaimer: this package is experimental and intended for use simply as an informal exercise for working with data in the [R language](https://www.r-project.org/). Read the [NEWS.md](NEWS.md) for recent updates.

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
contains the data and includes some examples of reading, exploring, analyzing, and visualizing the data. There are several ways to use this project.

### Add your code to the existing source code

**Context**: You want to use the existing sample code and write your own code within the same source structure of this package. You might want to contribute some of your code back to this project, but you are not sure about that yet.

**Solution**: [Fork](https://help.github.com/en/articles/fork-a-repo) the project, so that you can work in your own version. A "fork" is linked back to the original code, so that you can contribute changes later, if you so choose, by making a [Pull Request](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork).

1. [Fork](https://help.github.com/en/articles/fork-a-repo) this project, which creates a separate copy in _your_ Github account.
1. [Clone](https://help.github.com/en/articles/cloning-a-repository) the repository that is now forked in _your_ Github account to your local machine.
1. Open the copy on your local machine in [RStudio](https://www.rstudio.com/products/rstudio/).
1. Click on the `Build > Install and Restart` button, which in the default application configuration is in the `Environment, History, ...` pane in the upper right of the application window.
1. The package will be built, installed in your local package library, and loaded into your session. When you see `library(craggy2019)` executed in the console, then the build and load is complete and your environment is ready for you to use the package.
1. Now you can use the [base::system.file](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/system.file) function to reference a data file within the loaded package. For example,
    ```r
    readr::read_csv(system.file("extdata", "evictions.csv", package = "craggy2019"))
    ```
    This will read data from the loaded package in the R Session, _not_ from the file system.
1. Alternatively, you can refer to the data files through the file system in the `inst/extdata` directory. For example,
    ```r
    here::here("inst", "extdata", "evictions.csv")`.
    ```
1. As you write code and perhaps add more data, you will [commit](https://git-scm.com/docs/git-commit) those changes with `git` on your local machine. From time to time, you should [push](https://help.github.com/en/articles/pushing-commits-to-a-remote-repository) those changes to _your_ Github account. Since you [forked](https://help.github.com/en/articles/fork-a-repo) the project, those changes will only affect _your_ repository, not the [pdxlang/craggy_2019](https://github.com/pdxrlang/craggy_2019) repository from which you forked.
1. As mentioned previously, you can make a [Pull Request](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork) from your forked repository to the original [pdxlang/craggy_2019](https://github.com/pdxrlang/craggy_2019) repository, in order to have your code merged into the original source. However, we do not explain how to do that here.

### Use the `craggy2019` package from your own independent project

**Context**: You already have a project where you want to write code to read, explore, analyze, and visualize the Evictions data. You do _not_ want to write your code within the framework of this `craggy2019` package source code.

**Solution**: You need to install and load this `craggy2019` package in your local environment, so that you can access the data that it contains. However, you do _not_ need to [fork](https://help.github.com/en/articles/fork-a-repo) or [clone](https://git-scm.com/docs/git-clone) the [pdxlang/craggy_2019](https://github.com/pdxrlang/craggy_2019) repository.

1. Install the `craggy2019` package:
    ```r
        install.packages("remotes")
        library(remotes)
        remotes::install_github("pdxrlang/craggy_2019")
        # Note: Unfortunately, the repository name and package name do not match!
        library(craggy2019)
    ```
1. Now you can use the [base::system.file](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/system.file) function to reference a data file within the package. For example,
    ```r
    readr::read_csv(system.file("extdata", "evictions.csv", package = "craggy2019"))
    ```
    This will read data from the loaded package in the R Session, _not_ from the file system.
1. FYI: With [system.file](https://www.rdocumentation.org/packages/base/versions/3.6.1/topics/system.file), you do not reference the `inst` directory level, which is the root level for the data files in the _source code_, but it is _not_ the root level for the data in the _loaded package_. When a package is loaded, everything within the [`inst` directory](http://r-pkgs.had.co.nz/inst.html) is placed at the root level of the package. So you start at the `extdata` directory level, which is the level that holds all of the data files that we are using for this project.
1. FYI: `inst/extdata` is the R package convention for [where data is placed within a package](https://r-pkgs.org/data.html). Almost all packages follow that convention, so we followed it for this project too.

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
