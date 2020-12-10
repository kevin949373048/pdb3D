#' Launch Shiny App For Package pdb3D
#'
#' A function that launches the shiny app for this package.
#' The shiny app allows user to choose a input file, the app
#' will calculate the difference among those genes and generate
#' a plot shows the distribution for all differences.
#' The code has been placed in \code{./inst/shiny-scripts}.
#'
#' @return No return value but open up a shiny page.
#'
#' @examples
#' \dontrun{
#' pdb3D::runPdb3D()
#' }
#'
#' @author Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#' Nicholas Rego and David Koes 3Dmol.js: molecular visualization with WebGL *Bioinformatics* (2015) 31 (8): 1322-1324 doi:10.1093/bioinformatics/btu829.
#' 
#' @export
#' @importFrom shiny runApp
runPdb3D <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "pdb3D")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

# [END]

