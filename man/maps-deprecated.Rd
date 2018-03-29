\name{maps-deprecated}
\docType{data}
\alias{maps-deprecated}
\alias{Deprecated}
\title{DEPRECATED}
\description{
The old, legacy, world map (which dates from around 1990) will be completely removed in future versions of the maps package. The data set will remain available in the \code{mapdata} package.
}
\format{
During a transition period (\code{maps} version 3.0) it is possible to switch to the old legacy map using the function \code{world.legacy(TRUE)} or by setting the setting the environment variable R_MAP_DATA_LEGACY=TRUE prior to loading the package.

In future releases, this dataset will be removed completely. It will however remain available in the \code{mapdata} package, where it is called \code{worldLores}
}
\seealso{
\code{\link{map}},\code{\link{world.legacy}},\code{\link{world}}
}
\examples{
## DEPRECATED:
# map('legacy_world', fill = TRUE, col = 1:10)
## Use mapdata::worldLores instead:
if (!requireNamespace("mapdata")) {
  map("mapdata::worldLores", fill = TRUE, col = 1:10)
}
}