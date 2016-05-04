require(foreign)
require(data.table)

PARCC_Cuts <- as.data.table(read.spss("Base_Files/Scale Boundaries.sav", to.data.frame=TRUE, trim.factor.names = TRUE))
load("Massachusetts/PARCC/Data/Massachusetts_Data_LONG_2015.Rdata")

setkeyv(Massachusetts_Data_LONG_2015, c("CONTENT_AREA", "GRADE", "SCALE_SCORE_ACTUAL", "SCALE_SCORE"))
MA_PARCC_LINKAGE <- unique(Massachusetts_Data_LONG_2015[VALID_CASE=="VALID_CASE"][, key(Massachusetts_Data_LONG_2015), with=FALSE])
# MA_PARCC[which(CONTENT_AREA=="ALGEBRA_I"), GRADE := "EOCT"]
MA_PARCC_LINKAGE <- rbind(MA_PARCC_LINKAGE, MA_PARCC_LINKAGE[CONTENT_AREA=="ALGEBRA_I"][, GRADE := "EOCT"])
save(MA_PARCC_LINKAGE, file="~/Dropbox/SGP/Massachusetts/PARCC/Data/MA_PARCC_LINKAGE.Rdata")

trimWhiteSpace <- function(line) gsub("(^ +)|( +$)", "", line)

SS_Cuts <- PARCC_Cuts[, list(Grade_Subject, Range_Name, Low_Cut, High_Cut)]
SS_Cuts[, Grade_Subject := toupper(trimWhiteSpace(Grade_Subject))]
SS_Cuts[, SCALE_SCORE_ACTUAL := Low_Cut]

SS_Cuts[, CONTENT_AREA := as.character(Grade_Subject)]
SS_Cuts[grep("ELA", CONTENT_AREA), CONTENT_AREA := "ELA"]
SS_Cuts[grep("MATHEMATICS", CONTENT_AREA), CONTENT_AREA := "MATHEMATICS"]
SS_Cuts[grep("ALGEBRA 1", CONTENT_AREA), CONTENT_AREA := "ALGEBRA_I"]

# tmp.grade <- strsplit(as.character(gsub("INTEGRATED ", "", SS_Cuts$Grade_Subject)), " ")
tmp.grade <- strsplit(as.character(SS_Cuts$Grade_Subject), " ")
grade <- sapply(tmp.grade, function(x) x[2])
SS_Cuts[, GRADE := grade]
SS_Cuts[which(!CONTENT_AREA %in% c("ELA", "MATHEMATICS")), GRADE := "EOCT"]

###  Merge in Theta Scores

setnames(MA_PARCC_LINKAGE, "SCALE_SCORE", "Theta")
setkey(SS_Cuts, CONTENT_AREA, GRADE, SCALE_SCORE_ACTUAL)
setkey(MA_PARCC_LINKAGE, CONTENT_AREA, GRADE, SCALE_SCORE_ACTUAL)

cuts <- merge(SS_Cuts, MA_PARCC_LINKAGE, all.x = TRUE)

cuts[CONTENT_AREA == "ALGEBRA_I" & SCALE_SCORE_ACTUAL == 750][which.min(Theta)]
z <- Massachusetts_Data_LONG_2015[VALID_CASE=="VALID_CASE" & CONTENT_AREA == "ALGEBRA_I" & SCALE_SCORE_ACTUAL==750]

# within.theta <- MA_PARCC_LINKAGE[, as.list(summary(SCALE_SCORE_ACTUAL)), keyby=c("CONTENT_AREA", "GRADE","Theta")]
# within.theta[, Diff := Max.-Min.]
# summary(within.theta$Diff)

###  Check Thetas for SCALE_SCORE directly below
within.ss <- Massachusetts_Data_LONG_2015[, as.list(summary(SCALE_SCORE)), keyby=c("CONTENT_AREA", "GRADE","SCALE_SCORE_ACTUAL")]
within.ss <- Massachusetts_Data_LONG_2015[VALID_CASE=="VALID_CASE"][, as.list(summary(SCALE_SCORE)), keyby=c("CONTENT_AREA", "GRADE","SCALE_SCORE_ACTUAL")]
SS_Cutdown <- SS_Cuts[, c('CONTENT_AREA', 'GRADE', 'Range_Name', 'Low_Cut'), with=FALSE]
SS_Cutdown[which(CONTENT_AREA=="ALGEBRA_I"), GRADE := '8']
SS_Cutdown <- SS_Cutdown[-which(Range_Name=="Level 1 Range")]
SS_Cutdown[, COMBO := paste(CONTENT_AREA, GRADE, as.numeric(Range_Name), sep=":")]
setkey(SS_Cutdown, CONTENT_AREA, GRADE)
setkey(within.ss, CONTENT_AREA, GRADE)

under.over <- merge(SS_Cutdown, within.ss[, c('CONTENT_AREA', 'GRADE', 'SCALE_SCORE_ACTUAL', 'Min.', 'Max.'), with=FALSE], allow.cartesian=TRUE)
under.over[CONTENT_AREA == "ALGEBRA_I" & SCALE_SCORE_ACTUAL == 750]
under.over[, UNDER_OVER := 0]
under.over[which(SCALE_SCORE_ACTUAL == Low_Cut), UNDER_OVER := 2]
under.over[which(SCALE_SCORE_ACTUAL == Low_Cut)-1, UNDER_OVER := 1]
under.over <- under.over[c(which(SCALE_SCORE_ACTUAL == Low_Cut)-1, which(SCALE_SCORE_ACTUAL == Low_Cut)),]

