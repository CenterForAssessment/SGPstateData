###################################################################################
###
### Small script to convert annual matrix to baseline
###
###################################################################################

convertToDecimal <- function(my_matrices) {
	for (i in names(my_matrices)) {
		for (j in seq_along(my_matrices[[i]])) {
		 	my_matrices[[i]][[j]]@Grade_Progression[[1]] <- paste(my_matrices[[i]][[j]]@Grade_Progression[[1]], sapply(strsplit(my_matrices[[i]][[j]]@Time[[1]], "[.]"), '[', 2), sep=".")
		}
	}
	return(my_matrices)
}
