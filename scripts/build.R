#!/usr/bin/env Rscript
###################################################################################################
####
#### Build SGPstateData.rda from the meta-data sources in this repository.
####
#### Usage (from anywhere):
####   Rscript scripts/build.R                 # rebuild SGPstateData.rda in the repository root
####   Rscript scripts/build.R --out=FILE      # write the rebuilt object to FILE instead
####
#### This is a thin wrapper. It runs SGPstateData.R unchanged, from the repository root (the
#### script loads its inputs by relative path), and only redirects where the final save() goes.
#### Nothing in the meta-data is edited, reordered or re-derived here.
####
#### Requires: data.table, digest, png, and the SGP package (functions stored in the object
#### reference its namespace).
####
###################################################################################################

build_state_data <- function(out = "SGPstateData.rda", root = NULL) {
  if (is.null(root)) root <- .repo_root()
  old <- setwd(root)
  on.exit(setwd(old), add = TRUE)
  out <- normalizePath(out, mustWork = FALSE)

  src <- readLines("SGPstateData.R", warn = FALSE)
  hit <- grep('save(SGPstateData, file="SGPstateData.rda", compress="xz")', src, fixed = TRUE)
  if (length(hit) != 1L) {
    stop("Expected exactly one save(SGPstateData, file=\"SGPstateData.rda\", ...) call in SGPstateData.R, found ",
         length(hit), ". Update scripts/build.R to match.", call. = FALSE)
  }
  src[hit] <- sprintf("save(SGPstateData, file=%s, compress=\"xz\")", deparse(out))

  # The object records functions; keep.source = FALSE keeps the stored form independent of how
  # the script was launched (an interactive session keeps srcrefs, Rscript does not).
  old_opts <- options(keep.source = FALSE)
  on.exit(options(old_opts), add = TRUE)
  env <- new.env(parent = globalenv())
  eval(parse(text = src, keep.source = FALSE), envir = env)
  invisible(out)
}

.repo_root <- function() {
  args <- commandArgs(FALSE)
  f <- sub("^--file=", "", args[grep("^--file=", args)])
  here <- if (length(f)) dirname(normalizePath(f[1])) else file.path(getwd(), "scripts")
  normalizePath(file.path(here, ".."))
}

if (sys.nframe() == 0L) {
  args <- commandArgs(TRUE)
  out <- sub("^--out=", "", args[grepl("^--out=", args)])
  root <- .repo_root()
  if (!length(out)) out <- file.path(root, "SGPstateData.rda")
  res <- build_state_data(out, root)
  message("Wrote ", res)
}
