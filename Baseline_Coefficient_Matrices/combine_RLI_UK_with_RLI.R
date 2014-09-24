###########################################################################
###
### Function to merge matrices together from RLI and RLI_UK
###
###########################################################################

require(SGP)

combine_RLI_UK_with_RLI <- function(base_matrices, additional_matrices) {

	### Utility function

	convertToBaseline <- function(baseline_matrices) {
		tmp.list <- list()
		for (i in names(baseline_matrices)) {
			for (j in seq_along(baseline_matrices[[i]])) {
				baseline_matrices[[i]][[j]]@Time <- list(rep("BASELINE", length(unlist(baseline_matrices[[i]][[j]]@Time))))
			}	
		}

		tmp.content_areas <- unique(sapply(strsplit(names(baseline_matrices), "[.]"), '[', 1))
		for (i in tmp.content_areas) {
			tmp.list[[paste(i, "BASELINE", sep=".")]] <- unlist(baseline_matrices[grep(i, names(baseline_matrices))], recursive=FALSE)
		}
		return(tmp.list)
	}

	### Add in WHOLE bunches of matrices that weren't included

	content_areas <- unique(sapply(strsplit(names(base_matrices), "[.]"), '[', 1))
	additional_matrices <- additional_matrices[grep(content_areas, names(additional_matrices))]

	for (i in intersect(names(base_matrices), names(additional_matrices))) {
		diff.names <- setdiff(names(additional_matrices[[i]]), names(base_matrices[[i]]))
		base_matrices[[i]] <- c(base_matrices[[i]], additional_matrices[[i]][diff.names])
	}	

	base_matrices <- convertToBaseline(c(base_matrices, additional_matrices[setdiff(names(additional_matrices), names(base_matrices))]))

	for (j in unique(sapply(strsplit(names(RLI_UK_Coefficient_Matrices_2002_2003_to_2013_2014), "[.]"), '[', 2))) {
		assign(paste("RLI_UK_Baseline_Matrices_", SGP:::yearIncrement(j, 1), sep=""), base_matrices[[1]][grep(j, names(base_matrices[[1]]))])
		save(list=paste("RLI_UK_Baseline_Matrices_", SGP:::yearIncrement(j, 1), sep=""), file=paste("RLI_UK_Baseline_Matrices_", SGP:::yearIncrement(j, 1), ".Rdata", sep=""))
	}
}
