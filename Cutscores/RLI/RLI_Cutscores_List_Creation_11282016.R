library(data.table)

###  Read in the cutscore long data file
rli.cs.long <- fread('Base_Files/cutscores_including_unlinked_grades_11282016.txt')

###  Reshape the long file into a wide file
rli.cs <- reshape(rli.cs.long, timevar= 'ProficiencyLevel', idvar=c('StateTest', 'Subject', 'Grade'), direction='wide', drop=c("vchRegionCode", "vchProficiency", "MaxSS", "linked", "ProfFlag"))#, "ProficiencyLevelName"

###  Clean up variable names and values to correspond with SGP package conventions
rli.cs[which(Subject=="Reading"), Subject := "READING"]
rli.cs[which(Subject=="Math"), Subject := "MATHEMATICS"]

setnames(rli.cs, c('StateTest', "Subject", "Grade"), c('STATE', "CONTENT_AREA", "GRADE"))


###  Run nested loop to create a text object that can be output as text to the console.
###  This is then copied and pasted (and cleaned slightly) into the RLI_Cutscores.R file

tmp.list.state <- list()
for (state in unique(rli.cs$STATE)) {
	tmp.list.ca <- list()

	for (ca in c("MATHEMATICS", "READING")) {
		x <- rli.cs[STATE == state & CONTENT_AREA == ca]
		if (dim(x)[1] == 0) next
		tmp.list.grd <- list()
		fall.tf <- spring.tf <- TRUE
		if (length(grep("Fall", state)) > 0) {
			tmp.state <- gsub(" Fall", "", state); spring.tf <- FALSE
		} else tmp.state <- state
		if (length(grep("Spring", state)) > 0) {
			fall.tf <- FALSE # Leave state name with "Spring" in it to help find it in the list text later
		}
		tmp.list.name <- paste(ca, tmp.state, sep=".")

		for (g in x$GRADE) {
			tmp.list.grd <- c(tmp.list.grd,
				if (fall.tf) paste("\t\tGRADE_", g, ".1=c(", x[GRADE==g]$MinSS.2, ", ", x[GRADE==g]$MinSS.3, ", ", x[GRADE==g]$MinSS.4, ", ", x[GRADE==g]$MinSS.5, ")", sep=""),
				if (fall.tf) paste("\t\tGRADE_", g, ".2=c(", x[GRADE==g]$MinSS.2, ", ", x[GRADE==g]$MinSS.3, ", ", x[GRADE==g]$MinSS.4, ", ", x[GRADE==g]$MinSS.5, ")", sep=""),
				if (spring.tf) paste("\t\tGRADE_", g, ".3=c(", x[GRADE==g]$MinSS.2, ", ", x[GRADE==g]$MinSS.3, ", ", x[GRADE==g]$MinSS.4, ", ", x[GRADE==g]$MinSS.5, ")", sep=""))
		}
		tmp.list.ca <- c(tmp.list.ca, paste("\n\t", tmp.list.name, "=list(\n", paste(unlist(tmp.list.grd), collapse = ",\n "), ")", sep=""))
	}
	tmp.list.state <- c(tmp.list.state, paste(paste(unlist(tmp.list.ca), collapse = ","), ",\n", sep=""))
}

final.list <- gsub(", NA", "", unlist(tmp.list.state))

###  This will output the raw text to disk.

cat(c("\n\n\nSGPstateData[[\"RLI\"]][[\"Achievement\"]][[\"Cutscores\"]] <- list(", final.list, ")\n\n\n"), file="RLI_Cutscores_11282016.R")
