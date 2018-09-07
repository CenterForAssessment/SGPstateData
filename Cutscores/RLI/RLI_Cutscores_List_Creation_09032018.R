require(data.table)
require(SGP)

###  Read in the cutscore long data file

rli.cs.long <- fread('Base_Files/cutscores_including_unlinked_grades_08022018.txt')


### Create List and embed STAR and RASCH Cutscore information in the List

RLI_Cutscores <- list()

RLI_Cutscores[["STAR"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "STAR")
RLI_Cutscores[["RASCH"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "RASCH")


### Save RLI_Cutscores

save(RLI_Cutscores, file="RLI_Cutscores_09032018.rda", compress="xz")
