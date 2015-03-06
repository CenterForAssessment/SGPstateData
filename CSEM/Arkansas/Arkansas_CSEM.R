##########################################################################
###
### Script for construct Arkansas_CSEM.Rdata
###
##########################################################################

### Load packages

require(data.table)


### Load data

Arkansas_CSEM <- as.data.table(read.csv("Base_Files/Arkansas_CSEMs_2009_2014.csv"))


### Final tidying up

Arkansas_CSEM[,YEAR:=as.character(YEAR)]
Arkansas_CSEM[,GRADE:=as.character(GRADE)]
Arkansas_CSEM[,CONTENT_AREA:=as.character(CONTENT_AREA)]
Arkansas_CSEM[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arkansas_CSEM[,SCALE_SCORE_CSEM:=as.numeric(SCALE_SCORE_CSEM)]


### Save output

save(Arkansas_CSEM, file="Arkansas_CSEM.Rdata")
