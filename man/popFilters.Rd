% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/popFilters.R
\name{popFilters}
\alias{popFilters}
\title{Population data filters.}
\usage{
popFilters(
  evalid = NULL,
  invyrs = NULL,
  intensity = NULL,
  measCur = FALSE,
  measEndyr = NULL,
  measEndyr.filter = NULL,
  ACI = FALSE,
  ...
)
}
\arguments{
\item{evalid}{Numeric. FIA Evaluation identifier for subsetting plots for
population.}

\item{invyrs}{Integer vector. Inventory year(s) (e.g., c(2000, 2001, 2002)).}

\item{intensity}{Integer code. Code(s) indicating intensity to use for
population.}

\item{measCur}{Logical. Inventory span defining variable. If TRUE, extract
plots with most current measurement for state(s).}

\item{measEndyr}{Logical. Inventory span defining variable. If TRUE, extract
plots with most current measurement for state(s) for years measured in or
before measEndyr.}

\item{measEndyr.filter}{Filter for extracting plots using measEndyr. Must be
in R syntax (e.g., 'AOI == 1').}

\item{ACI}{Logical. If TRUE, including All Condition Inventory (ACI) plots.}

\item{...}{For extendibility.}
}
\value{
A list of user-supplied parameters and parameter values for population
data filters.
}
\description{
Returns a list of user-supplied parameters and parameter values for population
data filters.
}
\details{
If no parameters, an empty list is returned.
}
\examples{
popFilters(ACI = TRUE)
}
\author{
Grayson W. White
}
\keyword{filters}
