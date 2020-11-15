#' Display 3D Strucutre Of Protein In shiny App
#'
#' open a 3dmol.js contained shiny app with molecule structure shown
#'
#' @param pdbID protein database id such as "1A2B"
#' 
#'
#' @return a shiny app with protein structure shown. 
#'
#' @examples
#'
#' # Generating protein structure 
#' show3Dmol("1a2b")
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
#' @export
#'
show3Dmol <- function(PDBid){
  require(shiny)
  shinyApp(
    ui <- fluidPage(
      
      mainPanel(
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 1000px; width: 1000px; position: relative;",
            class='viewer_3Dmoljs',
            'data-pdb' = PDBid,
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

#' Display 3D Strucutre Styles Of Protein In shiny App
#'
#' open a 3dmol.js website with different molecule structure styles shown with white surface prediction.
#'
#' @param style protein structure styles such as cartoon, stick, sphere. cartoon shows structure in loops. sphere shows atoms in sphere. stick shows bonds as sticks. default style is cartoon.
#' 
#' @param pdbID protein database id such as "1A2B"
#' 
#' @param color color of the structure such as blue, green, yellow, and etc. Users can also use hex color. Default color is grey.
#'
#' @return a shiny app with protein structure shown. 
#'
#' @examples
#'
#' # show 1a2b in red stick protein strucutre.
#' changeStyle("stick", "1a2b", "red")
#'
#' #show 1a2b in blue sphere protein strucutre.
#' changeStyle("sphere", "1a2b", "333CFF")
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
#' @export
#'
changeStyle <- function(style= "cartoon", pdbid, color="grey"){
  style <- paste0(style,":color=",color)
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

#' Display 3D Strucutre Of Protein In shiny App
#'
#' open a 3dmol.js contained shiny app with molecule structure shown and Pfam structure annoted.
#'
#' @param pdbID protein database id such as "1A2B"
#' 
#'
#' @return a shiny app with protein structure shown and Pfam structure annoted.
#'
#' @examples
#'
#' # Generating protein structure with Pfam structures in blue
#' colorPfam("1a2b")
#'
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#' @references
#' Nicholas Rego and David Koes 3Dmol.js: molecular visualization with WebGL
#' \emph{Bioinformatics} (2015) 31 (8): 1322-1324 doi:10.1093/bioinformatics/btu829.
#' 
#' Winston Chang, Joe Cheng, JJ Allaire, Yihui Xie and Jonathan McPherson (2020). shiny: Web Application Framework for R. \emph{R package version 1.5.0}.
#' https://CRAN.R-project.org/package=shiny.
#'
#' Grant, B.J. et al. (2006) \emph{Bioinformatics} 22, 2695--2696.
#' 
#' 
#' @export
#'
colorPfam <- function(PDBid){
    aln<-bio3d::pdb.pfam(c(PDBid), compact=FALSE)
    i <- 1
    c <-"resi:"
    while (i < length(aln$pdbResNumStart)+1) {
      pfamSeq <-  toString(seq (aln$pdbResNumStart[i],aln$pdbResNumEnd[i]))
      c <- paste(c, pfamSeq)
      i = i+1
    }
    require(shiny)
    shinyApp(
      ui <- fluidPage(
        
        mainPanel(
          fluidRow(
            tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
            tags$div(
              style="height: 1000px; width: 1000px; position: relative;",
              class='viewer_3Dmoljs',
              'data-pdb' = PDBid,
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

  