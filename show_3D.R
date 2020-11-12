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
            'data-select1'='chain:A', 
            'data-style1'='cartoon:color=spectrum', 
             'data-surface1'='opacity:.7;color:white', 
             'data-select2'='chain:B', 
             'data-style2'='stick'       
          ))
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}
  show_3Dmol('1YCR')

  
  