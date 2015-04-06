###################################################################################
###
### Small script to convert annual matrix to baseline
###
###################################################################################

convertToBaseline <- function(baseline_matrices) {
	tmp.list <- list()
	tmp.suffix <- paste("[.]", tail(unlist(strsplit(names(baseline_matrices), "[.]")), 1), sep="")

	for (i in names(baseline_matrices)) {
		for (j in seq_along(baseline_matrices[[i]])) {
			baseline_matrices[[i]][[j]]@Time <- list(rep("BASELINE", length(unlist(baseline_matrices[[i]][[j]]@Time))))
		}
		names(baseline_matrices[[i]]) <- sub(tmp.suffix, "", names(baseline_matrices[[i]]))
	}

	tmp.content_areas <- unique(sapply(strsplit(names(baseline_matrices), "[.]"), '[', 1))
	for (i in tmp.content_areas) {
		tmp.list[[paste(i, "BASELINE", sep=".")]] <- unlist(baseline_matrices[grep(i, names(baseline_matrices))], recursive=FALSE)
	}
	return(tmp.list)
}
