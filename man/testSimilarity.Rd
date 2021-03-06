% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_3D.R
\name{testSimilarity}
\alias{testSimilarity}
\title{anaylsis the sequence similarity of two pdb file}
\usage{
testSimilarity(pdbId1, pdbId2)
}
\arguments{
\item{pdbId1}{protein database id such as "1A2B"}

\item{pdbId2}{protein database id such as "1A2B"}
}
\value{
percentage of similarity in the two pdb file
}
\description{
anaylsis the sequence similarity of two pdb file
}
\examples{


testSimilarity("1a2b","2a2b")

}
\references{
1.  Murat Sariyar and Andreas Borg (2020). RecordLinkage: Record Linkage Functions
for Linking and Deduplicating Data Sets. R package version 0.4-12.1.
https://CRAN.R-project.org/package=RecordLinkage
2. Grant, B.J. et al. (2006) Bioinformatics 22, 2695--2696.
}
\author{
{Wenkai Cao, \email{Wenkai.cao@mail.utoronto.ca}}
}
