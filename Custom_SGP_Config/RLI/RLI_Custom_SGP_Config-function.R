`configSGP` <- 
function(year,
	 content_area,
	 testing.window,
         SGPt=NULL) {

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
		tmp.list <- list(
			EARLY_LITERACY.WSF.config=list(
				sgp.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.projection.baseline.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('PK.2', 'PK.3', 'K.1'), c('K.2', 'K.3', '1.1'), c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1')),
				sgp.projection.baseline.grade.sequences=list(c('PK.3', 'K.1'), c('K.3', '1.1'), c('1.3', '2.1'), c('2.3', '3.1')),
				sgp.projection.sequence="EARLY_LITERACY_FWS"))
		return(tmp.list)
	} ### END EARLY_LITERACY/FALL

	if (content_area=="EARLY_LITERACY" & testing.window=="WINTER") {### EARLY_LITERACY/WINTER
		tmp.list <- list(
			EARLY_LITERACY.SFW.config=list(
				sgp.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.projection.baseline.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'PK.2'), c('PK.3', 'K.1', 'K.2'), c('K.3', '1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2')),
				sgp.projection.baseline.grade.sequences=list(c('PK.1', 'PK.2'), c('K.1', 'K.2'), c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2')),
				sgp.projection.sequence="EARLY_LITERACY_FWS"))
		return(tmp.list)
	} ### END EARLY_LITERACY/WINTER

	if (content_area=="EARLY_LITERACY" & testing.window=="SPRING") {### EARLY_LITERACY/SPRING
		tmp.list <- list(
			EARLY_LITERACY.FWS.config=list(
				sgp.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.projection.baseline.content.areas=c('EARLY_LITERACY', 'EARLY_LITERACY'),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('PK.1', 'PK.2', 'PK.3'), c('K.1', 'K.2', 'K.3'), c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3')),
				sgp.projection.baseline.grade.sequences=list(c('PK.2', 'PK.3'), c('K.2', 'K.3'), c('1.2', '1.3'), c('2.2', '2.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence="EARLY_LITERACY_FWS"))
		return(tmp.list)
	} ### END EARLY_LITERACY/SPRING


	###
	### MATHEMATICS
	###

	if (content_area=="MATHEMATICS" & testing.window=="FALL") {### MATHEMATICS/FALL
		tmp.list <- list(
			MATHEMATICS.WSF.config=list(
				sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
				sgp.projection.baseline.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1')),
				sgp.projection.baseline.grade.sequences=list(c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence="MATHEMATICS_FWS"))
		return(tmp.list)
	} ### END MATHEMATICS/FALL

	if (content_area=="MATHEMATICS" & testing.window=="WINTER") {### MATHEMATICS/WINTER
		tmp.list <- list(
			MATHEMATICS.SFW.config=list(
				sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
				sgp.projection.baseline.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence="MATHEMATICS_FWS"))
		return(tmp.list)
	} ### END MATHEMATICS/WINTER

	if (content_area=="MATHEMATICS" & testing.window=="SPRING") {### MATHEMATICS/SPRING
		tmp.list <- list(
			MATHEMATICS.FWS.config=list(
				sgp.content.areas=c('MATHEMATICS', 'MATHEMATICS', 'MATHEMATICS'),
				sgp.projection.baseline.content.areas=c('MATHEMATICS', 'MATHEMATICS'),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence="MATHEMATICS_FWS"))
		return(tmp.list)
	} ### END MATHEMATICS/SPRING 


	###
	### READING
	###

	if (content_area=="READING" & testing.window=="FALL") {### READING/FALL
		tmp.list <- list(
			READING.WSF.config=list(
				sgp.content.areas=c('READING', 'READING', 'READING'),
				sgp.projection.baseline.content.areas=c('READING', 'READING'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, -1), "2", sep="."), paste(yearIncrement(year, 0), "1", sep=".")),
				sgp.grade.sequences=list(c('1.2', '1.3', '2.1'), c('2.2', '2.3', '3.1'), c('3.2', '3.3', '4.1'), c('4.2', '4.3', '5.1'), c('5.2', '5.3', '6.1'), c('6.2', '6.3', '7.1'), c('7.2', '7.3', '8.1'), c('8.2', '8.3', '9.1'), c('9.2', '9.3', '10.1'), c('10.2', '10.3', '11.1'), c('11.2', '11.3', '12.1')),
				sgp.projection.baseline.grade.sequences=list(c('1.3', '2.1'), c('2.3', '3.1'), c('3.3', '4.1'), c('4.3', '5.1'), c('5.3', '6.1'), c('6.3', '7.1'), c('7.3', '8.1'), c('8.3', '9.1'), c('9.3', '10.1'), c('10.3', '11.1'), c('11.3', '12.1')),
				sgp.projection.sequence="READING_FWS"))
		return(tmp.list)
	} ### END READING/FALL

	if (content_area=="READING" & testing.window=="WINTER") {### READING/WINTER
		tmp.list <- list(
			READING.SFW.config=list(
				sgp.content.areas=c('READING', 'READING', 'READING'),
				sgp.projection.baseline.content.areas=c('READING', 'READING'),
				sgp.panel.years=c(paste(yearIncrement(year, -1), "3", sep="."), paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2'), c('1.3', '2.1', '2.2'), c('2.3', '3.1', '3.2'), c('3.3', '4.1', '4.2'), c('4.3', '5.1', '5.2'), c('5.3', '6.1', '6.2'), c('6.3', '7.1', '7.2'), c('7.3', '8.1', '8.2'), c('8.3', '9.1', '9.2'), c('9.3', '10.1', '10.2'), c('10.3', '11.1', '11.2'), c('11.3', '12.1', '12.2')),
				sgp.projection.baseline.grade.sequences=list(c('1.1', '1.2'), c('2.1', '2.2'), c('3.1', '3.2'), c('4.1', '4.2'), c('5.1', '5.2'), c('6.1', '6.2'), c('7.1', '7.2'), c('8.1', '8.2'), c('9.1', '9.2'), c('10.1', '10.2'), c('11.1', '11.2'), c('12.1', '12.2')),
				sgp.projection.sequence="READING_FWS"))
		return(tmp.list)
	} ### END READING/WINTER

	if (content_area=="READING" & testing.window=="SPRING") {### READING/SPRING
		tmp.list <- list(
			READING.FWS.config=list(
				sgp.content.areas=c('READING', 'READING', 'READING'),
				sgp.projection.baseline.content.areas=c('READING', 'READING'),
				sgp.panel.years=c(paste(yearIncrement(year, 0), "1", sep="."), paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.projection.baseline.panel.years=c(paste(yearIncrement(year, 0), "2", sep="."), paste(yearIncrement(year, 0), "3", sep=".")),
				sgp.grade.sequences=list(c('1.1', '1.2', '1.3'), c('2.1', '2.2', '2.3'), c('3.1', '3.2', '3.3'), c('4.1', '4.2', '4.3'), c('5.1', '5.2', '5.3'), c('6.1', '6.2', '6.3'), c('7.1', '7.2', '7.3'), c('8.1', '8.2', '8.3'), c('9.1', '9.2', '9.3'), c('10.1', '10.2', '10.3'), c('11.1', '11.2', '11.3'), c('12.1', '12.2', '12.3')),
				sgp.projection.baseline.grade.sequences=list(c('1.2', '1.3'), c('2.2', '2.3'), c('3.2', '3.3'), c('4.2', '4.3'), c('5.2', '5.3'), c('6.2', '6.3'), c('7.2', '7.3'), c('8.2', '8.3'), c('9.2', '9.3'), c('10.2', '10.3'), c('11.2', '11.3'), "NO_PROJECTIONS"),
				sgp.projection.sequence="READING_FWS"))
		return(tmp.list)
	} ### END READING/SPRING 
} ### END configSGP
