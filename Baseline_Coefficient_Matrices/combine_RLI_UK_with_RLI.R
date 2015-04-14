###########################################################################
###
### Function to merge matrices together from RLI and RLI_UK
###
###########################################################################

require(SGP)

### Load data

load("RLI_Coefficient_Matrices_2002_2003_to_2013_2014.Rdata")
load("RLI_UK_Coefficient_Matrices_2002_2003_to_2013_2014.Rdata")


### Utility function

combine_RLI_UK_with_RLI <- function(base_matrices, additional_matrices, name.iter) {

	### Utility function

	convertToBaseline <- function(baseline_matrices, content_area) {
		tmp.list <- list()
		for (i in names(baseline_matrices)) {
			baseline_matrices[[i]]@Time <- list(rep("BASELINE", length(unlist(baseline_matrices[[i]]@Time))))
		}

		tmp.list[[paste(content_area, "BASELINE", sep=".")]] <- baseline_matrices
		return(tmp.list)
	}

	### Add in WHOLE bunches of matrices that weren't included

	content_area <- unique(sapply(strsplit(name.iter, "[.]"), '[', 1))
	diff.names <- setdiff(names(additional_matrices), names(base_matrices))
	base_matrices <- c(base_matrices, additional_matrices[diff.names])

	base_matrices <- convertToBaseline(base_matrices, content_area)
	names(base_matrices[[paste(content_area, "BASELINE", sep=".")]]) <- sub("[.][1234]_", "_", names(base_matrices[[paste(content_area, "BASELINE", sep=".")]]))

	tmp.year <- SGP:::yearIncrement(head(tail(unlist(strsplit(name.iter, "[.]")), -1), 1), 1)
	tmp.suffix <- paste(tmp.year, tail(unlist(strsplit(name.iter, "[.]")), 1), sep=".")
	assign(paste("RLI_UK_Baseline_Matrices", tmp.suffix, sep="_"), base_matrices)
	save(list=paste("RLI_UK_Baseline_Matrices", tmp.suffix, sep="_"), file=paste(paste("RLI_UK_Baseline_Matrices", tmp.suffix, sep="_"), ".Rdata", sep=""))
}


for (name.iter in names(RLI_UK_Coefficient_Matrices_2002_2003_to_2013_2014)) {
	combine_RLI_UK_with_RLI(RLI_UK_Coefficient_Matrices_2002_2003_to_2013_2014[[name.iter]], RLI_Coefficient_Matrices_2002_2003_to_2013_2014[[name.iter]], name.iter)
}
