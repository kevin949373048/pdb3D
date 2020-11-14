show_3Dmol <- function(var){
  require(shiny)
  shinyApp(
    ui <- fluidPage(
      
      mainPanel(
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 400px; width: 400px; position: relative;",
            class='viewer_3Dmoljs',
            'data-pdb' = var,
            'data-backgroundcolor' ='0xffffff',
            'data-style' ='stick'
          ))
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}