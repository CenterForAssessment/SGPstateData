##############################
## Merge together matrices
##############################

tmp.years <- c("2013_2014.1", "2013_2014.3", "2014_2015.1", "2014_2015.3", "2015_2016.1")

for (i in tmp.years) {
	tmp.file <- list.files("NEW_Coefficient_Matrices/", pattern=i)
	load(file.path("OLD_Coefficient_Matrices", tmp.file))
	file.name <- sub("[.]Rdata", "", tmp.file)
	assign(paste(file.name, "OLD", sep="_"), get(file.name))
	load(file.path("NEW_Coefficient_Matrices", tmp.file))
	tmp <- c(get(paste(file.name, "OLD", sep="_"))[['READING.BASELINE']], get(file.name)[['READING.BASELINE']])
	eval(parse(text=paste(file.name, "[['READING.BASELINE']] <- tmp", sep="")))
	tmp <- c(get(paste(file.name, "OLD", sep="_"))[['MATHEMATICS.BASELINE']], get(file.name)[['MATHEMATICS.BASELINE']])
	eval(parse(text=paste(file.name, "[['MATHEMATICS.BASELINE']] <- tmp", sep="")))
	tmp <- get(file.name)[['EARLY_LITERACY.BASELINE']]
	eval(parse(text=paste(file.name, "[['EARLY_LITERACY.BASELINE']] <- tmp", sep="")))
	save(list=file.name, file=tmp.file)
}

