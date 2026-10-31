#!/usr/bin/env Rscript
###################################################################################################
####
#### Golden check: does a fresh build reproduce the committed SGPstateData.rda?
####
#### Usage:
####   Rscript scripts/check.R                          # rebuild, compare with SGPstateData.rda
####   Rscript scripts/check.R --built=FILE             # compare FILE (already built) instead
####   Rscript scripts/check.R --against=FILE           # also require the committed file to equal FILE
####                                                    #   (e.g. SGP/data/SGPstateData.rda)
####
#### Exit status is 0 when everything compares equal, 1 otherwise, and the differing paths
#### are printed, state by state.
####
#### Why not compare digests? The 'digest' stamp is a hash of the serialized environment, and
#### the serialized form of the stored functions carries incidental detail (source references,
#### closure environments), so it differs between an interactive build and a scripted one even
#### when every value is the same. The top-level 'digest' entry is therefore not compared. The comparison below is on the content: every value is
#### compared with identical(), and every function by its code and the values it captures.
####
###################################################################################################

.seen <- new.env()  # pairs of environments already compared, so shared or cyclic closures are visited once

.diff_paths <- function(x, y, path = "SGPstateData", out = character(), depth = 0L) {
  if (depth > 60L) return(out)
  add <- function(why) c(out, paste0(path, "  [", why, "]"))

  if (is.environment(x) || is.environment(y)) {
    if (!(is.environment(x) && is.environment(y))) return(add("environment vs non-environment"))
    key <- paste(format(x), format(y))
    if (exists(key, envir = .seen, inherits = FALSE)) return(out)
    assign(key, TRUE, envir = .seen)
    nx <- sort(ls(x, all.names = TRUE)); ny <- sort(ls(y, all.names = TRUE))
    if (depth == 0L) { nx <- setdiff(nx, "digest"); ny <- setdiff(ny, "digest") }  # see header
    for (n in setdiff(nx, ny)) out <- c(out, paste0(path, "$", n, "  [only in built]"))
    for (n in setdiff(ny, nx)) out <- c(out, paste0(path, "$", n, "  [only in committed]"))
    for (n in intersect(nx, ny)) {
      out <- .diff_paths(get(n, x), get(n, y), paste0(path, "$", n), out, depth + 1L)
    }
    return(out)
  }

  if (is.function(x) || is.function(y)) {
    if (!(is.function(x) && is.function(y))) return(add("function vs non-function"))
    if (!identical(deparse(x), deparse(y))) return(add("function code differs"))
    ex <- environment(x); ey <- environment(y)
    shared <- function(e) is.null(e) || identical(e, globalenv()) || identical(e, baseenv()) ||
      isNamespace(e) || identical(e, emptyenv())
    if (shared(ex) || shared(ey)) {
      if (!identical(environmentName(ex), environmentName(ey))) return(add("function environment differs"))
      return(out)
    }
    return(.diff_paths(ex, ey, paste0(path, "<closure>"), out, depth + 1L))
  }

  if (is.list(x) && is.list(y)) {
    if (!identical(names(x), names(y))) return(add("names differ"))
    ax <- attributes(x); ay <- attributes(y)
    drop <- c("names", ".internal.selfref")
    if (!identical(ax[setdiff(names(ax), drop)], ay[setdiff(names(ay), drop)])) return(add("attributes differ"))
    nm <- names(x)
    for (i in seq_along(x)) {
      label <- if (!is.null(nm) && nzchar(nm[i])) paste0("$", nm[i]) else paste0("[[", i, "]]")
      out <- .diff_paths(x[[i]], y[[i]], paste0(path, label), out, depth + 1L)
    }
    return(out)
  }

  if (!identical(x, y)) return(add("value differs"))
  out
}

compare_state_data <- function(built, committed) {
  rm(list = ls(.seen, all.names = TRUE), envir = .seen)
  .diff_paths(built, committed)
}

.load_state_data <- function(file) {
  e <- new.env()
  load(file, envir = e)
  if (!exists("SGPstateData", envir = e, inherits = FALSE)) stop("No SGPstateData object in ", file, call. = FALSE)
  e$SGPstateData
}

.report <- function(diffs, left, right) {
  if (!length(diffs)) {
    cat(sprintf("OK  %s == %s\n", left, right))
    return(TRUE)
  }
  top <- sub("^SGPstateData\\$([^$<\\[ ]+).*", "\\1", diffs)
  cat(sprintf("DIFFERENT  %s vs %s: %d difference(s) in %d top-level entr%s\n", left, right,
              length(diffs), length(unique(top)), if (length(unique(top)) == 1L) "y" else "ies"))
  for (s in unique(top)) {
    cat(sprintf("  %s\n", s))
    d <- diffs[top == s]
    for (line in utils::head(d, 5L)) cat(sprintf("      %s\n", line))
    if (length(d) > 5L) cat(sprintf("      ... and %d more\n", length(d) - 5L))
  }
  FALSE
}

if (sys.nframe() == 0L) {
  args <- commandArgs(TRUE)
  opt <- function(name) sub(paste0("^--", name, "="), "", args[grepl(paste0("^--", name, "="), args)])
  f <- sub("^--file=", "", commandArgs(FALSE)[grep("^--file=", commandArgs(FALSE))])
  root <- normalizePath(file.path(dirname(normalizePath(f[1])), ".."))
  source(file.path(root, "scripts", "build.R"), local = TRUE)

  committed_file <- file.path(root, "SGPstateData.rda")
  built_file <- opt("built")
  if (!length(built_file)) {
    built_file <- tempfile(fileext = ".rda")
    build_state_data(built_file, root)
  }

  committed <- .load_state_data(committed_file)
  ok <- .report(compare_state_data(.load_state_data(built_file), committed),
                "fresh build", "committed SGPstateData.rda")

  against <- opt("against")
  if (length(against)) {
    ok <- .report(compare_state_data(.load_state_data(against), committed),
                  against, "committed SGPstateData.rda") && ok
  }
  quit(status = if (ok) 0L else 1L)
}
