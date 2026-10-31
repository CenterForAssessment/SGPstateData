\name{SGPstateData}
\alias{SGPstateData}
\docType{data}
\title{State assessment program meta-data}
\description{
\code{SGPstateData} is an environment holding one entry per assessment program (a state, a consortium, or an organization), keyed by an abbreviation such as \code{"GA"} or \code{"WIDA"}. The SGP package reads it to find achievement level cutscores, the knots and boundaries for the B-spline fits, assessment names and labels for reports, and the rules for the order of prior scores. It is built from the source files in this repository by \code{SGPstateData.R}.
}
\usage{
SGPstateData
}
\format{
An environment. Each program entry is a named list; entries are optional, and which ones are present depends on the program. Names that are used for merges are in ALL CAPS (content areas, \code{GRADE_3}); other names use \code{Camel_Case}.

\describe{
  \item{\code{Assessment_Program_Information}}{Names and abbreviations (\code{Assessment_Name}, \code{Assessment_Abbreviation}, \code{Organization}, \code{Test_Vendor}), \code{Content_Areas}, \code{Grades_Tested}, \code{Assessment_Years}, \code{Test_Season}, \code{CSEM} (conditional standard errors of measurement), and, where the assessment changed, \code{Assessment_Transition} and \code{Scale_Change}.}
  \item{\code{Achievement}}{\code{Cutscores} (by content area, or content area and year, then grade; each value is the \emph{lower bound} of the next performance level), \code{Levels} (labels, and which levels count as proficient) and \code{Knots_Boundaries} (knots, boundaries and loss/hoss values by content area and grade).}
  \item{\code{Growth}}{\code{Levels}, \code{Cutscores} and \code{System_Type}, for programs that classify growth.}
  \item{\code{SGP_Configuration}}{Switches and functions that tailor an analysis, for example \code{sgp.cohort.size}, \code{grade.projection.sequence} and \code{sgp.loss.hoss.adjustment}.}
  \item{\code{SGP_Norm_Group_Preference}, \code{SGP_Progression_Preference}}{Which prior scores are used when more than one sequence is available.}
  \item{\code{Student_Report_Information}}{Labels, scale and reporting choices used by the student growth report generators.}
  \item{\code{Custom_Student_Report}, \code{Variable_Name_Lookup}, \code{Baseline_splineMatrix}}{Present for some programs only.}
  \item{\code{digest}}{A hash stamped on the object when it is built.}
}
}
\details{
The object is a faithful record of each program's published cutscores and its configuration for SGP analyses. Do not edit entries to \dQuote{fix} a result: the SGP package relies on the object exactly as built, and \code{scripts/check.R} in the repository fails when a build no longer reproduces the committed file.
}
\source{
The files in this repository: \code{Cutscores/}, \code{Knots_Boundaries/}, \code{CSEM/}, \code{Linkages/}, \code{Custom_SGP_Config/}, \code{Variable_Name_Lookup/} and the others read by \code{SGPstateData.R}. \url{https://github.com/CenterForAssessment/SGPstateData}
}
\seealso{
\url{https://sgp.io} for the SGP package that embeds the object.
}
\examples{
\dontrun{
# From the SGP package:
library(SGP)
names(SGPstateData)[1:6]
SGPstateData[["GA"]][["Assessment_Program_Information"]][["Assessment_Name"]]
SGPstateData[["GA"]][["Achievement"]][["Levels"]][["Labels"]]
SGPstateData[["GA"]][["Achievement"]][["Cutscores"]][["MATHEMATICS"]][["GRADE_4"]]
}
}
\keyword{datasets}
