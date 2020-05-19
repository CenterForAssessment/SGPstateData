require(data.table)
require(SGP)

###  Read in the cutscore long data file

rli.cs.long <- fread('Base_Files/cutscores_including_unlinked_grades_06242019.txt')


### Tidy up data

rli.cs.long[Subject=="Reading", Subject:="READING"]
rli.cs.long[Subject=="Math", Subject:="MATHEMATICS"]


### Create List and embed STAR and RASCH Cutscore information in the List

RLI_Cutscores <- list()

RLI_Cutscores[["STAR"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "STAR")
RLI_Cutscores[["RASCH"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "RASCH")


### Save RLI_Cutscores

save(RLI_Cutscores, file="RLI_Cutscores_06242019.rda", compress="xz")
