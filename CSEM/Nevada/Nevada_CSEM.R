
require(data.table)
Nevada_CSEM <- read.csv("CSEM.csv", header=FALSE)
names(Nevada_CSEM) <- c("CONTENT_AREA", "GRADE", "SCALE_SCORE", "SCALE_SCORE_CSEM")
Nevada_CSEM <- Nevada_CSEM[,c(2,1,3,4)]

Nevada_CSEM <- data.table(Nevada_CSEM)
key(Nevada_CSEM) <- c("GRADE", "CONTENT_AREA", "SCALE_SCORE")

Nevada_CSEM <- unique(Nevada_CSEM)

Nevada_CSEM <- as.data.frame(Nevada_CSEM)

save(Nevada_CSEM, file="Nevada_CSEM.Rdata")



