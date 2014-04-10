###################################################################################
###
### Small script to convert annual matrix to baseline
###
###################################################################################

convertToBaseline <- function(baseline_matrices) {
	tmp.year <- unlist(strsplit(names(RLI_Baseline_Matrices)[1], "[.]"))[2]
	names(baseline_matrices) <- gsub(tmp.year, "BASELINE", names(RLI_Baseline_Matrices))
	for (i in names(baseline_matrices)) {
		for (j in seq_along(baseline_matrices[[i]])) {
			baseline_matrices[[i]][[j]]@Time <- list(rep("BASELINE", length(unlist(baseline_matrices[[i]][[j]]@Time))))
		}	
	}
	return(baseline_matrices)
}
