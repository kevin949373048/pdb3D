require(shiny)
shinyApp(
  ui <- fluidPage(
    
    mainPanel(
      fluidRow(
        tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
        tags$div(
          style="height: 1000px; width: 1000px; position: relative;",
          class='viewer_3Dmoljs',
          'data-pdb' = "1a2b",
          'data-backgroundcolor' ='0xffffff',
          'data-style'='cartoon', 
          'data-surface'='opacity:.7;color:white', 
        ))
    )
  ),
  
  server <- function(input, output) {
    
  }
)