##########################################################
###
### Prepare NECAP CSEM file
###
##########################################################

require(data.table)
NECAP_CSEM <- read.csv("NECAP_CSEM.csv")
NECAP_CSEM_2011_2012 <- subset(NECAP_CSEM, YEAR=="2010_2011")
NECAP_CSEM_2011_2012$YEAR <- as.factor("2011_2012")
NECAP_CSEM <- data.table(rbind(NECAP_CSEM, NECAP_CSEM_2011_2012), key=c("YEAR", "GRADE", "CONTENT_AREA", "SCALE_SCORE"))
NECAP_CSEM <- unique(NECAP_CSEM)
NECAP_CSEM <- as.data.frame(NECAP_CSEM)
save(NECAP_CSEM, file="NECAP_CSEM.Rdata")
