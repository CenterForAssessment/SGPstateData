###########################################################################################
###
### File to create CSEM data set for MCAS 2012
###
###########################################################################################

### Load SGP package

### Load data

ELA_CSEM <- read.delim("ELA_GALL_2012.txt")
MATH_CSEM_G3 <- read.delim("MATH_G3_2012.txt")
MATH_CSEM_G4 <- read.delim("MATH_G4_2012.txt")
MATH_CSEM_G5 <- read.delim("MATH_G5_2012.txt")
MATH_CSEM_G6 <- read.delim("MATH_G6_2012.txt")
MATH_CSEM_G7 <- read.delim("MATH_G7_2012.txt")
MATH_CSEM_G8 <- read.delim("MATH_G8_2012.txt")
MATH_CSEM_G10 <- read.delim("MATH_G10_2012.txt")

MATH_CSEM <- rbind(MATH_CSEM_G3, MATH_CSEM_G4, MATH_CSEM_G5, MATH_CSEM_G6, MATH_CSEM_G7, MATH_CSEM_G8, MATH_CSEM_G10)

load("Massachusetts_CSEM_OLD.Rdata")

names(ELA_CSEM) <- toupper(names(ELA_CSEM))
names(MATH_CSEM) <- toupper(names(MATH_CSEM))


### Select out necessary variables

my.variables <- c("GRADE", "SUBJECT", "GROWTHTHETA", "STANDARDERRORTHETA")
ELA_CSEM <- subset(ELA_CSEM, !is.na(GRADE), select=my.variables)
MATH_CSEM <- subset(MATH_CSEM, !is.na(GRADE), select=my.variables)


### Rename

names(ELA_CSEM) <- names(MATH_CSEM) <- c("GRADE", "CONTENT_AREA", "SCALE_SCORE", "SCALE_SCORE_CSEM")
ELA_CSEM$CONTENT_AREA <- "ELA"
MATH_CSEM$CONTENT_AREA <- "MATHEMATICS"

### Rescale CSEMs to Growth Theta Scale

MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==3] <- 0.957*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==3]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==4] <- 0.676*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==4]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==5] <- 1*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==5]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==6] <- 1.191*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==6]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==7] <- 1.18*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==7]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==8] <- 1.201*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==8]/sqrt(2)
MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==10] <- 2.014*MATH_CSEM$SCALE_SCORE_CSEM[MATH_CSEM$GRADE==10]/sqrt(2)

ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==3] <- 0.885*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==3]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==4] <- 1.079*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==4]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==5] <- 1*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==5]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==6] <- 1.169*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==6]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==7] <- 1.13*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==7]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==8] <- 1.251*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==8]/sqrt(2)
ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==10] <- 1.613*ELA_CSEM$SCALE_SCORE_CSEM[ELA_CSEM$GRADE==10]/sqrt(2)


### Combine into single file

MCAS_CSEM_2012 <- rbind(ELA_CSEM, MATH_CSEM)


### Function to plot data (test)

plot.csem <- function(grade, content_area, my.data=MCAS_CSEM_2012) {
	old_csem_mcas <- SGPstateData$MA$Assessment_Program_Information$CSEM
	attach(old_csem_mcas)
		plot(SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area], SCALE_SCORE_CSEM[GRADE==grade & CONTENT_AREA==content_area]) 
	detach(old_csem_mcas) 
	attach(my.data)
		points(SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area], SCALE_SCORE_CSEM[GRADE==grade & CONTENT_AREA==content_area], col="red")
	detach(my.data)
}


### Create baseline CSEMs from annual CSEMs

baseline.csem <- function(data1, data2, content_area, grade) {
	attach(data1)
		min1 <- min(c(-10, SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area]), na.rm=TRUE)
		max1 <- max(c(10, SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area]), na.rm=TRUE)
		splinefun1 <- splinefun(SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area], SCALE_SCORE_CSEM[GRADE==grade & CONTENT_AREA==content_area], method="natural")
	detach(data1)
	attach(data2)
		min2 <- min(c(-10, SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area]), na.rm=TRUE)
		max2 <- max(c(10, SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area]), na.rm=TRUE)
		splinefun2 <- splinefun(SCALE_SCORE[GRADE==grade & CONTENT_AREA==content_area], SCALE_SCORE_CSEM[GRADE==grade & CONTENT_AREA==content_area], method="natural")
	detach(data2)
	min.scale_score <- min(min1, min2)
	max.scale_score <- max(max1, max2)
	my.seq <- seq(min.scale_score, max.scale_score, by=0.1)
	baseline.csems <- sqrt(pmin(splinefun1(my.seq), splinefun2(my.seq)))/2
	return(data.frame(CONTENT_AREA=content_area, GRADE=grade, SCALE_SCORE=my.seq, SCALE_SCORE_CSEM=baseline.csems))
}

### Create file

tmp.list <- list()

for (i in c("ELA", "MATHEMATICS")) {
	for (j in c(3:8, 10)) {
		tmp.list[[paste(i, j, sep="_")]] <- baseline.csem(Massachusetts_CSEM_OLD, MCAS_CSEM_2012, i, j)
	}
}

Massachusetts_CSEM <- do.call(rbind, tmp.list)
rownames(Massachusetts_CSEM) <- NULL
Massachusetts_CSEM$YEAR <- "BASELINE"
Massachusetts_CSEM <- Massachusetts_CSEM[,c("YEAR", "CONTENT_AREA", "GRADE", "SCALE_SCORE", "SCALE_SCORE_CSEM")]

save(Massachusetts_CSEM, file="../Massachusetts_CSEM.Rdata")
