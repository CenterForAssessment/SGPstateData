##################################################
## Merge in RLI matrices when missing from RLI_UK
##################################################

tmp.years <- c("2013_2014.1", "2013_2014.3", "2014_2015.1", "2014_2015.3", "2015_2016.1")

for (i in tmp.years) {
	tmp.file_RLI_UK <- list.files(pattern=i)
	tmp.file_RLI <- list.files("../../RLI/RLI_Baseline_Matrices_SGPt/", pattern=i)
	load(tmp.file_RLI_UK)
	load(file.path("../../RLI/RLI_Baseline_Matrices_SGPt/", tmp.file_RLI))
	file.name_RLI_UK <- sub("[.]Rdata", "", tmp.file_RLI_UK)
	file.name_RLI <- sub("[.]Rdata", "", tmp.file_RLI)
	matrix.names_RLI_UK <- names(get(file.name_RLI_UK)[['READING.BASELINE']])
	matrix.names_RLI <- names(get(file.name_RLI)[['READING.BASELINE']])
	if (length(matrix.names_RLI)==length(matrix.names_RLI_UK)) {
		print(paste(i, ": GOOD.", sep=""))
	} else {
		print(paste(i, ": BAD.", length(matrix.names_RLI), "; ", length(matrix.names_RLI_UK), sep=""))
	}
}
