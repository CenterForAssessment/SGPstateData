require(data.table)
require(SGP)

###  Read in the cutscore long data file

rli.cs.long <- fread('Base_Files/cutscores_including_unlinked_grades_03302025_STAR_Equated.txt')


### Create List and embed STAR and RASCH Cutscore information in the List

RLI_Cutscores <- list()

RLI_Cutscores[["RASCH"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "RASCH")
RLI_Cutscores[["STAR"]] <- SGP:::rliCutscoreCreation(rli.cs.long, "STAR")


### Save RLI_Cutscores

save(RLI_Cutscores, file="RLI_Cutscores_03302025.rda", compress="xz")
