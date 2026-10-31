# Building SGPstateData

`SGPstateData.rda` is built from the files in this repository by `SGPstateData.R`. The SGP package embeds the built file as `data/SGPstateData.rda`.

## Rebuild

```sh
Rscript scripts/build.R                 # rewrites SGPstateData.rda in the repository root
Rscript scripts/build.R --out=FILE      # writes the rebuilt object somewhere else
```

`scripts/build.R` runs `SGPstateData.R` unchanged. It only redirects the final `save()` and turns off source references, so the result does not depend on whether you launched the script from RStudio, a terminal, or CI. Sourcing `SGPstateData.R` from the repository root in an R session still works and is equivalent.

Requires R with `data.table`, `digest`, `png` and the **SGP** package (the object stores functions whose environments refer to SGP).

## Check

```sh
Rscript scripts/check.R
```

Rebuilds into a temporary file and compares it with the committed `SGPstateData.rda`. It exits with status 1 and prints the differing paths, state by state, if they are not the same.

* **What counts as "the same".** Every value is compared with `identical()`. Stored functions are compared by their code and by the values they capture. The top-level `digest` entry is skipped: it is a hash of the serialized environment, and the serialized form of a function carries incidental detail, so the hash differs between builds that have identical content.
* **Why it matters.** The SGP package depends on `SGPstateData` exactly as built. The check catches a source change that was not rebuilt, a `.rda` that was edited or rebuilt without its source, and any accidental change to a program you did not mean to touch.

To compare with the copy in the SGP package as well:

```sh
Rscript scripts/check.R --against=path/to/SGP/data/SGPstateData.rda
```

Continuous integration runs the check on every push and pull request. It also runs the SGP comparison, but only reports it: the SGP package may legitimately lag this repository between releases.

## Changing a program's entry

1. Edit the source files for that program (cutscores, knots and boundaries, configuration) and, if needed, `SGPstateData.R`.
2. `Rscript scripts/build.R`
3. `Rscript scripts/check.R` should now print `OK`.
4. Commit the sources and `SGPstateData.rda` together.

## The website

The site in `ui/www` is generated and rendered in CI.

```sh
Rscript ui/build-site.R         # needs the dataimago R package
cd ui/www && quarto render
```

Edit `ui/site-src/` (the reference page for the object, the specifications article, `NEWS.md`), `README.md` or `Documents/releases/`, never the generated pages.
