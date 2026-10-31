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
  # The script was written on a case-insensitive file system and loads
  # "SGP_Norm_Group_Preference/PARCC_..." from a directory tracked as SGP_NORM_GROUP_PREFERENCE/.
  # On Linux that path does not exist, so resolve each load() path case-insensitively. This only
  # changes how a file is located, never what is read or what the script computes.
  env$load <- function(file, envir = parent.frame(), ...) {
    base::load(.resolve_path(file), envir = envir, ...)
  }
  eval(parse(text = src, keep.source = FALSE), envir = env)
  invisible(out)
}

.resolve_path <- function(path) {
  if (file.exists(path)) return(path)
  # Two directories that differ only in case (e.g. SGP_Norm_Group_Preference/ and
  # SGP_NORM_GROUP_PREFERENCE/) are both tracked, and a macOS checkout merges them. Search every
  # case-insensitive match for each component, so the file is found whichever directory holds it.
  walk <- function(cur, parts) {
    if (!length(parts)) return(cur)
    hits <- list.files(cur, all.files = TRUE, no.. = TRUE)
    for (m in hits[tolower(hits) == tolower(parts[1L])]) {
      res <- walk(file.path(cur, m), parts[-1L])
      if (!is.null(res)) return(res)
    }
    NULL
  }
  parts <- strsplit(path, "/", fixed = TRUE)[[1L]]
  res <- walk(if (startsWith(path, "/")) "/" else ".", parts[nzchar(parts)])
  if (is.null(res)) path else sub("^\\./", "", res)
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
