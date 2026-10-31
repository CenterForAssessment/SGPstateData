#!/usr/bin/env Rscript
###################################################################################################
####
#### Generate the Quarto site sources in ui/www.
####
#### SGPstateData is a data-build repository, not an R package, so the site is generated from a
#### small staged "package": ui/site-src (DESCRIPTION, the SGPstateData reference page, NEWS,
#### the specifications article) plus the repository's README.md, LICENSE.md and release notes
#### in Documents/releases. Edit those sources, never the generated pages in ui/www.
####
#### Usage:   Rscript ui/build-site.R        (needs the dataimago R package)
#### Render:  cd ui/www && quarto render
####
###################################################################################################

f <- sub("^--file=", "", commandArgs(FALSE)[grep("^--file=", commandArgs(FALSE))])
root <- if (length(f)) normalizePath(file.path(dirname(normalizePath(f[1])), "..")) else normalizePath(".")
stage <- file.path(root, "ui", "stage")
unlink(stage, recursive = TRUE)
dir.create(stage, recursive = TRUE)

copy <- function(from, to) {
  dir.create(dirname(to), recursive = TRUE, showWarnings = FALSE)
  stopifnot(file.copy(from, to))
}
src <- file.path(root, "ui", "site-src")
for (p in list.files(src, recursive = TRUE, all.files = FALSE)) {
  if (p %in% c("logo.svg", "logo.png", "favicon.png")) {
    copy(file.path(src, p), file.path(stage, "man", "figures", p))
  } else {
    copy(file.path(src, p), file.path(stage, p))
  }
}
copy(file.path(root, "README.md"), file.path(stage, "README.md"))
for (p in list.files(file.path(root, "Documents", "releases"), pattern = "\\.Rmd$")) {
  copy(file.path(root, "Documents", "releases", p), file.path(stage, "vignettes", "releases", p))
}

dataimago::create_package_site(
  stage, output_path = "../www",
  site_url = "https://centerforassessment.github.io/SGPstateData/",
  repo_url = "https://github.com/CenterForAssessment/SGPstateData",
  org = "Center for Assessment", org_url = "https://www.nciea.org/",
  branch = "master", workflow = FALSE, overwrite_config = TRUE
)

# SGPstateData is not on CRAN (the object ships inside the SGP package), and the README's setext
# title would repeat the hero, so adjust the generated home page.
index <- file.path(root, "ui", "www", "index.qmd")
txt <- readLines(index, warn = FALSE, encoding = "UTF-8")
txt <- txt[!grepl("CRAN.R-project.org/package=SGPstateData", txt, fixed = TRUE)]
txt <- txt[!grepl("^\\*\\*Website:", txt)]  # the README line pointing here
title_at <- which(txt == "SGPstateData" & c(txt[-1], "") == "============")
if (length(title_at)) txt <- txt[-c(title_at, title_at + 1L)]
ref_at <- grep("reference/index.html", txt, fixed = TRUE)[1]
txt <- append(txt, '  <li><a href="articles/Specifications.html">Specifications</a></li>', after = ref_at - 1L)
writeLines(enc2utf8(txt), index, useBytes = TRUE)

unlink(stage, recursive = TRUE)
message("Site sources written to ui/www. Render with: cd ui/www && quarto render")
