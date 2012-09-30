###################################################
###
### Construct 2011 update to Missouri CSEM file
###
###################################################

load("Missouri_CSEM.Rdata")
CSEM_2011 <- read.csv("CSEM_2011.csv")

CSEM_2011 <- subset(CSEM_2011, SCALE_SCORE_CSEM != 0)
CSEM_2011 <- subset(CSEM_2011, SCALE_SCORE != 1000)


Missouri_CSEM <- rbind(CSEM_2011, Missouri_CSEM)

### Save results

save(Missouri_CSEM, file="Missouri_CSEM.Rdata")






