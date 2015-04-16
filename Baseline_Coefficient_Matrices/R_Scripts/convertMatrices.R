require(SGP)
source("../convertToBaseline.R")
#debug(convertToBaseline)

file.names <- list.files("Base_Matrices", pattern="Rdata")

for (i in file.names) {
	load(file.path("Base_Matrices", i))
	file.name.EL <- paste(head(unlist(strsplit(i, "[.]")), -1), collapse=".")
	tmp.year <- unlist(strsplit(names(get(file.name.EL)), "[.]"))[2]
	file.name <- sub(tmp.year, SGP:::yearIncrement(tmp.year, 1), sub("_EARLY_LITERACY", "", file.name.EL))
	if (paste(file.name, "Rdata", sep=".") %in% list.files("..")) {
		load(file.path("..", paste(file.name, "Rdata", sep="."))) 
		eval(parse(text=paste(file.name, "[['EARLY_LITERACY.BASELINE']] <- convertToBaseline(", file.name.EL, ")[['EARLY_LITERACY.BASELINE']]", sep="")))
		save(list=file.name, file=paste(file.name, "Rdata", sep="."))
	}
}
