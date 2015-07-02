###################################################################################
###
### Script to convert RLI_UK annual matrix to baseline
###
###################################################################################

### Load SGP Package

require(SGP)


### Utility functions

convertToBaseline <- function(baseline_matrices) {
	tmp.list <- list()

	for (i in names(baseline_matrices)) {
		for (j in seq_along(baseline_matrices[[i]])) {
			baseline_matrices[[i]][[j]]@Time <- list(rep("BASELINE", length(unlist(baseline_matrices[[i]][[j]]@Time))))
		}
		names(baseline_matrices[[i]]) <- sub("[.][1234]_", "_", names(baseline_matrices[[i]]))
	}

	tmp.content_areas <- unique(sapply(strsplit(names(baseline_matrices), "[.]"), '[', 1))
	for (i in tmp.content_areas) {
		tmp.list[[paste(i, "BASELINE", sep=".")]] <- unlist(baseline_matrices[grep(i, names(baseline_matrices))], recursive=FALSE)
	}
	return(tmp.list)
}


### Create vector of years to loop over

tmp.years <- c("2012_2013.1", "2012_2013.2", "2012_2013.3", "2013_2014.1", "2013_2014.2", "2013_2014.3", "2014_2015.1", "2014_2015.2")
all.files <- list.files(pattern="NEW_MATRICES/Rdata")

for (i in tmp.years) {
	tmp.list <- list()
	tmp.files <- grep(i, all.files, value=TRUE)
	tmp.names <- gsub(".Rdata", "", tmp.files)
	file.name <- gsub("_EARLY_LITERACY|_MATHEMATICS|_READING", "", tmp.names[1])
	new.year <-  paste(SGP:::yearIncrement(unlist(strsplit(gsub("RLI_UK_Baseline_Matrices_", "", file.name), "[.]"))[1], 1), unlist(strsplit(gsub("RLI_UK_Baseline_Matrices_", "", file.name), "[.]"))[2], sep=".")
	file.name <- paste("RLI_UK_Baseline_Matrices_", new.year, sep="")
	for (j in seq_along(tmp.files)) {
		load(file.path("NEW_MATRICES", tmp.files[j]))
		tmp.list[[j]] <- get(tmp.names[j])
	}
	tmp.list.1 <- unlist(tmp.list, recursive=FALSE)
	tmp.list.2 <- convertToBaseline(tmp.list.1)
	assign(file.name, tmp.list.2)
	save(list=file.name, file=paste(file.name, ".Rdata", sep=""))
}
