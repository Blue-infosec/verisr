% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getenumCI.R
\name{getenumCI}
\alias{getenumCI}
\title{Summarizes veris enumerations from verisr objects}
\usage{
getenumCI(veris, enum, by = NULL, na = NULL, unk = FALSE,
  short.names = TRUE, ci.method = c(), ci.level = 0.95, round.freq = 5,
  ...)
}
\arguments{
\item{veris}{A verisr object}

\item{enum}{A veris feature or enumeration to summarize}

\item{by}{A veris feature or enumeration to group by}

\item{na}{A boolean of whether to include not applicable in the sample set.
This is REQUIRED if enum has a potential value of NA as there is no 
'default' method for handling NAs.  Instead, it depends on the 
hypothesis being tested.}

\item{unk}{A boolean referring whether to include 'unknown' in the sample.
The default is 'FALSE' and should rarely be overwritten.}

\item{short.names}{A boolean identifying whether to use the full enumeration
name or just the last section. (i.e. action.hacking.variety.SQLi vs
just SQLi.)}

\item{ci.method}{A confidence interval method to use.  Current supported
methods are any from binom.confint() or "multinomial".  If unsure
which to use, use "wilson".}

\item{ci.level}{A number from 0 to 1 representing the width of the 
confidence interval. (default = 0.95)}

\item{round.freq}{An integer indicating how many places to round
the frequency value to. (default = 5)}

\item{...}{A catch all for functions using arguments from previous
versions of getenum.}
}
\value{
A data frame summarizing the enumeration
}
\description{
From dbirR 9047
}
\examples{
tmp <- tempfile(fileext = ".dat")
download.file("https://github.com/vz-risk/VCDB/raw/master/data/verisr/vcdb.dat", tmp, quiet=TRUE)
load(tmp, verbose=TRUE)
chunk <- getenumCI(vcdb, "action.hacking.variety")
chunk
chunk <- getenumCI(vcdb, "action.hacking.variety", by="timeline.incident.year")
chunk
chunk <- getenumCI(vcdb, 
                   "action.hacking.variety", 
                   by="timeline.incident.year") 
reshape2::acast(chunk, by~enum, fill=0)
getenumCI(vcdb, "action")
getenumCI(vcdb, "asset.variety")
getenumCI(vcdb, "asset.assets.variety")
getenumCI(vcdb, "asset.assets.variety", ci.method="wilson")
getenumCI(vcdb, "asset.cloud")
getenumCI(vcdb, "action.social.variety.Phishing")
getenumCI(vcdb, "actor.*.motive", ci.method="wilson", na=FALSE)
}
