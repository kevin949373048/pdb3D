show_3Dmol <- function(var){
  require(shiny)
  shinyApp(
    ui <- fluidPage(
      
      mainPanel(
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 1000px; width: 1000px; position: relative;",
            class='viewer_3Dmoljs',
            'data-pdb' = var,
            'data-backgroundcolor' ='0xffffff',
            'data-style'='cartoon', 
            'data-surface'='opacity:.7;color:white', 
          ))
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}

changeStyle <- function(style= "cartoon", pdbid, color="grey"){
  style <- paste0(style,":color=",color)
  print(style)
  require(shiny)
  shinyApp(
    ui <- fluidPage(
      mainPanel(
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 1000px; width: 1000px; position: relative;",
            class='viewer_3Dmoljs',
            'data-pdb' = pdbid,
            'data-style'=style, 
            'data-backgroundcolor' ='0xffffff',
            'data-surface'='opacity:.7;color:white', 
          ))
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}

  

  color_pFam <- function(var){
    aln<-bio3d::pdb.pfam(c(var), compact=FALSE)
    i <- 1
    c <-"resi:"
    while (i < length(aln$pdbResNumStart)+1) {
      pfamSeq <-  toString(seq (aln$pdbResNumStart[i],aln$pdbResNumEnd[i]))
      c <- paste(c, pfamSeq)
      i = i+1
    }
    print(c)
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
              'data-select1'=c, 
              'data-style1'='cartoon:color=blue', 
              'data-surface1'='opacity:.7;color:white', 
              
            ))
        )
      ),
      
      server <- function(input, output) {
        
      }
    )
    
    
  }
  color_pFam("1nvw")
  