####################################################################
####
#### File to create CSEM data set for Missouri
####
####################################################################


### Load data

load("Missouri_CSEM.Rdata")
CSEM_2006_to_2009 <- read.csv("CSEMs from 2006 to 2008/CSEM_2006_to_2009.csv")

### Clean up

CSEM_2006_to_2009 <- subset(CSEM_2006_to_2009, SCALE_SCORE_CSEM != 0)
CSEM_2006_to_2009 <- subset(CSEM_2006_to_2009, SCALE_SCORE != 1000)
CSEM_2006_to_2008 <- subset(CSEM_2006_to_2009, YEAR %in% 2006:2008)

### Merge annual data sets

Missouri_CSEM <- rbind(CSEM_2006_to_2008, Missouri_CSEM)


### Save results

save(Missouri_CSEM, file="Missouri_CSEM.Rdata")



