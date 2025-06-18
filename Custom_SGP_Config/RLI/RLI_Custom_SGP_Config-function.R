`configSGP` <-
function(year,
	 content_area,
	 testing.window,
	 score.type) {

	### Utility function

	yearIncrement <- function(year, increment, lag=0) {
		if (identical(year, "BASELINE")) {
			return(rep("BASELINE", length(increment)))
		} else {
			if (length(grep("_", year[1]) > 0)) {
				tmp1 <- sapply(seq_along(increment), function(i) as.numeric(sapply(strsplit(as.character(year), "_"), '[', 2)) + increment[i] - lag)
				paste(floor(tmp1)-1, tmp1, sep="_")
			} else {
				as.character(sapply(seq_along(increment), function(i) as.numeric(year) + increment[i] - lag))
			}
		}
	}


	###
	### EARLY_LITERACY
	###

	if (content_area=="EARLY_LITERACY" & testing.window=="FALL") {### EARLY_LITERACY/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'K.1'), c('PK.1', 'K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('PK.2', 'PK.3', 'K.1'), c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1')),
				sgp.projection.baseline.grade.sequences=list('PK.1', c('PK.3', 'K.1'), c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY/FALL

	if (content_area=="EARLY_LITERACY" & testing.window=="WINTER") {### EARLY_LITERACY/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'PK.2'), c('PK.3', 'K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2')),
				sgp.projection.baseline.grade.sequences=list(c('PK.1', 'PK.2'), c('K.1', 'K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY/WINTER

	if (content_area=="EARLY_LITERACY" & testing.window=="SPRING") {### EARLY_LITERACY/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('PK.3', 'K.3'), c('PK.3', 'K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'PK.3'), c('PK.3', 'K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 5))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'PK.2', 'PK.3'), c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3')),
				sgp.projection.baseline.grade.sequences=list(c('PK.2', 'PK.3'), c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY/SPRING


	###
	### MATHEMATICS
	###

	if (content_area=="MATHEMATICS" & testing.window=="FALL") {### MATHEMATICS/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1'), c('7.1', '8.1', '9.1'), c('8.1', '9.1', '10.1'), c('9.1', '10.1', '11.1'), c('10.1', '11.1', '12.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1'), "NO_PERCENTILES"),
				sgp.projection.baseline.grade.sequences=list('K.1', c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END MATHEMATICS/FALL

	if (content_area=="MATHEMATICS" & testing.window=="WINTER") {### MATHEMATICS/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('K.1', 'K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END MATHEMATICS/WINTER

	if (content_area=="MATHEMATICS" & testing.window=="SPRING") {### MATHEMATICS/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', '7.3', '8.3'), c('7.3', '8.3', '9.3'), c('8.3', '9.3', '10.3'), c('9.3', '10.3', '11.3'), c('10.3', '11.3', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3'), c('8.3', '9.1', '9.3'), c('9.3', '10.1', '10.3'), c('10.3', '11.1', '11.3'), c('11.3', '12.1', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 13))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END MATHEMATICS/SPRING


	###
	### READING
	###

	if (content_area=="READING" & testing.window=="FALL") {### READING/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1'), c('7.1', '8.1', '9.1'), c('8.1', '9.1', '10.1'), c('9.1', '10.1', '11.1'), c('10.1', '11.1', '12.1')),
#				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1'), c('7.1', '8.1', '9.1'), c('8.1', '9.1', '10.1'), c('9.1', '10.1', '11.1'), c('10.1', '11.1', '12.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 11))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1'), "NO_PERCENTILES"),
#				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1'), "NO_PERCENTILES"),
				sgp.projection.baseline.grade.sequences=list('1.1', c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
#				sgp.projection.baseline.grade.sequences=list('K.1', c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END READING/FALL

	if (content_area=="READING" & testing.window=="WINTER") {### READING/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
#				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
#				sgp.projection.baseline.grade.sequences=list('K.2', c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END READING/WINTER

	if (content_area=="READING" & testing.window=="SPRING") {### READING/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', '7.3', '8.3'), c('7.3', '8.3', '9.3'), c('8.3', '9.3', '10.3'), c('9.3', '10.3', '11.3'), c('10.3', '11.3', '12.3')),
#				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', '7.3', '8.3'), c('7.3', '8.3', '9.3'), c('8.3', '9.3', '10.3'), c('9.3', '10.3', '11.3'), c('10.3', '11.3', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 11))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3'), c('8.3', '9.1', '9.3'), c('9.3', '10.1', '10.3'), c('10.3', '11.1', '11.3'), c('11.3', '12.1', '12.3')),
#				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3'), c('8.3', '9.1', '9.3'), c('9.3', '10.1', '10.3'), c('10.3', '11.1', '11.3'), c('11.3', '12.1', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 13))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
#				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
#				sgp.projection.baseline.grade.sequences=list(c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END READING/SPRING


	###
	### READING_UNIFIED
	###

	if (content_area=="READING_UNIFIED" & testing.window=="FALL") {### READING_UNIFIED/FALL
		if (score.type=="RASCH") tmp.content_area.name <- "READING_UNIFIED_RASCH" else tmp.content_area.name <- "READING_UNIFIED"
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 3))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 3))))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END READING_UNIFIED/FALL

	if (content_area=="READING_UNIFIED" & testing.window=="WINTER") {### READING_UNIFIED/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- "READING_UNIFIED_RASCH" else tmp.content_area.name <- "READING_UNIFIED"
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END READING_UNIFIED/WINTER

	if (content_area=="READING_UNIFIED" & testing.window=="SPRING") {### READING_UNIFIED/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- "READING_UNIFIED_RASCH" else tmp.content_area.name <- "READING_UNIFIED"
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 3))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END READING_UNIFIED/SPRING


	###
	### EARLY_LITERACY_SPANISH
	###

	if (content_area=="EARLY_LITERACY_SPANISH" & testing.window=="FALL") {### EARLY_LITERACY_SPANISH/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1')),
#				sgp.grade.sequences=list(c('PK.1', 'K.1'), c('PK.1', 'K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 3))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), "NO_PERCENTILES", "NO_PERCENTILES"),
#				sgp.grade.sequences=list(c('PK.2', 'PK.3', 'K.1'), c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), "NO_PERCENTILES"),
				sgp.projection.baseline.grade.sequences=list('PK.1', c('PK.3', 'K.1'), c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1')),
#				sgp.projection.baseline.grade.sequences=list('PK.1', c('PK.3', 'K.1'), c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY_SPANISH/FALL

	if (content_area=="EARLY_LITERACY_SPANISH" & testing.window=="WINTER") {### EARLY_LITERACY_SPANISH/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), "NO_PERCENTILES"),
#				sgp.grade.sequences=list(c('PK.1', 'PK.2'), c('PK.3', 'K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2')),
				sgp.projection.baseline.grade.sequences=list(c('PK.1', 'PK.2'), c('K.1', 'K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY_SPANISH/WINTER

	if (content_area=="EARLY_LITERACY_SPANISH" & testing.window=="SPRING") {### EARLY_LITERACY_SPANISH/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3')),
#				sgp.grade.sequences=list(c('PK.3', 'K.3'), c('PK.3', 'K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 2))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3')),
#				sgp.grade.sequences=list(c('PK.1', 'PK.3'), c('PK.3', 'K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 4))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 5))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3')),
#				sgp.grade.sequences=list(c('PK.1', 'PK.2', 'PK.3'), c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3')),
				sgp.projection.baseline.grade.sequences=list(c('PK.2', 'PK.3'), c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3')),
#				sgp.projection.baseline.grade.sequences=list(c('PK.2', 'PK.3'), c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END EARLY_LITERACY_SPANISH/SPRING

	###
	### MATHEMATICS_SPANISH
	###

	if (content_area=="MATHEMATICS_SPANISH" & testing.window=="FALL") {### MATHEMATICS_SPANISH/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('K.1', '1.1'), c('1.1', '2.1'),c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1')),
#				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1'), c('7.1', '8.1', '9.1'), c('8.1', '9.1', '10.1'), c('9.1', '10.1', '11.1'), c('10.1', '11.1', '12.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 8))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), "NO_PERCENTILES"),
#				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1'), "NO_PERCENTILES"),
				sgp.projection.baseline.grade.sequences=list('1.1', c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1')),
#				sgp.projection.baseline.grade.sequences=list('K.1', c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END MATHEMATICS_SPANISH/FALL

	if (content_area=="MATHEMATICS_SPANISH" & testing.window=="WINTER") {### MATHEMATICS_SPANISH/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2')),
#				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2')),
#				sgp.projection.baseline.grade.sequences=list(c('K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END MATHEMATICS_SPANISH/WINTER

	if (content_area=="MATHEMATICS_SPANISH" & testing.window=="SPRING") {### MATHEMATICS_SPANISH/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('6.3', '7.3', '8.3')),
#				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', '7.3', '8.3'), c('7.3', '8.3', '9.3'), c('8.3', '9.3', '10.3'), c('9.3', '10.3', '11.3'), c('10.3', '11.3', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 6))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
#				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3'), c('8.3', '9.1', '9.3'), c('9.3', '10.1', '10.3'), c('10.3', '11.1', '11.3'), c('11.3', '12.1', '12.3')),
				sgp.grade.sequences=list(c('1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 8))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 13))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3')),
#				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), "NO_PROJECTIONS"),
#				sgp.projection.baseline.grade.sequences=list(c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END MATHEMATICS_SPANISH/SPRING

	###
	### READING_SPANISH
	###

	if (content_area=="READING_SPANISH" & testing.window=="FALL") {### READING_SPANISH/FALL
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "1", sep="."), paste(yearIncrement(year, -1), "1", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1')),
#				sgp.grade.sequences=list(c('K.1', '1.1'), c('K.1', '1.1', '2.1'), c('1.1', '2.1', '3.1'), c('2.1', '3.1', '4.1'), c('3.1', '4.1', '5.1'), c('4.1', '5.1', '6.1'), c('5.1', '6.1', '7.1'), c('6.1', '7.1', '8.1'), c('7.1', '8.1', '9.1'), c('8.1', '9.1', '10.1'), c('9.1', '10.1', '11.1'), c('10.1', '11.1', '12.1')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 7))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1')),
#				sgp.grade.sequences=list(c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1'), "NO_PERCENTILES"),
				sgp.projection.baseline.grade.sequences=list('1.1', c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1')),
#				sgp.projection.baseline.grade.sequences=list('K.1', c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("FF.config", "WSF.config"), sep=".")
		return(tmp.list)
	} ### END READING_SPANISH/FALL

	if (content_area=="READING_SPANISH" & testing.window=="WINTER") {### READING_SPANISH/WINTER
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2')),
#				sgp.grade.sequences=list(c('K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2')),
#				sgp.projection.baseline.grade.sequences=list(c('K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, "SFW.config", sep=".")
		return(tmp.list)
	} ### END READING_SPANISH/WINTER

	if (content_area=="READING_SPANISH" & testing.window=="SPRING") {### READING_SPANISH/SPRING
		if (score.type=="RASCH") tmp.content_area.name <- paste(content_area, "RASCH", sep="_") else tmp.content_area.name <- content_area
		tmp.list <- list(
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -2), "3", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', 	'7.3', '8.3')),
#				sgp.grade.sequences=list(c('K.3', '1.3'), c('K.3', '1.3', '2.3'), c('1.3', '2.3', '3.3'), c('2.3', '3.3', '4.3'), c('3.3', '4.3', '5.3'), c('4.3', '5.3', '6.3'), c('5.3', '6.3', '7.3'), c('6.3', 	'7.3', '8.3'), c('7.3', '8.3', '9.3'), c('8.3', '9.3', '10.3'), c('9.3', '10.3', '11.3'), c('10.3', '11.3', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 7))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 12))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3')),
#				sgp.grade.sequences=list(c('K.1', 'K.3'), c('K.3', '1.1', '1.3'), c('1.3', '2.1', '2.3'), c('2.3', '3.1', '3.3'), c('3.3', '4.1', '4.3'), c('4.3', '5.1', '5.3'), c('5.3', '6.1', '6.3'), c('6.3', '7.1', '7.3'), c('7.3', '8.1', '8.3'), c('8.3', '9.1', '9.3'), c('9.3', '10.1', '10.3'), c('10.3', '11.1', '11.3'), c('11.3', '12.1', '12.3')),
				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 8))),
#				sgp.projection.baseline.grade.sequences=as.list(rep("NO_PROJECTIONS", 13))),
			list(
				sgp.content.areas=c(tmp.content_area.name, tmp.content_area.name, tmp.content_area.name),
				sgp.projection.baseline.content.areas=c(tmp.content_area.name, tmp.content_area.name),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3')),
#				sgp.grade.sequences=list(c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), "NO_PROJECTIONS"),
#				sgp.projection.baseline.grade.sequences=list(c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence=paste(tmp.content_area.name, "FWS", sep="_")))
			names(tmp.list) <- paste(tmp.content_area.name, c("SS.config", "FS.config", "FWS.config"), sep=".")
		return(tmp.list)
	} ### END READING_SPANISH/SPRING
} ### END configSGP