setkey(under.over, CONTENT_AREA, GRADE, Low_Cut)
under.over[CONTENT_AREA == "ALGEBRA_I" & COMBO == 'ALGEBRA_I:8:5']
under.over[, c('Range_Name', 'Low_Cut') := NULL]
under.over.wide <- dcast(under.over,  COMBO ~ UNDER_OVER, value.var=c('Min.', "Max."))
under.over.wide[, `Oh_$#!+_TF` := Max._1 > Min._2]
table(under.over.wide[, `Oh_$#!+_TF`]) # ALL FALSE :) HooRah!!!


###  Finish cutscore biding/reshaping and export
min.theta <- rbind(
	cuts[, list(Theta=Theta[which.min(Theta)], Range_Name=Range_Name[which.min(Theta)], Grade_Subject=Grade_Subject[which.min(Theta)]), by=c("CONTENT_AREA", "GRADE","SCALE_SCORE_ACTUAL")], 
	cuts[is.na(Theta), c("CONTENT_AREA", "GRADE","SCALE_SCORE_ACTUAL", "Theta", "Range_Name", "Grade_Subject"), with=FALSE])


parcc.cutscores <- dcast(min.theta, Grade_Subject ~ Range_Name, value.var=c('SCALE_SCORE_ACTUAL', "Theta"))[, -c(2, 7), with=FALSE]
parcc.cutscores[, Grade_Subject := gsub(" ", "_", Grade_Subject)]
parcc.cutscores[, Grade_Subject := gsub("ALGEBRA_1", "ALGEBRA_I", Grade_Subject)]
parcc.cutscores[, Grade_Subject := gsub("ALGEBRA_2", "ALGEBRA_II", Grade_Subject)]

final.theta <- unlist(sapply(c(1, grep("ELA", parcc.cutscores$Grade_Subject), grep("MATHEMATICS", parcc.cutscores$Grade_Subject)), 
			function(x) paste(parcc.cutscores[x,][,Grade_Subject], "=c(",  paste(parcc.cutscores[x,][,6:9, with=FALSE], collapse=", "), "),\n", sep="")))

final.ss <- unlist(sapply(c(grep("ELA", parcc.cutscores$Grade_Subject), grep("MATHEMATICS", parcc.cutscores$Grade_Subject), 1:3, 19:21), function(x)
	paste("# ", parcc.cutscores[x,][,Grade_Subject], "=c(",  paste(parcc.cutscores[x,][,2:5, with=FALSE], collapse=", "), "),\n", sep="")))

cat(c("\n\n\nSGPstateData[[\"MA_PARCC\"]][[\"Achievement\"]][[\"Cutscores\"]] <- list(\n", final.theta, final.ss, ")\n\n\n"), file="PARC_Cutscores.R", sep="")


###  First round before merging in Theta/SCALE_SCORE

SS_Cuts_Low <- dcast(SS_Cuts, Grade_Subject ~ Range_Name, value.var='Low_Cut')[, -2, with=FALSE]
# SS_Cuts_High <- dcast(SS_Cuts, Grade_Subject ~ Range_Name, value.var='High_Cut')[, -6, with=FALSE]
SS_Cuts_Low[, Grade_Subject := gsub(" ", "_", Grade_Subject)]
SS_Cuts_Low[, Grade_Subject := gsub("ALGEBRA_1", "ALGEBRA_I", Grade_Subject)]
SS_Cuts_Low[, Grade_Subject := gsub("ALGEBRA_2", "ALGEBRA_II", Grade_Subject)]
# SS_Cuts_Low[, Grade_Subject := gsub("1", "I", Grade_Subject)]
# SS_Cuts_Low[, Grade_Subject := gsub("I0", "10", Grade_Subject)]
# SS_Cuts_Low[, Grade_Subject := gsub("II", "11", Grade_Subject)]
# SS_Cuts_Low[, Grade_Subject := gsub("2", "II", Grade_Subject)]
# SS_Cuts_Low[, Grade_Subject := gsub("MATH_3", "MATH_III", Grade_Subject)]

LOSS_HOSS <- dcast(SS_Cuts, Grade_Subject ~ Range_Name, value.var=c('Low_Cut', 'High_Cut'))[, c(1,2,11), with=FALSE]

c(grep("ELA", SS_Cuts_Low$Grade_Subject), grep("MATHEMATICS", SS_Cuts_Low$Grade_Subject), 1:3, 19:21)

paste(unlist(sapply(c(grep("ELA", SS_Cuts_Low$Grade_Subject), grep("MATHEMATICS", SS_Cuts_Low$Grade_Subject), 1:3, 19:21), function(x)
			 paste(SS_Cuts_Low[x,][,Grade_Subject], "=c(",  paste(SS_Cuts_Low[x,][,2:5, with=FALSE], collapse=", "), ")", sep=""))), collapse=",\n ")

simpleMessage(sapply(c(grep("ELA", SS_Cuts_Low$Grade_Subject), grep("MATHEMATICS", SS_Cuts_Low$Grade_Subject), 1:3, 19:21), function(x)
	paste(SS_Cuts_Low[x,][,Grade_Subject], "=c(",  paste(SS_Cuts_Low[x,][,2:5, with=FALSE], collapse=", "), ")", sep="")))

final.list <- unlist(sapply(c(grep("ELA", SS_Cuts_Low$Grade_Subject), grep("MATHEMATICS", SS_Cuts_Low$Grade_Subject), 1:3, 19:21), function(x)
	paste(SS_Cuts_Low[x,][,Grade_Subject], "=c(",  paste(SS_Cuts_Low[x,][,2:5, with=FALSE], collapse=", "), "),", sep="")))

cat(c("\n\n\nSGPstateData[[\"MA_PARCC\"]][[\"Achievement\"]][[\"Cutscores\"]] <- list(", final.list, ")\n\n\n"), file="PARC_Cutscores.R", sep="")

