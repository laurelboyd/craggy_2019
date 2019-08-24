# craggy2019 (development version)

* Converted from a simple R project to an [R package](http://r-pkgs.had.co.nz/package.html). Unfortunately, the project file needed to be renamed from `craggy_2019` to `craggy2019`, in order to conform to the [requirements for a package name](http://r-pkgs.had.co.nz/package.html#naming). However, developing the project as a package has several advantages:

    * [RStudio](https://www.rstudio.com/products/rstudio/) and 
        the [devtools](https://cran.r-project.org/package=devtools) package 
        provide a lot of tooling that makes it easier to work with the 
        data and code:

        * `.Rmd` files in the `vignettes` directory are run automatically during the build process to produce `html` and `md` files.
        * There is an explicit listing of package dependencies in the `DESCRIPTION` file.
        * Unit tests can be run automatically with `devtools::test()`.
        * Package and function documentation are generated automatically during the build process and are accessible from the console, e.g. `?'craggy2019-package'`.
        * `devtools::check()` does a lot of validation of code.

    * The directory structure for data, code, and tests follows the standard conventions used by all R packages. That makes it easy for an experienced R developer to browse the project quickly.
    * Packages simplify the process for developing reusable code that is accessible within this package or from other projects. Rather than copying and pasting between `.Rmd` files, cRaggy participants can extract reusable code into functions defined in the package, which can then be re-used in multiple `.Rmd` files.
    * The package structure also encourages the development of unit tests for code, because it is easy to write unit tests for code that has been isolated in a function definition.

* [aggRegate Meeting Notes 2019-08-20 & 22](https://docs.google.com/document/d/1wRCDgZkA1fUBX2JonwGENTlkEP5fl6tdF_eDeNbJzVc/edit)

* [burro](https://laderast.github.io/burro/) application to [browse Evictions data](https://tladeras.shinyapps.io/evictions_king_county/).

* [aggRegate Meeting Notes 2019-07-18](https://docs.google.com/document/d/165pu2Sm4OgeMZx-tBKsfLX6FFqbbrw_c2m7lA1S9iKg/edit)
