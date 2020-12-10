#' Display and compare 3D Strucutre Of Protein In shiny App
#'
#' open a 3dmol.js contained shiny app with molecule structure shown
#'
#'
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#' @references
#' Nicholas Rego and David Koes 3Dmol.js: molecular visualization with WebGL
#' \emph{Bioinformatics} (2015) 31 (8): 1322-1324 doi:10.1093/bioinformatics/btu829.
#' 
#' Winston Chang, Joe Cheng, JJ Allaire, Yihui Xie and Jonathan McPherson (2020). shiny: Web Application Framework for R. \emph{R package version 1.5.0}.
#' https://CRAN.R-project.org/package=shiny
#'
#'
#'
if (interactive()) {
  # Define UI
  ui <- fluidPage(
    textInput("left", "Left PDB id"),
    textInput("right", "Right PDB id"),
    actionButton("add", "Submit"),
    textOutput("selected_var")
  )
  
  # Server logic
  server <- function(input, output, session) {
    observeEvent(input$add, {
      removeUI(
        selector = "div:has(> .viewer_3Dmoljs)",
        multiple = TRUE,
        immediate = FALSE,
      )
      output$selected_var <- renderText({ 
        paste("The percentage of similarity is ", testSimilarity(input$left,input$right))})
        
      insertUI(
        selector = "#add",
        where = "afterEnd",
        ui =  mainPanel(
          fluidRow(
            h2(style="display: inline;margin:20%","Left protein"),h2(style="display: inline;","Right protein"),
            tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
            tags$div(
              style="height: 500px; width: 50%; position:absolute;",
              class='viewer_3Dmoljs',
              'data-pdb' = input$left,
              'data-backgroundcolor' ='0xffffff',
              'data-style'='cartoon', 
              'data-surface'='opacity:.7;color:white', 
            )),
          
          fluidRow(
            
            tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
            tags$div(
              style="height: 500px; width: 50%; position: relative; float: right;",
              class='viewer_3Dmoljs',
              'data-pdb' = input$right,
              'data-backgroundcolor' ='0xffffff',
              'data-style'='cartoon', 
              'data-surface'='opacity:.7;color:white', 
            ))
        )
      )
    })
  }
  
        
  # Complete app with UI and server components
  shinyApp(ui, server)
}


