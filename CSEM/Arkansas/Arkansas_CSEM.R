##########################################################################
###
### Script for construct Arkansas_CSEM.Rdata
###
##########################################################################

### Load packages

require(data.table)


### Load data

Arkansas_Benchmark_CSEMs <- as.data.table(read.csv("Base_Files/Arkansas_Benchmark_CSEM_2009_2014.csv"))
ITBS_CSEMs_TEMP <- as.data.table(read.csv("Base_Files/ITBS_CSEMs.csv"))


### Tidy up tables

Arkansas_Benchmark_CSEMs[['X']] <- NULL

ITBS_CSEMs <- rbindlist(list(ITBS_CSEMs_TEMP, ITBS_CSEMs_TEMP, ITBS_CSEMs_TEMP, ITBS_CSEMs_TEMP, ITBS_CSEMs_TEMP, ITBS_CSEMs_TEMP))
ITBS_CSEMs[,YEAR:=rep(as.character(2009:2014), each=dim(ITBS_CSEMs_TEMP)[1])]
setcolorder(ITBS_CSEMs, names(Arkansas_Benchmark_CSEMs))


### Stack CSEMs

Arkansas_CSEM <- rbindlist(list(ITBS_CSEMs, Arkansas_Benchmark_CSEMs))


### Final tidying up

Arkansas_CSEM[,YEAR:=as.character(YEAR)]
Arkansas_CSEM[,GRADE:=as.character(GRADE)]
Arkansas_CSEM[,CONTENT_AREA:=as.character(CONTENT_AREA)]
Arkansas_CSEM[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
Arkansas_CSEM[,SCALE_SCORE_CSEM:=as.numeric(SCALE_SCORE_CSEM)]


### Save output

save(Arkansas_CSEM, file="Arkansas_CSEM.Rdata")
