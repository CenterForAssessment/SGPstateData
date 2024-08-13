###################################################
###
### Create cutscore object for NM_MSSA
###
###################################################

### Create list of Cutscores
NM_MSSA_Cutscores <- list(
	ELA=list(
		GRADE_3=c(336, 360, 370),
		GRADE_4=c(440, 460, 473),
		GRADE_5=c(543, 560, 573),
		GRADE_6=c(632, 660, 673),
		GRADE_7=c(731, 760, 775),
		GRADE_8=c(840, 860, 871)),
	MATHEMATICS=list(
		GRADE_3=c(341, 360, 377),
		GRADE_4=c(444, 460, 480),
		GRADE_5=c(548, 560, 573),
		GRADE_6=c(646, 660, 679),
		GRADE_7=c(748, 760, 770),
		GRADE_8=c(841, 860, 878)))

### Save results
save(NM_MSSA_Cutscores, file="NM_MSSA_Cutscores.Rdata")
