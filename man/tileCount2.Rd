% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tileCount2.R
\name{tileCount2}
\alias{tileCount2}
\title{Perform overlap queries between reads and genome by sliding windows
Count reads over sliding windows.}
\usage{
tileCount2(reads, fragment.length = 100, windowSize = 50000,
  restrict = paste0("chr", c(1:19, "X", "Y")), step = 1000,
  filter = 0, pe = "both")
}
\arguments{
\item{reads}{An object that represents the names and path of the bam files  to be counted.
If reads are more than 1 bam files,
it should be a vector of character with full path. This function now works for paired end reads}

\item{fragment.length}{integer(1). An integer scalar or a list of two integer scalars/vectors,
containing the average length(s) of the sequenced fragments in each libary.}

\item{windowSize}{numeric(1) or integer(1). Size of the windows.}

\item{restrict}{restrict to a set of chromosomes, default to mouse chromosomes.}

\item{step}{numeric(1) or integer(1). Step of generating silding windows.}

\item{filter}{default to 0 without filtering. An integer scalar for the minimum count sum across libraries for each window}

\item{pe}{a character string indicating whether paired-end data is present; set to "none", "both", "first" or "second"}
}
\value{
A \link[SummarizedExperiment:RangedSummarizedExperiment-class]{RangedSummarizedExperiment} object with chromosome-level depth
The assays slot holds the counts, rowRanges holds the annotation from the
sliding widows of genome.
metadata contains lib.size.chrom for holding chromosome-level sequence depth
}
\description{
Perform overlap queries between reads and genome by sliding windows
Count reads over sliding windows.
}
\examples{
if (interactive())
{
    fls <- list.files(system.file("extdata", package="NADfinder"),
    recursive=FALSE, pattern="*bam$", full=TRUE)
    names(fls) <- basename(fls)
   
    se <- tileCount2(reads = fls,
                    windowSize=50000, step=10000)
}


}
\author{
Jun Yu,Hervé Pagès and Julie Zhu
}
