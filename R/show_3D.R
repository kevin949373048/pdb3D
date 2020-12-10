#' Display 3D Strucutre Of Protein In shiny App
#'
#' open a 3dmol.js contained shiny app with molecule structure shown
#'
#' @param pdbID protein database id such as "1A2B"
#' 
#'
#' @return a 3dmol object in htmlwidgets app with protein structure shown. 
#'
#' @examples
#'
#' # Generating protein structure 
#' show3Dmol("1a2b")
#'
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#' @references
#' 1. Nicholas Rego and David Koes 3Dmol.js: molecular visualization with WebGL
#' \emph{Bioinformatics} (2015) 31 (8): 1322-1324 doi:10.1093/bioinformatics/btu829.
#' 2. Wei Su (2020). r3dmol: Create Interactive 3D Visualizations of Molecular Data. R
#'package version 0.1.0. https://github.com/swsoyee/r3dmol
#' 3. Grant, B.J. et al. (2006) Bioinformatics 22, 2695--2696.
#' @import r3dmol 
#' @import bio3d
#' @export
#'
show3Dmol <- function(pdbID){
  newPDB <- bio3d::get.pdb(pdbID)
  r3dmol() %>%
    m_add_model(data = newPDB, format = "pdb") %>%
    m_zoom_to()
  
}

#' anaylsis the sequence similarity of two pdb file
#'
#' @param pdbId1 protein database id such as "1A2B"
#' @param pdbId2 protein database id such as "1A2B"
#'
#' @return percentage of similarity in the two pdb file
#'
#' @examples
#'
#'
#' testSimilarity("1a2b","2a2b")
#'
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#' @references
#' 1.  Murat Sariyar and Andreas Borg (2020). RecordLinkage: Record Linkage Functions
#' for Linking and Deduplicating Data Sets. R package version 0.4-12.1.
#' https://CRAN.R-project.org/package=RecordLinkage
#' 2. Grant, B.J. et al. (2006) Bioinformatics 22, 2695--2696.
#' @import RecordLinkage 
#' @import bio3d 
#' @export
#'
testSimilarity<- function(pdbId1,pdbId2){
  pdb1<-bio3d::pdbseq(read.pdb(pdbId1));
  pdb2<-bio3d::pdbseq(read.pdb(pdbId2));
  pdb1 = paste(pdb1, collapse=', ' )
  pdb2 = paste(pdb2, collapse=', ' )
  return(round(RecordLinkage::levenshteinSim(pdb1, pdb2),digits=3))
}


#' reformate the input 
#'
#' @param style protein structure styles such as cartoon, stick, sphere. cartoon shows structure in loops. sphere shows atoms in sphere. stick shows bonds as sticks. default style is cartoon.
#' 

#' @param color color of the structure such as blue, green, yellow, and etc. Users can also use hex color. Default color is grey.
#'
#' @return new formated string 
#'
#' @examples
#'
#' # show 1a2b in red stick protein strucutre.
#' parseSpec("stick", "red")
#'
#' #show 1a2b in blue sphere protein strucutre.
#' changeStyle("sphere", "1a2b", "333CFF")
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#'
#' @references
#' 
#' R Core Team (2019). R: A language and environment for statistical computing. \emph{R Foundation for Statistical Computing}, Vienna, Austria. URL https://www.R-project.org/.
#' 
#' 
parseSpec <-function(style, color){
  return(paste0(style,":color=",color))
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
#' @importForm shiny shinyApp
#' @export
#'
changeStyle <- function(style= "cartoon", pdbID, color="grey"){
  shiny::shinyApp(
    ui <- fluidPage(
      mainPanel(
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 1000px; width: 1000px; position: relative;",
            class='viewer_3Dmoljs',
            'data-pdb' = pdbID,
            'data-style'= parseSpec(style, color), 
            'data-backgroundcolor' ='0xffffff',
            'data-surface'='opacity:.7;color:white', 
          ))
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}

#' Display 3D Strucutre Of Protein 
#'
#' open a 3dmol.js contained htmlwidge with molecule structure shown and Pfam structure annoted.
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
#' @import shiny
#' @import bio3d 
#' @export
#'
colorPfam <- function(pdbID){
    aln<-bio3d::pdb.pfam(c(pdbID), compact=FALSE)
    i <- 1
    c <-"resi:"
    while (i < length(aln$pdbResNumStart)+1) {
      pfamSeq <-  toString(seq (aln$pdbResNumStart[i],aln$pdbResNumEnd[i]))
      c <- paste(c, pfamSeq)
      i = i+1
    }
    shiny::shinyApp(
      ui <- fluidPage(
        
        mainPanel(
          fluidRow(
            tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
            tags$div(
              style="height: 1000px; width: 1000px; position: relative;",
              class='viewer_3Dmoljs',
              'data-pdb' = pdbID,
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



#' anaylsis the strucuture similarity of two pdb file
#'
#' @param pdbId1 protein database id such as "1A2B"
#' @param pdbId2 protein database id such as "1A2B"
#'
#' @return visualizations of the two pdb file
#'
#' @examples
#'
#' # Generating protein structure 
#' compareTwoPDB('1a2b','1a1b')
#'
#' @author {Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
#'
#' @references
#' 1. Nicholas Rego and David Koes 3Dmol.js: molecular visualization with WebGL
#' \emph{Bioinformatics} (2015) 31 (8): 1322-1324 doi:10.1093/bioinformatics/btu829.
#' 
#' @import  shiny 
#' @export
#'

compareTwoPDB <- function(pdbId1,pdbId2){
  shiny::shinyApp(
    ui <- fluidPage(
      mainPanel(
        fluidRow(
          h2(style="display: inline;margin:20%","Left protein"),h2(style="display: inline;","Right protein"),
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 500px; width: 50%; position:absolute;",
            class='viewer_3Dmoljs',
            'data-pdb' = pdbId1,
            'data-backgroundcolor' ='0xffffff',
            'data-style'='cartoon', 
            'data-surface'='opacity:.7;color:white', 
          )),
        fluidRow(
          tags$head(HTML('<script src="http://3Dmol.csb.pitt.edu/build/3Dmol-min.js"></script>')),
          tags$div(
            style="height: 500px; width: 50%; position: relative; float: right;",
            class='viewer_3Dmoljs',
            'data-pdb' = pdbId2,
            'data-backgroundcolor' ='0xffffff',
            'data-style'='cartoon', 
            'data-surface'='opacity:.7;color:white', 
          )),
      )
    ),
    
    server <- function(input, output) {
      
    }
  )
}




