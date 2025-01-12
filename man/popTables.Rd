% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/popTables.R
\name{popTables}
\alias{popTables}
\title{List of population tables.}
\usage{
popTables(
  cond = NULL,
  plt = NULL,
  tree = NULL,
  seed = NULL,
  vsubpspp = NULL,
  vsubpstr = NULL,
  invsubp = NULL,
  subplot = NULL,
  subp_cond = NULL,
  dwm = NULL,
  sccm = NULL,
  grm = NULL,
  pltu = NULL,
  condu = NULL,
  begin = NULL,
  midpt = NULL,
  ...
)
}
\arguments{
\item{cond}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Condition-level data with one record for each condition, including or
excluding nonsampled conditions. Plot variables and strata/estimation unit
variable(s) may be included if plt and pltassgn=NULL. See details for
necessary variables to include.}

\item{plt}{DF/DT, Optional. R object, sf R object, comma-delimited
file(*.csv), layer or spatial layer in dsn, or shapefile(*.shp).  Plot-level
data with one record for each plot, including or excluding nonsampled
conditions. If nonsampled plots are included, PLOT_STATUS_CD variable must
be in table or a filter defined in plt.nonsamp.filter.}

\item{tree}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Tree-level data with one record for each tree. Tree data are aggregated to
condition-level. See details for necessary variables to include.}

\item{seed}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Seedling data with one record for each seedling count.}

\item{vsubpspp}{DF/DT, R object, comma-delimited file(*.csv), or layer in
dsn.  Vegetation species-level data with one record for each species
(P2VEG_SUBPLOT_SPP).}

\item{vsubpstr}{DF/DT, R object, comma-delimited file(*.csv), or layer in
dsn. Vegetation species-structure data with one record for each species
(P2VEG_SUBP_STRUCTURE).}

\item{invsubp}{DF/DT, R object, comma-delimited file(*.csv), or layer in
dsn. Invasive species data with one record for each species
(INVASIVE_SUBPLOT_SPP).}

\item{subplot}{DF/DT, R object, comma-delimited file(*.csv), or layer in
dsn. Subplot-level data with one record for each species (SUBPLOT).}

\item{subp_cond}{DF/DT, R object, comma-delimited file(*.csv), or layer in
dsn. Subplot condition-level data with one record for each species
(SUBP_COND).}

\item{dwm}{DF/DT, R object, comma-delimited file(*.csv), or layer 
in dsn. Calculated down woody material.}

\item{sccm}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Subplot-level data (SUBP_COND_CHNG_MTRX).}

\item{grm}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Tree-level growth, removal, and mortality data (TREE_GRM_COMPONENT).}

\item{pltu}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Plot-level data with unioned previous and current plots.}

\item{condu}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Condition-level data with unioned previous and current plots.}

\item{begin}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Tree-level growth, removal, and mortality data (TREE_GRM_BEGIN).}

\item{midpt}{DF/DT, R object, comma-delimited file(*.csv), or layer in dsn.
Tree-level growth, removal, and mortality data (TREE_GRM_MIDPT).}

\item{...}{For extendibility.}
}
\value{
A list of user-supplied parameters and parameter values for strata.
}
\description{
Returns a list of user-supplied parameters and parameter values for data 
tables to be supplied to *pop functions.
}
\details{
If no parameters, an empty list is returned.
}
\examples{
popTables(cond = FIESTA::WYcond, seed = FIESTA::WYseed)
}
\author{
Grayson W. White
}
\keyword{list}
