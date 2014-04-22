library(data.table)

###  Read in the cutscore long data file
rli.cs.long <- data.table(read.table('cutscores_including_unlinked_grades.txt', header=T, sep='\t', stringsAsFactors=FALSE))

###  Read in the North Carolina updated/revised cutscores, and modify names to match original file above
nc.long <- data.table(read.table('~/New NC cutscores.txt', header=T, sep='\t', stringsAsFactors=FALSE))
setnames(nc.long, c("State", "iGradeLevelID", "iMinSS", "iMaxSS", "iProficiencyLevel", "vchProficiencyLevelName"), c("StateTest", "Grade", "MinSS", "MaxSS", "ProficiencyLevel", "ProficiencyLevelName"))
nc.long <- nc.long[,names(rli.cs.long), with=FALSE]

###  Remove the outdated NC cutscores
rli.cs.long <- rli.cs.long[-grep("NC", StateTest),]

###  Merge two cutscore data files
rli.cs.long <- rbind(rli.cs.long, nc.long)

###  Reshape the long file into a wide file
rli.cs <- reshape(rli.cs.long, timevar= 'ProficiencyLevel', idvar=c('StateTest', 'Subject', 'Grade'), direction='wide', drop=c("vchRegionCode", "MaxSS", "Linked"))#, "ProficiencyLevelName"

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

###  This will output the raw text to the console.

simpleMessage(c("\n\n\nSGPstateData[[\"RLI\"]][[\"Achievement\"]][[\"Cutscores\"]] <- list(", final.list, ")\n\n\n"))

####
##  Copy and paste output (evertying between "<simpleMessage:" and the final ">") into proper list: SGPstateData[["RLI"]][["Achievement"]][["Cutscores"]] <- list( ...  )
##  Consolidate entry for States with "Spring" still in the state name (all grade = *.3) -- Add the second entry content to the first entry list
####


# SGPstateData[["RLI"]][["Achievement"]][["Cutscores"]] <- list(

###  Generic Cutscores.  NOTE:  These are arbitrary dummies set up for testing.

	...

###  State Specific Cuts:
		
	# READING.AK=list(
		# GRADE_1.1=c(67, 83, 184),
 		# GRADE_1.2=c(67, 83, 184),
 		# GRADE_1.3=c(67, 83, 184),
 		# GRADE_2.1=c(95, 191, 342),

	# ...

 		# GRADE_11.1=c(797, 1127, 1327),
 		# GRADE_11.2=c(797, 1127, 1327),
 		# GRADE_11.3=c(797, 1127, 1327),
 		# GRADE_12.1=c(834, 1184, 1339),
 		# GRADE_12.2=c(834, 1184, 1339),
 		# GRADE_12.3=c(834, 1184, 1339)))


###
###
###


###  Consolidate entry for States with "Spring" still in the state name (all grade = *.3) -- Add the second entry content to the first entry list
###  Here is an example of what I mean:

### The original text output will look something like this:

	READING.ND=list(
		GRADE_1.1=c(55, 71, 186),
 		GRADE_1.2=c(55, 71, 186),
 		GRADE_2.1=c(73, 139, 332),
 		GRADE_2.2=c(73, 139, 332),
 		GRADE_3.1=c(105, 264, 487),
 		GRADE_3.2=c(105, 264, 487),
 		GRADE_4.1=c(262, 390, 608),
 		GRADE_4.2=c(262, 390, 608),
 		GRADE_5.1=c(326, 489, 832),
 		GRADE_5.2=c(326, 489, 832),
 		GRADE_6.1=c(376, 541, 920),
 		GRADE_6.2=c(376, 541, 920),
 		GRADE_7.1=c(471, 608, 1050),
 		GRADE_7.2=c(471, 608, 1050),
 		GRADE_8.1=c(530, 719, 1201),
 		GRADE_8.2=c(530, 719, 1201),
 		GRADE_9.1=c(602, 838, 1291),
 		GRADE_9.2=c(602, 838, 1291),
 		GRADE_10.1=c(664, 903, 1315),
 		GRADE_10.2=c(664, 903, 1315),
 		GRADE_11.1=c(685, 924, 1324),
 		GRADE_11.2=c(685, 924, 1324),
 		GRADE_12.1=c(721, 966, 1331),
 		GRADE_12.2=c(721, 966, 1331)),

	READING.ND Spring=list(
		GRADE_1.3=c(71, 106, 279),
 		GRADE_2.3=c(104, 257, 452),
 		GRADE_3.3=c(228, 377, 551),
 		GRADE_4.3=c(298, 482, 759),
 		GRADE_5.3=c(344, 524, 838),
 		GRADE_6.3=c(470, 600, 982),
 		GRADE_7.3=c(528, 705, 1109),
 		GRADE_8.3=c(596, 826, 1251),
 		GRADE_9.3=c(683, 908, 1298),
 		GRADE_10.3=c(701, 932, 1316),
 		GRADE_11.3=c(747, 970, 1324),
 		GRADE_12.3=c(784, 1036, 1335)),

###
###  Change the entry to this:
###
	READING.ND=list(
		GRADE_1.1=c(55, 71, 186),
 		GRADE_1.2=c(55, 71, 186),
 		GRADE_2.1=c(73, 139, 332),
 		GRADE_2.2=c(73, 139, 332),
 		GRADE_3.1=c(105, 264, 487),
 		GRADE_3.2=c(105, 264, 487),
 		GRADE_4.1=c(262, 390, 608),
 		GRADE_4.2=c(262, 390, 608),
 		GRADE_5.1=c(326, 489, 832),
 		GRADE_5.2=c(326, 489, 832),
 		GRADE_6.1=c(376, 541, 920),
 		GRADE_6.2=c(376, 541, 920),
 		GRADE_7.1=c(471, 608, 1050),
 		GRADE_7.2=c(471, 608, 1050),
 		GRADE_8.1=c(530, 719, 1201),
 		GRADE_8.2=c(530, 719, 1201),
 		GRADE_9.1=c(602, 838, 1291),
 		GRADE_9.2=c(602, 838, 1291),
 		GRADE_10.1=c(664, 903, 1315),
 		GRADE_10.2=c(664, 903, 1315),
 		GRADE_11.1=c(685, 924, 1324),
 		GRADE_11.2=c(685, 924, 1324),
 		GRADE_12.1=c(721, 966, 1331),
 		GRADE_12.2=c(721, 966, 1331), ###  Remove close parens here

	###  Remove "READING.ND Spring=list(" line
		GRADE_1.3=c(71, 106, 279),
 		GRADE_2.3=c(104, 257, 452),
 		GRADE_3.3=c(228, 377, 551),
 		GRADE_4.3=c(298, 482, 759),
 		GRADE_5.3=c(344, 524, 838),
 		GRADE_6.3=c(470, 600, 982),
 		GRADE_7.3=c(528, 705, 1109),
 		GRADE_8.3=c(596, 826, 1251),
 		GRADE_9.3=c(683, 908, 1298),
 		GRADE_10.3=c(701, 932, 1316),
 		GRADE_11.3=c(747, 970, 1324),
 		GRADE_12.3=c(784, 1036, 1335)), ###  The final parens should close the READING.ND loop here


