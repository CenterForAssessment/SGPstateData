###################################################################################################
####
#### File to produce SGPstateData containing state cutscores and other assessment program meta-data
####
#### NOTE: All variables used for merges are in ALL CAPS. Otherwise camel case
#### NOTE: Cutscores are the LOWER BOUND of the performance level
####
###################################################################################################

SGPstateData <- new.env()

###  Load required packages
require(data.table)
require(grid)
require(png)


#########################################################
### PARCC (Consortium) Embedded in later state meta-data
#########################################################

load("Knots_Boundaries/PARCC_Knots_Boundaries.Rdata")
SGPstateData[["PARCC"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_Knots_Boundaries

load("Cutscores/PARCC/PARCC_Cutscores.Rdata")
SGPstateData[["PARCC"]][["Achievement"]][["Cutscores"]] <- PARCC_Cutscores

SGPstateData[["PARCC"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["PARCC"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["PARCC"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["PARCC"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["PARCC"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="PARCC Inc",
			Abbreviation="PARCC Inc",
			URL="www.parccinc.org",
			Contact="202-748-8100"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["PARCC"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
			MATHEMATICS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ELA=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			GEOMETRY=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_I=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_II=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_1=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_2=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_3=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ELA_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			MATHEMATICS_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			GEOMETRY_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_I_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_II_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_1_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_2_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_3_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2")),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
			MATHEMATICS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ELA=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			GEOMETRY=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_I=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_II=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_1=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_2=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_3=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ELA_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			MATHEMATICS_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			GEOMETRY_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_I_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			ALGEBRA_II_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_1_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_2_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2"),
			INTEGRATED_MATH_3_SS=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2", "2017_2018.1", "2017_2018.2", "2018_2019.1", "2018_2019.2")),
		Vertical_Scale=list(ELA=FALSE, MATHEMATICS=FALSE, GEOMETRY=FALSE, ALGEBRA_I=FALSE, ALGEBRA_II=FALSE, INTEGRATED_MATH_1=FALSE, INTEGRATED_MATH_2=FALSE, INTEGRATED_MATH_3=FALSE,
										ELA_SS=FALSE, MATHEMATICS_SS=FALSE, GEOMETRY_SS=FALSE, ALGEBRA_I_SS=FALSE, ALGEBRA_II_SS=FALSE, INTEGRATED_MATH_1_SS=FALSE, INTEGRATED_MATH_2_SS=FALSE, INTEGRATED_MATH_3_SS=FALSE),
		Content_Areas_Labels=list(
				ELA="English Language Arts", MATHEMATICS="Math", GEOMETRY="Geometry", ALGEBRA_I="Algebra I", ALGEBRA_II="Algebra II",
				INTEGRATED_MATH_1="Integrated Math 1", INTEGRATED_MATH_2="Integrated Math 2", INTEGRATED_MATH_3="Integrated Math 3",
				ELA_SS="English Language Arts", MATHEMATICS_SS="Math", GEOMETRY_SS="Geometry", ALGEBRA_I_SS="Algebra I", ALGEBRA_II_SS="Algebra II",
				INTEGRATED_MATH_1_SS="Integrated Math 1", INTEGRATED_MATH_2_SS="Integrated Math 2", INTEGRATED_MATH_3_SS="Integrated Math 3"),
		Content_Areas_Domains=list(
				ELA="ELA", MATHEMATICS="MATHEMATICS", GEOMETRY="MATHEMATICS", ALGEBRA_I="MATHEMATICS", ALGEBRA_II="MATHEMATICS",
				INTEGRATED_MATH_1="MATHEMATICS", INTEGRATED_MATH_2="MATHEMATICS", INTEGRATED_MATH_3="MATHEMATICS",
				ELA_SS="ELA_SS", MATHEMATICS_SS="MATHEMATICS_SS", GEOMETRY_SS="MATHEMATICS_SS", ALGEBRA_I_SS="MATHEMATICS_SS", ALGEBRA_II_SS="MATHEMATICS_SS",
				INTEGRATED_MATH_1_SS="MATHEMATICS_SS", INTEGRATED_MATH_2_SS="MATHEMATICS_SS", INTEGRATED_MATH_3_SS="MATHEMATICS_SS"),
		Grades_Reported=list(
			ELA=c("3","4","5","6","7","8","9","10","11"), MATHEMATICS=c("3","4","5","6","7","8"), GEOMETRY="EOCT", ALGEBRA_I="EOCT", ALGEBRA_II="EOCT",
			INTEGRATED_MATH_1="EOCT", INTEGRATED_MATH_2="EOCT", INTEGRATED_MATH_3="EOCT",
			ELA_SS=c("3","4","5","6","7","8","9","10","11"), MATHEMATICS_SS=c("3","4","5","6","7","8"), GEOMETRY_SS="EOCT", ALGEBRA_I_SS="EOCT", ALGEBRA_II_SS="EOCT",
			INTEGRATED_MATH_1_SS="EOCT", INTEGRATED_MATH_2_SS="EOCT", INTEGRATED_MATH_3_SS="EOCT"),
		Grades_Reported_Domains=list(
			ELA=c("3","4","5","6","7","8","9","10","11"), ELA_SS=c("3","4","5","6","7","8","9","10","11"),
			MATHEMATICS=c("3","4","5","6","7","8","EOCT"), MATHEMATICS_SS=c("3","4","5","6","7","8","EOCT")),
		Achievement_Level_Labels=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"))

SGPstateData[["PARCC"]][["SGP_Configuration"]] <-
	list(
		fix.duplicates="KEEP.ALL",
		rq.method="fn",
		sgp.minimum.default.panel.years=2,
		percentile.cuts=c(1,35,50,66,99),
		sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
		sgp.projections.max.forward.progression.years=FALSE,
		gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, ELA=TRUE),
		calculate.confidence.intervals=list(confidence.quantiles=c(0.05, 0.95)),
		# sgPlot.show.content_area.progression=TRUE,
		return.norm.group.scale.scores=TRUE,
		return.projection.group.scale.scores=TRUE,
		print.other.gp=TRUE,
		print.sgp.order=TRUE,
		sgp.cohort.size=1000,
		sgp.less.than.sgp.cohort.size.return="<1000",
		sgp.projections.use.only.complete.matrices=FALSE,
		null.output.string="",
		grade.projection.sequence=list(
			ELA=c("3", "4", "5", "6", "7", "8", "9", "10", "11"),
			ELA_SS=c("3", "4", "5", "6", "7", "8", "9", "10", "11"),
			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			MATHEMATICS_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			MATHEMATICS_INTGRT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			MATHEMATICS_INTGRT_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			GEOMETRY_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			ALGEBRA_I_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			ALGEBRA_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			ALGEBRA_II_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_1=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_1_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_2=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_2_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_3=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			INTEGRATED_MATH_3_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT")),
		content_area.projection.sequence=list(
			ELA=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "ELA"),
			ELA_SS=c("ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS", "ELA_SS"),
			MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
			MATHEMATICS_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS", "ALGEBRA_II_SS"),
			MATHEMATICS_INTGRT=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1", "INTEGRATED_MATH_2", "INTEGRATED_MATH_3"),
			MATHEMATICS_INTGRT_SS=c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS", "INTEGRATED_MATH_2_SS", "INTEGRATED_MATH_3_SS"),
			ALGEBRA_I=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
			ALGEBRA_I_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS", "ALGEBRA_II_SS"),
			GEOMETRY=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
			GEOMETRY_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS", "ALGEBRA_II_SS"),
			ALGEBRA_II=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
			ALGEBRA_II_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS", "ALGEBRA_II_SS"),
			INTEGRATED_MATH_1=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1", "INTEGRATED_MATH_2", "INTEGRATED_MATH_3"),
			INTEGRATED_MATH_1_SS= c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS", "INTEGRATED_MATH_2_SS", "INTEGRATED_MATH_3_SS"),
			INTEGRATED_MATH_2=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1", "INTEGRATED_MATH_2", "INTEGRATED_MATH_3"),
			INTEGRATED_MATH_2_SS= c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS", "INTEGRATED_MATH_2_SS", "INTEGRATED_MATH_3_SS"),
			INTEGRATED_MATH_3=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1", "INTEGRATED_MATH_2", "INTEGRATED_MATH_3"),
			INTEGRATED_MATH_3_SS= c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS", "INTEGRATED_MATH_2_SS", "INTEGRATED_MATH_3_SS")), #
		year_lags.projection.sequence=list(
			ELA=rep(1L, 8),
			ELA_SS=rep(1L, 8),
			MATHEMATICS=rep(1L, 8),
			MATHEMATICS_SS=rep(1L, 8),
			MATHEMATICS_INTGRT=rep(1L, 8),
			MATHEMATICS_INTGRT_SS=rep(1L, 8),
			GEOMETRY=rep(1L, 8),
			GEOMETRY_SS=rep(1L, 8),
			ALGEBRA_I=rep(1L, 8),
			ALGEBRA_I_SS=rep(1L, 8),
			ALGEBRA_II=rep(1L, 8),
			ALGEBRA_II_SS=rep(1L, 8),
			INTEGRATED_MATH_1=rep(1L, 8),
			INTEGRATED_MATH_1_SS=rep(1L, 8),
			INTEGRATED_MATH_2=rep(1L, 8),
			INTEGRATED_MATH_2_SS=rep(1L, 8),
			INTEGRATED_MATH_3=rep(1L, 8),
			INTEGRATED_MATH_3_SS=rep(1L, 8)),
		max.forward.projection.sequence=list(
			ELA=3,
			ELA_SS=3,
			MATHEMATICS=3,
			MATHEMATICS_SS=3,
			MATHEMATICS_INTGRT=3,
			MATHEMATICS_INTGRT_SS=3,
			GEOMETRY=3,
			GEOMETRY_SS=3,
			ALGEBRA_I=3,
			ALGEBRA_I_SS=3,
			ALGEBRA_II=3,
			ALGEBRA_II_SS=3,
			INTEGRATED_MATH_1=3,
			INTEGRATED_MATH_1_SS=3,
			INTEGRATED_MATH_2=3,
			INTEGRATED_MATH_2_SS=3,
			INTEGRATED_MATH_2=3,
			INTEGRATED_MATH_3_SS=3))

SGPstateData[["PARCC"]][['SGP_Progression_Preference']] <- data.table(
	SGP_PROJECTION_GROUP = c("MATHEMATICS", "MATHEMATICS_INTGRT", "ALGEBRA_I", "INTEGRATED_MATH_1", "GEOMETRY", "INTEGRATED_MATH_2", "ALGEBRA_II", "INTEGRATED_MATH_3",
													 "MATHEMATICS_SS", "MATHEMATICS_INTGRT_SS", "ALGEBRA_I_SS", "INTEGRATED_MATH_1_SS", "GEOMETRY_SS", "INTEGRATED_MATH_2_SS", "ALGEBRA_II_SS", "INTEGRATED_MATH_3_SS"),
	PREFERENCE = c(1, 2, 1, 2, 1, 2, 1, 2,   1, 2, 1, 2, 1, 2, 1, 2), key = "SGP_PROJECTION_GROUP")

load("SGP_Norm_Group_Preference/PARCC_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["PARCC"]][["SGP_Norm_Group_Preference"]] <- PARCC_SGP_Norm_Group_Preference


#########################################################
### SBAC
#########################################################

load("Knots_Boundaries/SBAC_Knots_Boundaries.Rdata")

SGPstateData[["SBAC"]][["Achievement"]][["Knots_Boundaries"]] <- SBAC_Knots_Boundaries

SGPstateData[["SBAC"]][["Achievement"]][["Cutscores"]] <- list(
	ELA=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668),
		GRADE_10=c(2491, 2577, 2677),
		GRADE_11=c(2493, 2583, 2682)),
	MATHEMATICS=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653),
		GRADE_10=c(2529, 2614, 2697),
		GRADE_11=c(2543, 2628, 2718)))

SGPstateData[["SBAC"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["SBAC"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["SBAC"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["SBAC"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["SBAC"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="SBAC",
	Assessment_Abbreviation="Smarter Balanced Assessment Consortium",
	Organization=list(
		Name="Smarter Balanced Assessment Consortium",
		Abbreviation="SBAC",
		URL="www.smarterbalanced.org",
		Contact="888-888-8888"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,10,11),
	Test_Season="Spring",
	Test_Vendor="SBAC",
	CSEM="SCALE_SCORE_CSEM")

SGPstateData[["SBAC"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10,11), ELA=c(3,4,5,6,7,8,10,11)),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"))

SGPstateData[["SBAC"]][["SGP_Configuration"]] <-
list(
	rq.method="fn",
	sgp.minimum.default.panel.years=2,
	sgp.target.scale.scores.merge="all_years_lagged_current"
)

#########################################################
### ALBUQUERQUE
#########################################################

load("Knots_Boundaries/ABQ_Knots_Boundaries.Rdata")
SGPstateData[["ABQ"]][["Achievement"]][["Knots_Boundaries"]] <- ABQ_Knots_Boundaries

SGPstateData[["ABQ"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(332,340,356),
			GRADE_4=c(426,440,452),
			GRADE_5=c(528,540,552),
			GRADE_6=c(628,640,652),
			GRADE_7=c(730,740,754),
			GRADE_8=c(831,840,858),
			GRADE_11=c(1129,1140,1151)),
		MATHEMATICS=list(
			GRADE_3=c(328,340,359),
			GRADE_4=c(429,440,453),
			GRADE_5=c(529,540,551),
			GRADE_6=c(630,640,653),
			GRADE_7=c(730,740,753),
			GRADE_8=c(827,840,855),
			GRADE_11=c(1127,1140,1151)))

SGPstateData[["ABQ"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Beginning Step", "Nearing Proficient", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["ABQ"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ABQ"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["ABQ"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["ABQ"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="New Mexico Standards Based Assessment",
	Assessment_Abbreviation="NMSBA",
	Organization=list(
		Name="Albuquerque Public Schools",
		Abbreviation="APS",
		URL="http://www.aps.edu/",
		Contact="505-880-3700"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Test_Vendor="Measured Progress")

SGPstateData[["ABQ"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=as.character(2011:2014), READING=as.character(2011:2014)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=as.character(2011:2014), READING=as.character(2011:2014)),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Beginning"="Beginning Step",
		"Nearing"="Nearing Proficient",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

SGPstateData[["ABQ"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/ABQ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### ARCHDIOCESE OF BALTIMORE
#########################################################

load("Knots_Boundaries/AOB_Knots_Boundaries.Rdata")
SGPstateData[["AOB"]][["Achievement"]][["Knots_Boundaries"]] <- AOB_Knots_Boundaries

SGPstateData[["AOB"]][["Achievement"]][["Cutscores"]] <-
	list(
		LANGUAGE=list(
			GRADE_3=c(588, 617, 645),
			GRADE_4=c(592, 621, 649),
			GRADE_5=c(611, 637, 663),
			GRADE_6=c(625, 653, 679),
			GRADE_7=c(628, 659, 690),
			GRADE_8=c(637, 667, 698)),
		MATHEMATICS=list(
			GRADE_3=c(579, 606, 636),
			GRADE_4=c(591, 618, 648),
			GRADE_5=c(616, 639, 664),
			GRADE_6=c(632, 655, 682),
			GRADE_7=c(640, 663, 692),
			GRADE_8=c(653, 675, 703)),
		READING=list(
			GRADE_3=c(594, 621, 648),
			GRADE_4=c(602, 630, 659),
			GRADE_5=c(619, 644, 670),
			GRADE_6=c(636, 661, 687),
			GRADE_7=c(641, 669, 697),
			GRADE_8=c(653, 680, 704)),
		SCIENCE=list(
			GRADE_3=c(597, 620, 644),
			GRADE_4=c(599, 625, 650),
			GRADE_5=c(614, 636, 658),
			GRADE_6=c(630, 650, 670),
			GRADE_7=c(634, 658, 681),
			GRADE_8=c(647, 666, 688)))

SGPstateData[["AOB"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("1st Quartile", "2nd Quartile", "3rd Quartile", "4th Quartile"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient"))

SGPstateData[["AOB"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["AOB"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["AOB"]][["Growth"]][["Cutscores"]] <-
		list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["AOB"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Stanford Achievement Test 10",
		Assessment_Abbreviation="SAT 10",
		Organization=list(
			Name="Archdiocese of Baltimore",
			Abbreviation="AOB",
			URL="www.archbalt.org/schools",
			Contact="1-410-547-5515"),
		Content_Areas=c("Language", "Mathematics", "Reading", "Science"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("2007", "2008", "2009", "2010", "2011", "2012", "2013"),
		Test_Season="Spring",
		Test_Vendor="Pearson/SAT10")

SGPstateData[["AOB"]][["Student_Report_Information"]] <-
	list(
		Content_Areas_Labels=list(LANGUAGE="Language", MATHEMATICS="Math", READING="Reading", SCIENCE="Science"),
		Grades_Reported=list(LANGUAGE=c(3,4,5,6,7,8), MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), SCIENCE=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"1st Quartile"="1st Quartile",
			"2nd Quartile"="2nd Quartile",
			"3rd Quartile"="3rd Quartile",
			"4th Quartile"="4th Quartile"))

SGPstateData[["AOB"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AOB_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### ARKANSAS
#########################################################

load("CSEM/Arkansas/Arkansas_CSEM.Rdata")
load("Knots_Boundaries/AR_Knots_Boundaries.Rdata")
SGPstateData[["AR"]][["Achievement"]][["Knots_Boundaries"]] <- AR_Knots_Boundaries

SGPstateData[["AR"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(409,500,586),
			GRADE_4=c(495,559,640),
			GRADE_5=c(544,604,697),
			GRADE_6=c(569,641,722),
			GRADE_7=c(622,673,764),
			GRADE_8=c(655,700,802)),
		LITERACY=list(
			GRADE_3=c(330,500,654),
			GRADE_4=c(354,559,748),
			GRADE_5=c(382,604,799),
			GRADE_6=c(417,641,823),
			GRADE_7=c(426,673,867),
			GRADE_8=c(507,700,914)),
		EOC_MATHEMATICS_1=list(
			GRADE_7=c(151,200,250),
			GRADE_8=c(151,200,250),
			GRADE_9=c(151,200,250)),
		EOC_MATHEMATICS_2=list(
			GRADE_8=c(154,200,250),
			GRADE_9=c(154,200,250),
			GRADE_10=c(154,200,250)))

SGPstateData[["AR"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["AR"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["AR"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["AR"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["AR"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Arkansas Comprehensive Testing, Assessment, and Accountability Program",
		Assessment_Abbreviation="ACTAAP",
		Organization=list(
			Name="State of Arkansas",
			Abbreviation="AR",
			URL="http://www.arkansased.org/",
			Contact="501-682-4475"),
		Content_Areas=c("Mathematics", "Literacy"),
		Grades_Tested=c(3,4,5,6,7,8),
		Test_Season="Spring",
		Test_Vendor="Riverside Publishing",
		CSEM=Arkansas_CSEM)

SGPstateData[["AR"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
								LITERACY=c(as.character(2009:2016)),
								MATHEMATICS=c(as.character(2009:2016)),
								EOC_MATHEMATICS_1=c(as.character(2009:2016)),
								EOC_MATHEMATICS_2=c(as.character(2009:2016))),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
								LITERACY=c(as.character(2009:2016)),
								MATHEMATICS=c(as.character(2009:2016)),
								EOC_MATHEMATICS_1=c(as.character(2009:2016)),
								EOC_MATHEMATICS_2=c(as.character(2009:2016))),
		Vertical_Scale=list(LITERACY=FALSE, MATHEMATICS=FALSE, EOC_MATHEMATICS_1=FALSE, EOC_MATHEMATICS_2=FALSE),
		Content_Areas_Labels =list(LITERACY = "Literacy", MATHEMATICS = "Math", EOC_MATHEMATICS_1 = "EOC Math 1", EOC_MATHEMATICS_2 = "EOC Math 2"),
		Content_Areas_Domains=list( ## Each Domain should be in CANONICAL PROGRESSION ORDER
			LITERACY = "LITERACY", MATHEMATICS = "MATHEMATICS", EOC_MATHEMATICS_1="MATHEMATICS", EOC_MATHEMATICS_2="MATHEMATICS"),
		Grades_Reported=list(LITERACY=c(1,2,3,4,5,6,7,8,10), MATHEMATICS=c(1,2,3,4,5,6,7,8), EOC_MATHEMATICS_1=c(7,8,9,10), EOC_MATHEMATICS_2=c(8,9,10)),
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

#SGPstateData[["AR"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AR_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

#load("Baseline_Coefficient_Matrices/AR/AR_Baseline_Matrices.Rdata")
#SGPstateData[["AR"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- AR_Baseline_Matrices


#########################################################
### ARIZONA
#########################################################

load("Knots_Boundaries/AZ_Knots_Boundaries.Rdata")
load("Knots_Boundaries/AZ_Knots_Boundaries_PRE_2015.Rdata")
SGPstateData[["AZ"]][["Achievement"]][["Knots_Boundaries"]] <- c(AZ_Knots_Boundaries_PRE_2015, AZ_Knots_Boundaries)

SGPstateData[["AZ"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS.2015=list(
			GRADE_3=c(3495, 3531, 3573),
			GRADE_4=c(3530, 3562, 3606),
			GRADE_5=c(3563, 3595, 3635),
			GRADE_6=c(3602, 3629, 3663),
			GRADE_7=c(3629, 3652, 3680),
			GRADE_8=c(3650, 3673, 3705)),
		MATHEMATICS.2010=list(
			GRADE_3=c(303, 347, 406),
			GRADE_4=c(331, 366, 416),
			GRADE_5=c(348, 381, 436),
			GRADE_6=c(366, 398, 446),
			GRADE_7=c(382, 411, 460),
			GRADE_8=c(409, 426, 475),
			GRADE_9=c(471, 487, 537),
			GRADE_10=c(471, 487, 537)),
		ALGEBRA_I.2015=list(
			GRADE_EOCT=c(3661, 3681, 3720)),
		GEOMETRY.2015=list(
			GRADE_EOCT=c(3673, 3697, 3743)),
		ALGEBRA_II.2015=list(
			GRADE_EOCT=c(3690, 3711, 3751)),
		ELA.2015=list(
			GRADE_3=c(2497, 2509, 2541),
			GRADE_4=c(2510, 2523, 2559),
			GRADE_5=c(2520, 2543, 2578),
			GRADE_6=c(2532, 2553, 2597),
			GRADE_7=c(2543, 2561, 2600),
			GRADE_8=c(2551, 2572, 2604),
			GRADE_9=c(2555, 2577, 2606),
			GRADE_10=c(2567, 2581, 2606),
			GRADE_11=c(2569, 2585, 2608)),
		READING.2012=list(
			GRADE_3=c(379, 431, 516),
			GRADE_4=c(402, 450, 536),
			GRADE_5=c(424, 468, 556),
			GRADE_6=c(433, 478, 571),
			GRADE_7=c(443, 489, 587),
			GRADE_8=c(452, 499, 602),
			GRADE_9=c(627, 674, 773),
			GRADE_10=c(627, 674, 773)))

SGPstateData[["AZ"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Minimally Proficient", "Partially Proficient", "Proficient", "Highly Proficient"),
#		Labels=c("Falls Far Below", "Approaches", "Meets", "Exceeds"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["AZ"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["AZ"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["AZ"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["AZ"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Arizona Statewide Achievement Assessment for English Language Arts and Mathematics", ### 2015-
#		Assessment_Name="Arizona's Instrument to Measure Standards", ### 2006-2014
		Assessment_Abbreviation="AzMERIT",
#		Assessment_Abbreviation="AIMS",
		Organization=list(
			Name="Arizona Department of Education",
			Abbreviation="ADE",
			URL="www.azed.gov",
			Contact="1-800-352-4558"),
		Content_Areas=c("Mathematics", "Reading", "ELA", "Algebra I", "Geometry", "Algebra II"),
#		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
		Scale_Change=list(ELA="2015", MATHEMATICS="2015", ALGEBRA_I="2015", GEOMETRY="2015", ALGEBRA_II="2015"),
		Test_Season="Spring",
		Test_Vendor="AIR")
#		Test_Vendor="CTB/McGraw Hill")

SGPstateData[["AZ"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="AIMS",
		Assessment_Abbreviation.2015="AzMERIT",
		Assessment_Name="Arizona's Instrument to Measure Standards",
		Assessment_Name.2015="Arizona Statewide Achievement Assessment for English Language Arts and Mathematics",
		Achievement_Levels=list(
			Labels=c("Falls Far Below", "Approaches", "Meets", "Exceeds"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2015=list(
			Labels=c("Minimally Proficient", "Partially Proficient", "Proficient", "Highly Proficient"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Far Below"="Falls Far Below",
			"Approaches"="Approaches",
			"Meets"="Meets",
			"Exceeds"="Exceeds"),
		Achievement_Level_Labels.2015=list(
			"Min Proficient"="Minimally Proficient",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Highly Proficient"="Highly Proficient"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA", ALGEBRA_I="Algebra I", ALGEBRA_II="Algebra II"),
		Vertical_Scale="No",
		Vertical_Scale.2015="Yes",
		Grades_Tested=c(2,3,4,5,6,7,8,9,10),
		Grades_Tested.2015=c(3,4,5,6,7,8,9,10,11,12),
		Year="2015"
	)

SGPstateData[["AZ"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
								MATHEMATICS=as.character(2009:2014),
								READING=as.character(2009:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
								MATHEMATICS=as.character(2009:2014),
								READING=as.character(2009:2014)),
		Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE, ALGEBRA_I=TRUE, GEOMETRY=TRUE, ALGEBRA_II=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA", GEOMETRY="Geometry", ALGEBRA_I="Algebra I", ALGEBRA_II="Algebra II", READING="Reading"),
		Content_Areas_Domains=list(MATHEMATICS="MATHEMATICS", ELA="ELA", GEOMETRY="MATHEMATICS", ALGEBRA_I="MATHEMATICS", ALGEBRA_II="MATHEMATICS"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8,9,10,11), ALGEBRA_I="EOCT", GEOMETRY="EOCT", ALGEBRA_II="EOCT"),
		Grades_Reported_Domains=list(MATHEMATICS=c("3","4","5","6","7","8","EOCT"), ELA=c("3","4","5","6","7","8","9","10","11")),
		Earliest_Year_Reported=list(ELA='2015', MATHEMATICS='2015', ALGEBRA_I="2015", GEOMETRY="2015", ALGEBRA_II="2015"),
		Achievement_Level_Labels=list(
			"Min Proficient"="Minimally Proficient",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Highly Proficient"="Highly Proficient"))
#			"Falls Far Below"="Falls Far Below",
#			"Approaches"="Approaches",
#			"Meets"="Meets",
#			"Exceeds"="Exceeds"))

SGPstateData[["AZ"]][['SGP_Configuration']] <- list(
	sgp.minimum.default.panel.years=2,
	print.other.gp=TRUE,
	sgp.cohort.size=2000,
	return.norm.group.scale.scores=TRUE,
	return.norm.group.dates=TRUE,
	return.projection.group.scale.scores=TRUE,
	return.projection.group.dates=TRUE,
	sgp.less.than.sgp.cohort.size.return="< 2000 Student in Norm Group",
	sgp.target.scale.scores.merge="1_year_lagged_current")

SGPstateData[["AZ"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
	ELA=c("3", "4", "5", "6", "7", "8", "9", "10", "11"),
	MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	ALGEBRA_I_FROM_7=c("3", "4", "5", "6", "7", "EOCT", "EOCT", "EOCT"),
	ALGEBRA_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"))
SGPstateData[["AZ"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
	ELA=rep("ELA", 9),
	MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	GEOMETRY=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	ALGEBRA_I=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	ALGEBRA_I_FROM_7=c(rep("MATHEMATICS", 5), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	ALGEBRA_II=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"))
SGPstateData[["AZ"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
	ELA=rep(1L, 8),
	MATHEMATICS=rep(1L, 8),
	GEOMETRY=rep(1L, 8),
	ALGEBRA_I=rep(1L, 8),
	ALGEBRA_I_FROM_7=rep(1L, 7),
	ALGEBRA_II=rep(1L, 8))
SGPstateData[["AZ"]][["SGP_Configuration"]][["max.forward.projection.sequence"]] <- list(
	ELA=3,
	MATHEMATICS=3,
	GEOMETRY=3,
	ALGEBRA_I=3,
	ALGEBRA_I_FROM_7=3,
	ALGEBRA_II=3)

SGPstateData[["AZ"]][['SGP_Progression_Preference']] <- data.table(
	SGP_PROJECTION_GROUP = c("MATHEMATICS", "ALGEBRA_I_FROM_7"),
	PREFERENCE = c(1, 2), key = "SGP_PROJECTION_GROUP")

load("SGP_Norm_Group_Preference/AZ_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["AZ"]][["SGP_Norm_Group_Preference"]] <- AZ_SGP_Norm_Group_Preference
#SGPstateData[["AZ"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AZ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### ATI
#########################################################

load("Knots_Boundaries/ATI_Knots_Boundaries.Rdata")
SGPstateData[["ATI"]][["Achievement"]][["Knots_Boundaries"]] <- ATI_Knots_Boundaries

SGPstateData[["ATI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ATI"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["ATI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"


#########################################################
### BUREAU of INDIAN AFFAIRS
#########################################################

load("Knots_Boundaries/PARCC_BIA_Knots_Boundaries.Rdata")
SGPstateData[["BI"]] <- SGPstateData[['PARCC']]
SGPstateData[["BI"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_BIA_Knots_Boundaries

SGPstateData[["BI"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="Bureau of Indian Affairs",
			Abbreviation="BI",
			URL="www.indianaffairs.gov",
			Contact="202-208-3710"),
			Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
			Grades_Tested=c(3,4,5,6,7,8,9,10,11),
			Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
			Test_Season="Fall & Spring",
			Test_Vendor="Pearson",
			CSEM="SCALE_SCORE_CSEM")

#########################################################
### CALIFORNIA
#########################################################

SGPstateData[["CA"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		ELA=list(
			knots_2=c(293, 333, 366, 403),
			knots_3=c(277, 314, 344, 381),
			knots_4=c(304, 341, 371, 405),
			knots_5=c(296, 330, 360, 393),
			knots_6=c(286, 319, 349, 383),
			knots_7=c(280, 319, 350, 386),
			knots_8=c(276, 310, 344, 383),
			knots_9=c(276, 310, 341, 378),
			knots_10=c(275, 312, 341, 375),
			knots_11=c(267, 308, 341, 376),
			boundaries_2=c(109.4, 644.6),
			boundaries_3=c(106.1, 644.9),
			boundaries_4=c(105, 645),
			boundaries_5=c(105, 645),
			boundaries_6=c(105, 645),
			boundaries_7=c(105, 645),
			boundaries_8=c(105, 645),
			boundaries_9=c(105, 645),
			boundaries_10=c(105, 645),
			boundaries_11=c(105, 645),
			loss.hoss_2=c(154, 600),
			loss.hoss_3=c(151, 600),
			loss.hoss_4=c(150, 600),
			loss.hoss_5=c(150, 600),
			loss.hoss_6=c(150, 600),
			loss.hoss_7=c(150, 600),
			loss.hoss_8=c(150, 600),
			loss.hoss_9=c(150, 600),
			loss.hoss_10=c(150, 600),
			loss.hoss_11=c(150, 600),
	##  Year (2009 - 2011) originally used as Temporary Grade for HS Grade progressions.
	##  Here 8th grade ELA (ONLY - on lower MS/ upper HS grades) used as a prior in some places
	##  Year doesn't work if used as a simple BASELINE as Aspire intends to do.
	##  Need something more general, so 101 - 103 used instead (although only 2 priors will be max - 101 & 102)
	##  A.V.I. Changed to 'EOCT' Convention 1/14/13
			knots_EOCT=c(276, 310, 344, 383),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		MATHEMATICS=list(
			knots_2=c(294, 344, 389, 439),
			knots_3=c(305, 355, 402, 460),
			knots_4=c(309, 355, 397, 446),
			knots_5=c(290, 340, 390, 450),
			knots_6=c(273, 310, 347, 396),
			knots_7=c(274, 304, 338, 379),
			boundaries_2=c(105, 645),
			boundaries_3=c(105, 645),
			boundaries_4=c(105, 645),
			boundaries_5=c(105, 645),
			boundaries_6=c(105, 645),
			boundaries_7=c(105, 645),
			loss.hoss_2=c(150, 600),
			loss.hoss_3=c(150, 600),
			loss.hoss_4=c(150, 600),
			loss.hoss_5=c(150, 600),
			loss.hoss_6=c(150, 600),
			loss.hoss_7=c(150, 600),
			knots_EOCT=c(274, 304, 338, 379),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		SCIENCE=list(
			knots_5=c(291, 327, 360, 400),
			knots_8=c(256, 313, 363, 424),
			boundaries_5=c(105, 645),
			boundaries_8=c(105, 645),
			loss.hoss_5=c(150, 600),
			loss.hoss_8=c(150, 600),
			knots_EOCT=c(256, 313, 363, 424),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		HISTORY=list(
			knots_8=c(269, 305, 341, 382),
			boundaries_8=c(105, 645),
			loss.hoss_8=c(150, 600),
			knots_EOCT=c(269, 305, 341, 382),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		WORLD_HISTORY=list(
			knots_EOCT=c(251, 285, 322, 366),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		US_HISTORY=list(
			knots_EOCT=c(264, 304, 337, 380),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		GENERAL_MATHEMATICS=list(
			knots_8=c(258, 284, 310, 350),
			knots_9=c(258, 284, 310, 350),
			boundaries_8=c(105, 645),
			boundaries_9=c(105, 645),
			loss.hoss_8=c(150, 600),
			loss.hoss_9=c(150, 600),
			knots_EOCT=c(258, 284, 310, 350),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		ALGEBRA_I=list(
			knots_7=c(252, 278, 308, 356),
			knots_8=c(252, 278, 308, 356),
			boundaries_7=c(105, 645),
			boundaries_8=c(105, 645),
			loss.hoss_7=c(150, 600),
			loss.hoss_8=c(150, 600),
			knots_EOCT=c(252, 278, 308, 356),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		ALGEBRA_II=list(
			knots_EOCT=c(238, 264, 293, 338),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		GEOMETRY=list(
			knots_EOCT=c(240, 262, 287, 330),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		SUMMATIVE_HS_MATHEMATICS=list(
			knots_EOCT=c(250, 293, 334, 382),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		BIOLOGY=list(
			knots_EOCT=c(281, 309, 338, 374),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		CHEMISTRY=list(
			knots_EOCT=c(272, 296, 323, 360),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		PHYSICS=list(
			knots_EOCT=c(280, 303, 330, 361),
			boundaries_EOCT=c(123.7, 643.3),
			loss.hoss_EOCT=c(167, 600)),
		INTEGRATED_SCIENCE_1=list(
			knots_EOCT=c(267, 289, 307, 332),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)),
		LIFE_SCIENCE=list(
			knots_EOCT=c(266, 298, 331, 374),
			boundaries_EOCT=c(105, 645),
			loss.hoss_EOCT=c(150, 600)))

SGPstateData[["CA"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_2=c(236, 300, 350, 414),
			GRADE_3=c(236, 300, 350, 414),
			GRADE_4=c(245, 300, 350, 401),
			GRADE_5=c(248, 300, 350, 430),
			GRADE_6=c(253, 300, 350, 415),
			GRADE_7=c(257, 300, 350, 414)),
		GENERAL_MATHEMATICS=list(
			GRADE_8=c(257, 300, 350, 414),
			GRADE_9=c(257, 300, 350, 414),
			GRADE_EOCT=c(257, 300, 350, 414)),
		ALGEBRA_I=list(
			GRADE_7=c(253, 300, 350, 428),	# ALGEBRA I
			GRADE_8=c(253, 300, 350, 428),
			GRADE_9=c(253, 300, 350, 428),
			GRADE_10=c(253, 300, 350, 428),
			GRADE_11=c(253, 300, 350, 428),
			GRADE_EOCT=c(253, 300, 350, 428)),
		GEOMETRY=list(
			GRADE_7=c(247, 300, 350, 418),	# GEOMETRY
			GRADE_8=c(247, 300, 350, 418),
			GRADE_9=c(247, 300, 350, 418),
			GRADE_10=c(247, 300, 350, 418),
			GRADE_11=c(247, 300, 350, 418),
			GRADE_EOCT=c(247, 300, 350, 418)),
		ALGEBRA_II=list(
			GRADE_8=c(257, 300, 350, 416),	# ALGEBRA II
			GRADE_9=c(257, 300, 350, 416),
			GRADE_10=c(257, 300, 350, 416),
			GRADE_11=c(257, 300, 350, 416),
			GRADE_EOCT=c(257, 300, 350, 416)),
		SUMMATIVE_HS_MATHEMATICS =list(
			GRADE_9=c(235, 300, 350, 420),	# SUMMATIVE_HS_MATHEMATICS
			GRADE_10=c(235, 300, 350, 420),
			GRADE_11=c(235, 300, 350, 420),
			GRADE_12=c(235, 300, 350, 420),
			GRADE_EOCT=c(235, 300, 350, 420)),
		INTEGRATED_MATHEMATICS_1=list(
			GRADE_9=c(249, 300, 350, 425),	# INTEGRATED MATH 1
			GRADE_10=c(249, 300, 350, 425),
			GRADE_11=c(249, 300, 350, 425),
			GRADE_EOCT=c(249, 300, 350, 425)),
		INTEGRATED_MATHEMATICS_2=list(
			GRADE_9=c(258, 300, 350, 418),	# INTEGRATED MATH 2
			GRADE_10=c(258, 300, 350, 418),
			GRADE_11=c(258, 300, 350, 418),
			GRADE_EOCT=c(258, 300, 350, 418)),
		INTEGRATED_MATHEMATICS_3=list(
			GRADE_12=c(252, 300, 350, 428)),# INTEGRATED MATH 3
		SCIENCE=list(
			GRADE_5=c(268, 300, 350, 410),
			GRADE_8=c(253, 300, 350, 403),
			GRADE_EOCT=c(253, 300, 350, 403)),
		LIFE_SCIENCE=list(
			GRADE_9=c(269, 300, 350, 399),
			GRADE_10=c(269, 300, 350, 399),
			GRADE_11=c(269, 300, 350, 399),
			GRADE_EOCT=c(269, 300, 350, 399)),
		BIOLOGY=list(
			GRADE_9=c(276, 300, 350, 394),
			GRADE_10=c(276, 300, 350, 394),
			GRADE_11=c(276, 300, 350, 394),
			GRADE_EOCT=c(276, 300, 350, 394)),
		CHEMISTRY=list(
			GRADE_9=c(276, 300, 350, 394),
			GRADE_10=c(276, 300, 350, 394),
			GRADE_11=c(276, 300, 350, 394),
			GRADE_EOCT=c(276, 300, 350, 394)),
		PHYSICS=list(
			GRADE_9=c(276, 300, 350, 393),
			GRADE_10=c(276, 300, 350, 393),
			GRADE_11=c(276, 300, 350, 393),
			GRADE_EOCT=c(276, 300, 350, 393)),
		ELA=list(
			GRADE_2=c(262, 300, 350, 402),
			GRADE_3=c(259, 300, 350, 402),
			GRADE_4=c(269, 300, 350, 393),
			GRADE_5=c(271, 300, 350, 395),
			GRADE_6=c(268, 300, 350, 394),
			GRADE_7=c(263, 300, 350, 401),
			GRADE_8=c(266, 300, 350, 395),
			GRADE_9=c(265, 300, 350, 397),
			GRADE_10=c(263, 300, 350, 392),
			GRADE_11=c(259, 300, 350, 396),
			GRADE_EOCT=c(263, 300, 350, 395)), #eyeball - just for GoFit Plots mosiac panel
		HISTORY=list(
			GRADE_8=c(271, 300, 350, 396),
			GRADE_11=c(270, 300, 350, 401),
			GRADE_EOCT=c(271, 300, 350, 396)), # for GoFit Plots mosiac panel
		WORLD_HISTORY=list(
			GRADE_9=c(275, 300, 350, 400),
			GRADE_10=c(275, 300, 350, 400),
			GRADE_11=c(275, 300, 350, 400),
			GRADE_EOCT=c(275, 300, 350, 400)),
		US_HISTORY=list(
			GRADE_9=c(270, 300, 350, 401),
			GRADE_10=c(270, 300, 350, 401),
			GRADE_11=c(270, 300, 350, 401),
			GRADE_EOCT=c(270, 300, 350, 401)))

SGPstateData[["CA"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Far Below Basic", "Below Basic", "Basic", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["CA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["CA"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["CA"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["CA"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="California Standards Tests",
		Assessment_Abbreviation="CST",
		Organization=list(
			Name="College-Ready Promise Coalition", # California Department of Education
			Abbreviation="TCRP",
			URL="www.thecollegereadypromise.org", #  www.cde.ca.gov
			Contact="N.A."), # Accountability Office for CDE: 1-916-319-0869
		Content_Areas=c("Mathematics", "ELA"),
		Grades_Tested=c(2,3,4,5,6,7,8,9,10,11),
		Test_Season="Spring",
		Assessment_Years=c("2009", "2010", "2011", "2012", "2013"))

SGPstateData[["CA"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=as.character(2009:2014),
									ELA=as.character(2009:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=as.character(2009:2014),
									ELA=as.character(2009:2014)),
		Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
		Grades_Reported=list(MATHEMATICS=c(2,3,4,5,6,7), ELA=c(2,3,4,5,6,7,8,9,10,11)),
		Achievement_Level_Labels=list(
			"Far Below Basic"="Far Below Basic",
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

SGPstateData[["CA"]][["SGP_Configuration"]] <- list(goodness.of.fit.minimum.n=25)

SGPstateData[["CA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/CA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("SGP_Norm_Group_Preference/TCRP_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["CA"]][["SGP_Norm_Group_Preference"]] <- TCRP_SGP_Norm_Group_Preference
#load("Baseline_Coefficient_Matrices/CA/CA_Baseline_Matrices.Rdata")
#SGPstateData[["CA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- CA_Baseline_Matrices


#########################################################
### CELA
#########################################################

SGPstateData[["CELA"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		CELA =list(
			boundaries_0=c(260, 585),
			boundaries_1=c(260, 590),
			boundaries_2=c(260, 592),
			boundaries_3=c(260, 651),
			boundaries_4=c(260, 651),
			boundaries_5=c(260, 651),
			boundaries_6=c(260, 666),
			boundaries_7=c(260, 666),
			boundaries_8=c(260, 666),
			boundaries_9=c(260, 675),
			boundaries_10=c(260, 675),
			boundaries_11=c(260, 675),
			boundaries_12=c(260, 675),
			knots_0=c(355, 376, 395, 414),
			knots_1=c(410, 434, 452, 472),
			knots_2=c(453, 474, 491, 509),
			knots_3=c(467, 490, 508, 528),
			knots_4=c(489, 513, 531, 551),
			knots_5=c(505, 529, 547, 567),
			knots_6=c(507, 531, 549, 568),
			knots_7=c(514, 541, 560, 579),
			knots_8=c(520, 548, 568, 588),
			knots_9=c(507, 534, 551, 570),
			knots_10=c(512, 541, 560, 581),
			knots_11=c(516, 546, 567.6, 588),
			knots_12=c(513, 548, 571, 594),
			loss.hoss_0=c(260, 585),
			loss.hoss_1=c(260, 590),
			loss.hoss_2=c(260, 592),
			loss.hoss_3=c(260, 651),
			loss.hoss_4=c(260, 651),
			loss.hoss_5=c(260, 651),
			loss.hoss_6=c(260, 666),
			loss.hoss_7=c(260, 666),
			loss.hoss_8=c(260, 666),
			loss.hoss_9=c(260, 675),
			loss.hoss_10=c(260, 675),
			loss.hoss_11=c(260, 675),
			loss.hoss_12=c(260, 675)))

SGPstateData[["CELA"]][["Achievement"]][["Cutscores"]] <-
	list(
		CELA=list(
			GRADE_0=c(382, 426, 451, 515),
			GRADE_1=c(411, 435, 469, 522),
			GRADE_2=c(431, 465, 491, 546),
			GRADE_3=c(445, 478, 509, 562),
			GRADE_4=c(458, 490, 526, 578),
			GRADE_5=c(460, 493, 533, 584),
			GRADE_6=c(463, 496, 539, 590),
			GRADE_7=c(465, 499, 546, 596),
			GRADE_8=c(469, 503, 549, 598),
			GRADE_9=c(473, 507, 551, 600),
			GRADE_10=c(477, 510, 553, 603),
			GRADE_11=c(481, 514, 556, 605),
			GRADE_12=c(485, 518, 559, 607)))

SGPstateData[["CELA"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("CELA L1","CELA L2","CELA L3","CELA L4","CELA L5","NO SCORE"),
		Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient",NA))

SGPstateData[["CELA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["CELA"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35,66),
		Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["CELA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["CELA"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Colorado English Language Assessment",
		Assessment_Abbreviation="CELA",
		Organization=list(
			Name="Colorado Department of Education",
			Abbreviation="CDE",
			URL="www.schoolview.org",
			Contact="303-866-6600"),
		Assessment_Years=c("2007", "2008", "2009", "2010", "2011", "2012", "2013"),
		Content_Areas="CELA",
		Grades_Tested= c(0,1,2,3,4,5,6,7,8,9,10,11,12),
		Test_Season="Spring")

SGPstateData[["CELA"]][["Student_Report_Information"]] <-
	list(
		Grades_Reported=list(CELA=c(0,1,2,3,4,5,6)),
		Vertical_Scale=list(CELA=TRUE),
		Content_Areas_Labels=list(CELA="CELA"),
		Achievement_Level_Labels=list(
			"CELA Level 1"="CELA L1",
			"CELA Level 2"="CELA L2",
			"CELA Level 3"="CELA L3",
			"CELA Level 4"="CELA L4",
			"CELA Level 5"="CELA L5"))

#load("Baseline_Coefficient_Matrices/CELA/CELA_Baseline_Matrices.Rdata")
#SGPstateData[["CELA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["CELA.BASELINE"]] <- CELA_Baseline_Matrices[["CELA.BASELINE"]]


#########################################################
### COLORADO
#########################################################

### COLORADO (Original meta-data including CSAP/TCAP/PARCC)

#load("CSEM/Colorado/Colorado_CSEM.Rdata")
#load("Knots_Boundaries/CO_Knots_Boundaries_PARCC_Scale_Score.Rdata")

#SGPstateData[["CO_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <- CO_Knots_Boundaries
#SGPstateData[["CO_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		MATHEMATICS=list(
#			boundaries_3=c(150, 700),
#			boundaries_4=c(180, 780),
#			boundaries_5=c(220, 800),
#			boundaries_6=c(240, 830),
#			boundaries_7=c(280, 860),
#			boundaries_8=c(310, 890),
#			boundaries_9=c(340, 920),
#			boundaries_10=c(370, 950),
#			knots_3=c(392, 440, 481, 529),
#			knots_4=c(425, 470, 506, 546),
#			knots_5=c(452, 495, 530, 569),
#			knots_6=c(465, 509, 546, 588),
#			knots_7=c(490, 530, 565, 600),
#			knots_8=c(500, 545, 580, 620),
#			knots_9=c(515, 560, 595, 630),
#			knots_10=c(530, 575, 610, 645),
#			loss.hoss_3=c(150, 700),
#			loss.hoss_4=c(180, 780),
#			loss.hoss_5=c(220, 800),
#			loss.hoss_6=c(240, 830),
#			loss.hoss_7=c(280, 860),
#			loss.hoss_8=c(310, 890),
#			loss.hoss_9=c(340, 920),
#			loss.hoss_10=c(370, 950)),
#		READING=list(
#			boundaries_3=c(150, 795),
#			boundaries_4=c(180, 940),
#			boundaries_5=c(220, 955),
#			boundaries_6=c(260, 970),
#			boundaries_7=c(300, 980),
#			boundaries_8=c(330, 990),
#			boundaries_9=c(350, 995),
#			boundaries_10=c(370, 999),
#			knots_3=c(510, 550, 580, 615),
#			knots_4=c(542, 580, 606, 635),
#			knots_5=c(562, 602, 632, 665),
#			knots_6=c(575, 615, 645, 675),
#			knots_7=c(586, 625, 655, 690),
#			knots_8=c(605, 642, 670, 702),
#			knots_9=c(620, 655, 680, 706),
#			knots_10=c(642, 675, 700, 730),
#			loss.hoss_3=c(150, 795),
#			loss.hoss_4=c(180, 940),
#			loss.hoss_5=c(220, 955),
#			loss.hoss_6=c(260, 970),
#			loss.hoss_7=c(300, 980),
#			loss.hoss_8=c(330, 990),
#			loss.hoss_9=c(350, 995),
#			loss.hoss_10=c(370, 999)),
#		WRITING=list(
#			boundaries_3=c(150, 680),
#			boundaries_4=c(190, 730),
#			boundaries_5=c(220, 780),
#			boundaries_6=c(230, 840),
#			boundaries_7=c(240, 890),
#			boundaries_8=c(250, 910),
#			boundaries_9=c(260, 930),
#			boundaries_10=c(270, 950),
#			knots_3=c(430, 460, 480, 515),
#			knots_4=c(445, 475, 500, 530),
#			knots_5=c(460, 495, 520, 550),
#			knots_6=c(475, 510, 540, 575),
#			knots_7=c(495, 533, 565, 605),
#			knots_8=c(495, 540, 575, 615),
#			knots_9=c(505, 550, 585, 629),
#			knots_10=c(515, 565, 600, 645),
#			loss.hoss_3=c(150, 680),
#			loss.hoss_4=c(190, 730),
#			loss.hoss_5=c(220, 780),
#			loss.hoss_6=c(230, 840),
#			loss.hoss_7=c(240, 890),
#			loss.hoss_8=c(250, 910),
#			loss.hoss_9=c(260, 930),
#			loss.hoss_10=c(270, 950)))

#SGPstateData[["CO_ORIGINAL"]][["Achievement"]][["Cutscores"]] <-
#	list(
#		MATHEMATICS=list(
#			GRADE_3=c(335, 419, 510),
#			GRADE_4=c(383, 455, 538),
#			GRADE_5=c(422, 494, 562),
#			GRADE_6=c(454, 520, 589),
#			GRADE_7=c(487, 559, 614),
#			GRADE_8=c(521, 577, 628),
#			GRADE_9=c(548, 602, 652),
#			GRADE_10=c(562, 627, 692)),
#		READING=list(
#			GRADE_3=c(466, 526, 656),
#			GRADE_4=c(517, 572, 671),
#			GRADE_5=c(538, 588, 691),
#			GRADE_6=c(543, 600, 696),
#			GRADE_7=c(567, 620, 716),
#			GRADE_8=c(578, 632, 724),
#			GRADE_9=c(585, 642, 739),
#			GRADE_10=c(607, 663, 747)),
#		WRITING=list(
#			GRADE_3=c(393, 465, 533),
#			GRADE_4=c(414, 485, 554),
#			GRADE_5=c(418, 498, 576),
#			GRADE_6=c(423, 513, 600),
#			GRADE_7=c(430, 539, 629),
#			GRADE_8=c(434, 556, 651),
#			GRADE_9=c(436, 563, 672),
#			GRADE_10=c(459, 578, 690)),
#		ELA.2015 =list(
#			GRADE_3=c(700, 725, 750, 810),
#			GRADE_4=c(700, 725, 750, 790),
#			GRADE_5=c(700, 725, 750, 799),
#			GRADE_6=c(700, 725, 750, 790),
#			GRADE_7=c(700, 725, 750, 785),
#			GRADE_8=c(700, 725, 750, 794),
#			GRADE_9=c(700, 725, 750, 791),
#			GRADE_10=c(700, 725, 750, 794),
#			GRADE_11=c(700, 725, 750, 792)),
#		MATHEMATICS.2015 =list(
#			GRADE_3=c(700, 725, 750, 790),
#			GRADE_4=c(700, 725, 750, 796),
#			GRADE_5=c(700, 725, 750, 790),
#			GRADE_6=c(700, 725, 750, 788),
#			GRADE_7=c(700, 725, 750, 786),
#			GRADE_8=c(700, 725, 750, 801)),
#		ALGEBRA_I.2015 =list(
#			GRADE_8=c(700, 725, 750, 805),
#			GRADE_EOCT=c(700, 725, 750, 805)),
#		ALGEBRA_II.2015 =list(GRADE_EOCT=c(700, 725, 750, 808)),
#		GEOMETRY.2015=list(GRADE_EOCT=c(700, 725, 750, 783)),
#		INTEGRATED_MATH_1.2015=list(GRADE_EOCT=c(700, 725, 750, 799)),
#		INTEGRATED_MATH_2.2015=list(GRADE_EOCT=c(700, 725, 750, 785)),
#		INTEGRATED_MATH_3=list(GRADE_EOCT=c(700, 725, 750, 804)))

#SGPstateData[["CO_ORIGINAL"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "No Score"),
#	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))
#SGPstateData[["CO_ORIGINAL"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Unsatisfactory", "Partially Proficient", "Proficient", "Advanced", "No Score"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

#SGPstateData[["CO_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

#SGPstateData[["CO_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

#SGPstateData[["CO_ORIGINAL"]][["Growth"]][["Cutscores"]] <- list(
#	Cuts=c(35, 66),
#	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

#SGPstateData[["CO_ORIGINAL"]][["Assessment_Program_Information"]] <- list(
#	Assessment_Name="Colorado Measures of Academic Success",
#	Assessment_Name="Colorado Student Assessment Program",
#	Assessment_Abbreviation="CMAS",
#	Assessment_Abbreviation="CSAP/TCAP",
#	Organization=list(
#		Name="Colorado Department of Education",
#		Abbreviation="CDE",
#		URL="www.schoolview.org",
#		Contact="303-866-6600"),
#	Content_Areas=c("Mathematics", "Reading"),
#	Content_Areas=c("Mathematics", "Reading", "Writing"),
#	Grades_Tested=c(3,4,5,6,7,8,9,10,11,12),
#	Assessment_Years=as.character(2003:2016),
#	Test_Season="Spring",
#	Test_Vendor="PARCC",
#	Scale_Change=list(MATHEMATICS="2015", READING="2015", ALGEBRA_I="2015", GEOMETRY="2015", ALGEBRA_II="2015"),
#	Test_Vendor="CTB/McGraw Hill",
#	CSEM=Colorado_CSEM)

#SGPstateData[["CO_ORIGINAL"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
#	list(
#		Assessment_Abbreviation="CSAP/TCAP",
#		Assessment_Abbreviation.2015="CMAS",
#		Assessment_Name="Colorado Student Assessment Program",
#		Assessment_Name.2015="Colorado Measures of Academic Success",
#		Achievement_Levels=list(
#			Labels=c("Unsatisfactory", "Partially Proficient", "Proficient", "Advanced", "No Score"),
#			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
#		Achievement_Levels.2015=list(
#			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
#			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#		Achievement_Level_Labels=list(
#			"Unsatisfactory"="Unsatisfactory",
#			"Part Proficient"="Partially Proficient",
#			"Proficient"="Proficient",
#			"Advanced"="Advanced"),
#		Achievement_Level_Labels.2015=list(
#			"Level 1"="Level 1",
#			"Level 2"="Level 2",
#			"Level 3"="Level 3",
#			"Level 4"="Level 4",
#			"Level 5"="Level 5"),
#		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
#		Content_Areas_Labels.2015=list(MATHEMATICS="Math", READING="ELA"),
#		Vertical_Scale="No",
#		Vertical_Scale.2015="No",
#		Grades_Tested=c(3,4,5,6,7,8),
#		Grades_Tested.2015=c(3,4,5,6,7,8,9,10,11,12),
#		Year="2015"
#	)

#SGPstateData[["CO_ORIGINAL"]][["Student_Report_Information"]] <- list(
#	Transformed_Achievement_Level_Cutscores=list(
#									MATHEMATICS=as.character(2015:2018),
#									READING=as.character(2015:2018)),
#	Transformed_Achievement_Level_Cutscores_gaPlot=list(
#									MATHEMATICS=as.character(2015:2018),
#									READING=as.character(2015:2018)),
#	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
#	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10,11,12), READING=c(3,4,5,6,7,8,9,10,11,12)),
#	Achievement_Level_Labels=list(
#		"Level 1"="Level 1",
#		"Level 2"="Level 2",
#		"Level 3"="Level 3",
#		"Level 4"="Level 4",
#		"Level 5"="Level 5"))

#SGPstateData[["CO_ORIGINAL"]][["SGP_Configuration"]] <- list(
#	arrow.legend.color=c("#FD5050", "#FDBF1A", "#07B806"),
#	sgp.cohort.size=2000)

#load("Baseline_Coefficient_Matrices/CO/CO_Baseline_Matrices.Rdata")
#SGPstateData[["CO_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- CO_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["CO_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- CO_Baseline_Matrices[["READING.BASELINE"]]
#SGPstateData[["CO_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["WRITING.BASELINE"]] <- CO_Baseline_Matrices[["WRITING.BASELINE"]]
#SGPstateData[["CO_ORIGINAL"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/CO_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("SGP_Norm_Group_Preference/CO_SGP_Norm_Group_Preference.Rdata")
#SGPstateData[["CO_ORIGINAL"]][["SGP_Norm_Group_Preference"]] <- CO_SGP_Norm_Group_Preference


### COLORADO (PARCC)

load("Knots_Boundaries/PARCC_CO_Knots_Boundaries.Rdata")
SGPstateData[["CO_PARCC"]] <- SGPstateData[['PARCC']]
SGPstateData[["CO_PARCC"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_CO_Knots_Boundaries

SGPstateData[["CO_PARCC"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Colorado Measures of Academic Success",
		Assessment_Abbreviation="CMAS",
		Organization=list(
			Name="Colorado Department of Education",
			Abbreviation="CDE",
			URL="www.schoolview.org",
			Contact="growth.questions@cde.state.co.us"),
			Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
			Grades_Tested=c(3,4,5,6,7,8,9),
			Assessment_Years=c("2014_2015", "2015_2016", "2016_2017"),
			Test_Season="Fall & Spring",
			Test_Vendor="Pearson",
			CSEM="SCALE_SCORE_CSEM")

SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["arrow.legend.color"]] <- c("#FD5050", "#FDBF1A", "#07B806")
SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["sgPlot.use.student.id"]] <- TRUE

SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["grade.projection.sequence"]] <-
		list(
			ELA=c("3", "4", "5", "6", "7", "8", "9"),
			ELA_SS=c("3", "4", "5", "6", "7", "8", "9"),
			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			MATHEMATICS_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			MATHEMATICS_INTGRT=c("3", "4", "5", "6", "7", "8", "EOCT"),
			MATHEMATICS_INTGRT_SS=c("3", "4", "5", "6", "7", "8", "EOCT"),
			GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			GEOMETRY_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			ALGEBRA_I_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			INTEGRATED_MATH_1=c("3", "4", "5", "6", "7", "8", "EOCT"),
			INTEGRATED_MATH_1_SS=c("3", "4", "5", "6", "7", "8", "EOCT"))

SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <-
  list(
			ELA=rep("ELA", 7), ELA_SS=rep("ELA_SS", 7),
			MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
			MATHEMATICS_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"),
			MATHEMATICS_INTGRT=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1"),
			MATHEMATICS_INTGRT_SS=c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS"),
			ALGEBRA_I=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
			ALGEBRA_I_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"),
			GEOMETRY=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
			GEOMETRY_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"),
			INTEGRATED_MATH_1=c(rep("MATHEMATICS", 6), "INTEGRATED_MATH_1"),
			INTEGRATED_MATH_1_SS= c(rep("MATHEMATICS_SS", 6), "INTEGRATED_MATH_1_SS"))

SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <-
  list(
			ELA=rep(1L, 6), ELA_SS=rep(1L, 6),
			MATHEMATICS=rep(1L, 7), MATHEMATICS_SS=rep(1L, 7),
			MATHEMATICS_INTGRT=rep(1L, 6), MATHEMATICS_INTGRT_SS=rep(1L, 6),
			GEOMETRY=rep(1L, 7), GEOMETRY_SS=rep(1L, 7),
			ALGEBRA_I=rep(1L, 7), ALGEBRA_I_SS=rep(1L, 7),
			INTEGRATED_MATH_1=rep(1L, 6), INTEGRATED_MATH_1_SS=rep(1L, 6))

SGPstateData[["CO_PARCC"]][['SGP_Progression_Preference']] <- data.table(
	SGP_PROJECTION_GROUP =
		c("MATHEMATICS_SS", "MATHEMATICS_INTGRT_SS", "ALGEBRA_I_SS", "INTEGRATED_MATH_1_SS", "GEOMETRY_SS", "INTEGRATED_MATH_2_SS", "ALGEBRA_II_SS", "INTEGRATED_MATH_3_SS",
			"MATHEMATICS", "MATHEMATICS_INTGRT", "ALGEBRA_I", "INTEGRATED_MATH_1", "GEOMETRY", "INTEGRATED_MATH_2", "ALGEBRA_II", "INTEGRATED_MATH_3"),
	PREFERENCE = c(1, 3, 1, 3, 1, 3, 1, 3, 2, 4, 2, 4, 2, 4, 2, 4), key = "SGP_PROJECTION_GROUP")


SGPstateData[["CO_PARCC"]][["Student_Report_Information"]] <- SGPstateData[["PARCC"]][["Student_Report_Information"]]
SGPstateData[["CO_PARCC"]][["Student_Report_Information"]][["Include_Front_Page_in_School_Catalog"]] <- FALSE
SGPstateData[["CO_PARCC"]][["Student_Report_Information"]][["sgPlot.year.span"]] <- 3 # Number of years to represent in Chart.  Default is 5.  Here 3 = 2 test years and 1 future year (growth proj fan)
SGPstateData[["CO_PARCC"]][["Student_Report_Information"]][["Proficiency_Label"]] <- "benchmark"
SGPstateData[["CO_PARCC"]][["Student_Report_Information"]][["Achievement_Level_Labels"]] <- list(
		"Did Not Yet Meet"="Level 1",
		"Partially Meeting"="Level 2",
		"Approaching"="Level 3",
		"Meeting"="Level 4",
		"Exceeding"="Level 5")


SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["sgp.cohort.size"]] <- 2000
SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["sgp.less.than.sgp.cohort.size.return"]] <- "<2000"
SGPstateData[["CO_PARCC"]][["SGP_Configuration"]][["return.norm.group.scale.scores"]] <- TRUE

SGPstateData[["CO_PARCC"]][["Variable_Name_Lookup"]] <- SGPstateData[["CO_ORIGINAL"]][["Variable_Name_Lookup"]]

###
###   COLORADO (CMAS)
###

SGPstateData[["CO"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "No Score"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["CO"]][["Growth"]][["Cutscores"]] <- list(
		Cuts=c(35, 66),
		Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["CO"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["CO"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

load("Knots_Boundaries/CO_CMAS_Knots_Boundaries.Rdata")
SGPstateData[["CO"]][["Achievement"]][["Knots_Boundaries"]] <- CO_CMAS_Knots_Boundaries

cmas.cs <- PARCC_Cutscores[grepl("_SS", names(PARCC_Cutscores))]
names(cmas.cs) <- gsub("_SS", "", names(cmas.cs))
cmas.cs[["ELA"]] <-  cmas.cs[["ELA"]][1:7] #  Avoid warning in ISRs production
SGPstateData[["CO"]][["Achievement"]][["Cutscores"]] <- cmas.cs

SGPstateData[["CO"]][["Achievement"]][["Cutscores"]] <-
  c(SGPstateData[["CO"]][["Achievement"]][["Cutscores"]],
  	list(  ###  PSAT/SAT "Percentile" Cutscores Based on Knots/Bounds
      ELA_PSAT_9= list(
        GRADE_9 = c(370, 420, 480, 540)),
      ELA_PSAT_10=list(
        GRADE_10= c(390, 440, 500, 560)),
      ELA_SAT  =  list(
        GRADE_11= c(420, 480, 540, 610)),
      MATHEMATICS_PSAT_9=list(
  			GRADE_9 = c(370, 420, 470, 520)),
  		MATHEMATICS_PSAT_10=list(
  			GRADE_10= c(390, 430, 480, 540)),
  		MATHEMATICS_SAT=list(
  			GRADE_11= c(400, 470, 530, 590))
  	)
  )

	SGPstateData[["CO"]][["Assessment_Program_Information"]] <- list(
		Assessment_Name="Colorado Measures of Academic Success",
		Assessment_Abbreviation="CMAS",
		Organization=list(
			Name="Colorado Department of Education",
			Abbreviation="CDE",
			URL="www.cde.state.co.us/accountability/",
			Contact="growth.questions@cde.state.co.us"),
			Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "PSAT ELA 9", "PSAT Math 9", "PSAT ELA 10", "PSAT Math 10", "SAT ELA", "SAT Math"),
			Grades_Tested=c(3,4,5,6,7,8,9,10,11),
			Assessment_Years=c("2015", "2016", "2017", "2018", "2019"),
			Test_Season="Spring",
			Test_Vendor="Pearson",
			CSEM="SCALE_SCORE_CSEM")

	SGPstateData[["CO"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
		list(
			Assessment_Abbreviation="CMAS",
			Assessment_Abbreviation.9="PSAT/SAT",
			Assessment_Name="Colorado Measures of Academic Success",
			Assessment_Name.9="PSAT and SAT College Admissions Assessments",
			Achievement_Levels=list(
				Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "No Score"),
				Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
			Achievement_Levels.9=list(
				Labels=c("1 to 20", "21 to 40", "41 to 60", "61 to 80", "81 to 99"),
				Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient")),
			Achievement_Level_Labels=list(
				"Level 1"="Did Not Yet Meet Expectations",
			  "Level 2"="Partially Met Expectations",
			  "Level 3"="Approached Expectations",
			  "Level 4"="Met Expectations",
			  "Level 5"="Exceeded Expectations"),
			Achievement_Level_Labels.9=list(
				"1 to 20" = "1st to 20th Percentiles",
			  "21 to 40"="21st to 40th Percentiles",
			  "41 to 60"="41st to 60th Percentiles",
			  "61 to 80"="61st to 80th Percentiles",
			  "81 to 99"="81st to 99th Percentiles"),
			Content_Areas=c("English Language Arts", "Mathematics", "Algebra I", "Geometry"),
			Content_Areas.9=c("PSAT 9 ELA", "PSAT 10 ELA", "SAT ELA", "PSAT 9 Math", "PSAT 10 Math", "SAT Math"),
			Content_Areas_Labels=list(
					ELA="English Language Arts", MATHEMATICS="Math", GEOMETRY="Geometry", ALGEBRA_I="Algebra I"),
			Content_Areas_Labels.9=list(
					ELA_PSAT_9="ELA", ELA_PSAT_10="ELA", ELA_SAT="ELA",
					MATHEMATICS_PSAT_9 = "Math", MATHEMATICS_PSAT_10 = "Math", MATHEMATICS_SAT = "Math"),
			Vertical_Scale="No",
			Vertical_Scale.9="No",
			Grades_Tested=c(3,4,5,6,7,8, "EOCT"),
			Grades_Tested.9=c(9,10,11),
			Grade="9" # DON'T INCLUDE "Year" !!!
		)

  SGPstateData[["CO"]][["SGP_Configuration"]] = list(
    sgp.cohort.size = 2000,
    sgp.less.than.sgp.cohort.size.return = "<2000",
    return.norm.group.scale.scores = TRUE,
    arrow.legend.color = c("#FD5050", "#FDBF1A", "#07B806"),
    sgPlot.use.student.id = TRUE,
    grade.projection.sequence = list(
			ELA    =    c("3", "4", "5", "6", "7", "8", "9"),  # c("3", "4", "5", "6", "7", "8", "9", "10", "11"), Available in 2019.  No "ELA_PSAT_9" to "ELA_PSAT_10" available in 2018
      ELA_PSAT_9 =c("3", "4", "5", "6", "7", "8", "9"),
      ELA_PSAT_10=c("10", "11"),
      ELA_SAT  =  c("10", "11"),

			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "9"), # c("3", "4", "5", "6", "7", "8", "9", "10", "11"), Available in 2019.  No "MATHEMATICS_PSAT_9" to "MATHEMATICS_PSAT_10" available in 2018
			ALGEBRA_I = c("3", "4", "5", "6", "7", "EOCT", "9"),
			GEOMETRY  = c("7", "EOCT"),
			ALGEBRA_II= c("8", "EOCT"),
			INTEGRATED_MATH_1 = c("7", "EOCT"),
			MATHEMATICS_PSAT_9 =c("3", "4", "5", "6", "7", "8", "9"),
      MATHEMATICS_PSAT_10=c("10", "11"),
      MATHEMATICS_SAT  =  c("10", "11")),
    content_area.projection.sequence = list(
			ELA = c(rep("ELA", 6), "ELA_PSAT_9"), # c(rep("ELA", 6), "ELA_PSAT_9", "ELA_PSAT_10", "ELA_SAT"),  #  Available in 2019.  No "ELA_PSAT_9" to "ELA_PSAT_10" available in 2018
      ELA_PSAT_9 =c(rep("ELA", 6), "ELA_PSAT_9"), # "ELA_PSAT_10", "ELA_SAT"),
      ELA_PSAT_10=c("ELA_PSAT_10", "ELA_SAT"), # c(rep("ELA", 6), "ELA_PSAT_9", "ELA_PSAT_10", "ELA_SAT"),
      ELA_SAT  =  c("ELA_PSAT_10", "ELA_SAT"),     # c(rep("ELA", 6), "ELA_PSAT_9", "ELA_PSAT_10", "ELA_SAT"),

			MATHEMATICS = c(rep("MATHEMATICS", 6), "MATHEMATICS_PSAT_9"), # c(rep("MATHEMATICS", 6), "MATHEMATICS_PSAT_9", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"), Available in 2019.  No "MATHEMATICS_PSAT_9" to "MATHEMATICS_PSAT_10" available in 2018
			ALGEBRA_I= c(rep("MATHEMATICS", 5), "ALGEBRA_I", "MATHEMATICS_PSAT_9"),
			GEOMETRY = c("MATHEMATICS", "GEOMETRY"),
			ALGEBRA_II=c("MATHEMATICS", "ALGEBRA_II"),
			INTEGRATED_MATH_1 = c("MATHEMATICS", "INTEGRATED_MATH_1"),
			MATHEMATICS_PSAT_9 =c(rep("MATHEMATICS", 6), "MATHEMATICS_PSAT_9"), # c(rep("MATHEMATICS", 6), "MATHEMATICS_PSAT_9", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
      MATHEMATICS_PSAT_10=c("MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"), # c(rep("MATHEMATICS", 6), "MATHEMATICS_PSAT_9", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
      MATHEMATICS_SAT  =  c("MATHEMATICS_PSAT_10", "MATHEMATICS_SAT")),
    year_lags.projection.sequence = list(
			ELA = rep(1L, 6), # rep(1L, 8)
      ELA_PSAT_9=rep(1L, 6),
      ELA_PSAT_10=1L,
      ELA_SAT  =  1L,

			MATHEMATICS = rep(1L, 6), # rep(1L, 8)
			ALGEBRA_I =rep(1L, 6),
			GEOMETRY = 1L,
			ALGEBRA_II=1L,
			INTEGRATED_MATH_1 = 1L,
			MATHEMATICS_PSAT_9=rep(1L, 6),
			MATHEMATICS_PSAT_10=1L,
			MATHEMATICS_SAT  =  1L)
  )

	SGPstateData[["CO"]][['SGP_Progression_Preference']] <- data.table(
		SGP_PROJECTION_GROUP = c("MATHEMATICS", "MATHEMATICS_PSAT_9", "ALGEBRA_I", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
		PREFERENCE = c(1, 2, 3, 1, 1), key = "SGP_PROJECTION_GROUP")

	SGPstateData[["CO"]][["Student_Report_Information"]] = list(
    Include_Front_Page_in_School_Catalog = FALSE,
    sgPlot.year.span = 3, # Number of years to represent in Chart.  Default is 5.  Here 3 = 2 test years and 1 future year (growth proj fan)
    Grades_Reported = list(
      ELA = c("3", "4", "5", "6", "7", "8"),
      ELA_PSAT_9 = "9",
  		ELA_PSAT_10 = "10",
  		ELA_SAT = "11",
      MATHEMATICS = c("3", "4", "5", "6", "7", "8", "EOCT"), # "EOCT" while ALGEBRA_I in ISRs
      ALGEBRA_I = "EOCT",
      GEOMETRY = "EOCT",
      INTEGRATED_MATH_1 = "EOCT",
      INTEGRATED_MATH_2 = "EOCT",
      INTEGRATED_MATH_3 = "EOCT",
      MATHEMATICS_PSAT_9 = "9",
      MATHEMATICS_PSAT_10 = "10",
  		MATHEMATICS_SAT = "11"),
    Proficiency_Label = "benchmark",
    Achievement_Level_Labels = list(
			"Level 1"="Did Not Yet Meet Expectations",
		  "Level 2"="Partially Met Expectations",
		  "Level 3"="Approached Expectations",
		  "Level 4"="Met Expectations",
		  "Level 5"="Exceeded Expectations"),
    Content_Areas_Labels = list(
			ELA = "ELA",
      ELA_PSAT_9 = "PSAT 9 ELA",
      ELA_PSAT_10= "PSAT 10 ELA",
      ELA_SAT    = "SAT ELA",
			MATHEMATICS = "Mathematics",
			ALGEBRA_I = "Algebra I",
			ALGEBRA_II = "Algebra II",
			GEOMETRY = "Geometry",
			INTEGRATED_MATH_1 = "Int Math 1",
			INTEGRATED_MATH_2 = "Int Math 2",
			INTEGRATED_MATH_3 = "Int Math 3",
      MATHEMATICS_PSAT_9 = "PSAT 9 Math",
      MATHEMATICS_PSAT_10= "PSAT 10 Math",
      MATHEMATICS_SAT    = "SAT Math"),
    Content_Areas_Domains = list(
      ELA = "ELA",
      ELA_PSAT_9 = "ELA",
      ELA_PSAT_10= "ELA",
      ELA_SAT    = "ELA",
      MATHEMATICS = "MATHEMATICS",
			ALGEBRA_I = "MATHEMATICS",
			ALGEBRA_II = "MATHEMATICS",
			GEOMETRY = "MATHEMATICS",
			INTEGRATED_MATH_1 = "MATHEMATICS",
			INTEGRATED_MATH_2 = "MATHEMATICS",
			INTEGRATED_MATH_3 = "MATHEMATICS",
      MATHEMATICS_PSAT_9 = "MATHEMATICS",
      MATHEMATICS_PSAT_10= "MATHEMATICS",
      MATHEMATICS_SAT    = "MATHEMATICS"),
    Grades_Reported_Domains = list(
      ELA = c("3","4","5","6","7","8","9","10","11"),
      ELA_PSAT_9 = c("3","4","5","6","7","8","9","10","11"),
      ELA_PSAT_10= c("3","4","5","6","7","8","9","10","11"),
      ELA_SAT    = c("3","4","5","6","7","8","9","10","11"),
      MATHEMATICS = c("3","4","5","6","7","8","9","10","11", "EOCT"),
			ALGEBRA_I = c("3","4","5","6","7", "EOCT", "9"),
			ALGEBRA_II = "EOCT",
			GEOMETRY = c("3","4","5","6","7", "EOCT", "9"),
			INTEGRATED_MATH_1 = "EOCT",
			INTEGRATED_MATH_2 = "EOCT",
			INTEGRATED_MATH_3 = "EOCT",
      MATHEMATICS_PSAT_9 = c("3","4","5","6","7","8","9","10","11", "EOCT"),
      MATHEMATICS_PSAT_10= c("3","4","5","6","7","8","9","10","11", "EOCT"),
      MATHEMATICS_SAT    = c("3","4","5","6","7","8","9","10","11", "EOCT")),
    Vertical_Scale = list(
			ELA=FALSE, ELA_PSAT_9=FALSE, ELA_PSAT_10=FALSE, ELA_SAT=FALSE,
      MATHEMATICS=FALSE, MATHEMATICS_PSAT_9=FALSE, MATHEMATICS_PSAT_10=FALSE, MATHEMATICS_SAT=FALSE,
      GEOMETRY=FALSE, ALGEBRA_I=FALSE, ALGEBRA_II=FALSE, INTEGRATED_MATH_1=FALSE, INTEGRATED_MATH_2=FALSE, INTEGRATED_MATH_3=FALSE),
		Earliest_Year_Reported = list(
			ELA="2015", ELA_PSAT_9 = "2018", ELA_PSAT_10 = "2016", ELA_SAT = "2017",
			MATHEMATICS="2015", MATHEMATICS_PSAT_9="2018", MATHEMATICS_PSAT_10 = "2016", MATHEMATICS_SAT = "2017",
			ALGEBRA_I="2015", GEOMETRY="2015", ALGEBRA_II="2015", INTEGRATED_MATH_1="2015", INTEGRATED_MATH_2="2015", INTEGRATED_MATH_3="2015"),
    Transformed_Achievement_Level_Cutscores = list(
      ELA = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_PSAT_9 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_PSAT_10= c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_SAT    = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			ALGEBRA_I = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			ALGEBRA_II = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			GEOMETRY = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			INTEGRATED_MATH_1 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			INTEGRATED_MATH_2 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			INTEGRATED_MATH_3 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_PSAT_9 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_PSAT_10= c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_SAT    = c("2015", "2016", "2017", "2018", "2019", "2020", "2021")
    ),
    Transformed_Achievement_Level_Cutscores_gaPlot = list(
      ELA = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_PSAT_9 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_PSAT_10= c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      ELA_SAT    = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
			ALGEBRA_I = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_PSAT_9 = c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_PSAT_10= c("2015", "2016", "2017", "2018", "2019", "2020", "2021"),
      MATHEMATICS_SAT    = c("2015", "2016", "2017", "2018", "2019", "2020", "2021")
    )
  )

SGPstateData[["CO"]][["Variable_Name_Lookup"]] <- SGPstateData[["CO_ORIGINAL"]][["Variable_Name_Lookup"]]


#########################################################
### CONNECTICUT
#########################################################

SGPstateData[["CT"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(381, 401, 425, 478),
			GRADE_4=c(412, 428, 449, 506),
			GRADE_5=c(434, 448, 466, 524),
			GRADE_6=c(440, 456, 475, 539),
			GRADE_7=c(454, 470, 487, 549),
			GRADE_8=c(466, 481, 500, 561)),
		WRITING=list(
			GRADE_3=c(188, 212, 240, 287),
			GRADE_4=c(185, 209, 237, 281),
			GRADE_5=c(186, 209, 238, 284),
			GRADE_6=c(185, 211, 237, 284),
			GRADE_7=c(192, 213, 236, 270),
			GRADE_8=c(189, 212, 236, 283)),
		MATHEMATICS=list(
			GRADE_3=c(395, 417, 450, 484),
			GRADE_4=c(430, 451, 484, 529),
			GRADE_5=c(451, 476, 506, 556),
			GRADE_6=c(466, 493, 526, 572),
			GRADE_7=c(481, 510, 544, 593),
			GRADE_8=c(497, 523, 558, 607)))

SGPstateData[["CT"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Below Basic", "Basic", "Proficient", "Goal", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient"))

SGPstateData[["CT"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["CT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["CT"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(35, 66),
	Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["CT"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Connecticut Mastery Test",
	Assessment_Abbreviation="CMT",
	Organization=list(
		Name="Connecticut State Department of Education",
		Abbreviation="CSDE",
		URL="www.sde.ct.gov",
		Contact="860-713-6543"),
	Content_Areas=c("Mathematics", "Reading", "Writing"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Test_Vendor="Measurement Incorporated")

SGPstateData[["CT"]][["Student_Report_Information"]] <-
	list(
	Transformed_Achievement_Level_Cutscores=list(
											WRITING=as.character(2009:2014)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
											WRITING=as.character(2009:2014)),
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE, WRITING=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", WRITING="Writing"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), WRITING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Goal"="Goal",
		"Advanced"="Advanced"))


#########################################################
### DEMO
#########################################################

load("CSEM/Demonstration/Demonstration_CSEM.Rdata")
SGPstateData[["DEMO"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(150, 700),
			boundaries_4=c(180, 780),
			boundaries_5=c(220, 800),
			boundaries_6=c(240, 830),
			boundaries_7=c(280, 860),
			boundaries_8=c(310, 890),
			boundaries_9=c(340, 920),
			boundaries_10=c(370, 950),
			knots_3=c(392, 440, 481, 529),
			knots_4=c(425, 470, 506, 546),
			knots_5=c(452, 495, 530, 569),
			knots_6=c(465, 509, 546, 588),
			knots_7=c(490, 530, 565, 600),
			knots_8=c(500, 545, 580, 620),
			knots_9=c(515, 560, 595, 630),
			knots_10=c(530, 575, 610, 645),
			loss.hoss_3=c(150, 700),
			loss.hoss_4=c(180, 780),
			loss.hoss_5=c(220, 800),
			loss.hoss_6=c(240, 830),
			loss.hoss_7=c(280, 860),
			loss.hoss_8=c(310, 890),
			loss.hoss_9=c(340, 920),
			loss.hoss_10=c(370, 950)),
		READING=list(
			boundaries_3=c(150, 795),
			boundaries_4=c(180, 940),
			boundaries_5=c(220, 955),
			boundaries_6=c(260, 970),
			boundaries_7=c(300, 980),
			boundaries_8=c(330, 990),
			boundaries_9=c(350, 995),
			boundaries_10=c(370, 999),
			knots_3=c(510, 550, 580, 615),
			knots_4=c(542, 580, 606, 635),
			knots_5=c(562, 602, 632, 665),
			knots_6=c(575, 615, 645, 675),
			knots_7=c(586, 625, 655, 690),
			knots_8=c(605, 642, 670, 702),
			knots_9=c(620, 655, 680, 706),
			knots_10=c(642, 675, 700, 730),
			loss.hoss_3=c(150, 795),
			loss.hoss_4=c(180, 940),
			loss.hoss_5=c(220, 955),
			loss.hoss_6=c(260, 970),
			loss.hoss_7=c(300, 980),
			loss.hoss_8=c(330, 990),
			loss.hoss_9=c(350, 995),
			loss.hoss_10=c(370, 999)),
		ALGEBRA_I=list( #### Utilized for tests with analyses involving EOCTs. See, for example, testSGP(3)
			boundaries_EOCT=c(340, 920),
			knots_EOCT=c(515, 560, 595, 630),
			loss.hoss_EOCT=c(340, 920)),
		ALGEBRA_II=list(
			boundaries_EOCT=c(370, 950),
			knots_EOCT=c(530, 575, 610, 645),
			loss.hoss_EOCT=c(370, 950)),
		GRADE_9_LIT=list(
			boundaries_EOCT=c(350, 995),
			knots_EOCT=c(620, 655, 680, 706),
			loss.hoss_EOCT=c(350, 995)),
		AMERICAN_LIT=list(
			boundaries_EOCT=c(370, 999),
			knots_EOCT=c(642, 675, 700, 730),
			loss.hoss_EOCT=c(370, 999)))

SGPstateData[["DEMO"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(335, 419, 510),
			GRADE_4=c(383, 455, 538),
			GRADE_5=c(422, 494, 562),
			GRADE_6=c(454, 520, 589),
			GRADE_7=c(487, 559, 614),
			GRADE_8=c(521, 577, 628),
			GRADE_9=c(548, 602, 652),
			GRADE_10=c(562, 627, 692)),
		READING=list(
			GRADE_3=c(466, 526, 656),
			GRADE_4=c(517, 572, 671),
			GRADE_5=c(538, 588, 691),
			GRADE_6=c(543, 600, 696),
			GRADE_7=c(567, 620, 716),
			GRADE_8=c(578, 632, 724),
			GRADE_9=c(585, 642, 739),
			GRADE_10=c(607, 663, 747)),
		ALGEBRA_I=list(
			GRADE_EOCT=c(548, 602, 652)),
		ALGEBRA_II=list(
			GRADE_EOCT=c(562, 627, 692)),
		GRADE_9_LIT=list(
			GRADE_EOCT=c(585, 642, 739)),
		AMERICAN_LIT=list(
			GRADE_EOCT=c(607, 663, 747)))

SGPstateData[["DEMO"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Unsatisfactory", "Partially Proficient", "Proficient", "Advanced", "No Score"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["DEMO"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Typical", "High", "Very High")

SGPstateData[["DEMO"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["DEMO"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(20, 40, 61, 81),
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["DEMO"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Demonstration Student Assessment Program",
	Assessment_Abbreviation="DEMO",
	Organization=list(
		Name="Student Growth Percentiles Package",
		Abbreviation="the SGP Package",
		URL="www.sgp.io",
		Contact="dbetebenner@nciea.org"),
	Content_Areas=c("Mathematics", "Reading", "Grade 9 Literature", "American Literature", "Algebra I", "Algebra II"),
	Grades_Tested=c(3,4,5,6,7,8,9,10),
	Assessment_Years=c("2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"),
	Test_Vendor="CTB/McGraw Hill",
	Test_Season="Spring",
	CSEM=Demonstration_CSEM)

SGPstateData[["DEMO"]][["Student_Report_Information"]] <-
	list(
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Projection_Fan_Limits=c(5, 95),
	Content_Areas_Labels=list(MATHEMATICS="Mathematics", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10)),
	# Use_EOCT_Label = TRUE, # Use this (non-NULL) to print 'EOCT' instead of CONTENT_AREA in first row of
	Achievement_Level_Labels=list(
		"Unsatisfactory"="Unsatisfactory",
		"Part Proficient"="Partially Proficient",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

SGPstateData[["DEMO"]][["SGP_Configuration"]] <- list(
				sgp.minimum.default.panel.years=3,
				projcuts.digits=0,
				percentile.cuts=c(1,20,40,61,81,99),
				lagged.percentile.trajectory.values=c(1,20,40,61,81,99),
				return.norm.group.scale.scores=TRUE,
				return.norm.group.dates=TRUE,
				return.projection.group.scale.scores=TRUE,
				return.projection.group.dates=TRUE,
				sgp.target.scale.scores.merge="1_year_lagged_current",
				sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
				sgPlot.output.format=c("PDF", "PDF_PIECES"),
				sgp.projections.max.forward.progression.years=FALSE,
				gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, READING=TRUE))

load("Baseline_Coefficient_Matrices/DEMO/DEMO_Baseline_Matrices.Rdata")
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- DEMO_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- DEMO_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["GRADE_9_LIT.BASELINE"]] <- DEMO_Baseline_Matrices[["GRADE_9_LIT.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["AMERICAN_LIT.BASELINE"]] <- DEMO_Baseline_Matrices[["AMERICAN_LIT.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ALGEBRA_I.BASELINE"]] <- DEMO_Baseline_Matrices[["ALGEBRA_I.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ALGEBRA_II.BASELINE"]] <- DEMO_Baseline_Matrices[["ALGEBRA_II.BASELINE"]]
SGPstateData[["DEMO"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/DEMO_Variable_Name_Lookup.csv", colClasses=c(rep("character",3), "logical"))
load("SGP_Norm_Group_Preference/DEMO_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["DEMO"]][["SGP_Norm_Group_Preference"]] <- DEMO_SGP_Norm_Group_Preference


#########################################################
### DEMO EOCT (Necessary for some testSGP routines)
#########################################################

SGPstateData[["DEMO_EOCT"]] <- SGPstateData[['DEMO']]
SGPstateData[["DEMO_EOCT"]][["Variable_Name_Lookup"]][["names.provided"]] <- SGPstateData[["DEMO_EOCT"]][["Variable_Name_Lookup"]][["names.sgp"]]
setnames(SGPstateData[["DEMO_EOCT"]][["Variable_Name_Lookup"]], c("names.sgp.type","names.sgp.info","names.sgp.output"), c("names.type","names.info","names.output"))
SGPstateData[["DEMO_EOCT"]][["Variable_Name_Lookup"]] <- SGPstateData[["DEMO_EOCT"]][["Variable_Name_Lookup"]][-(c(9:14, 18:19, 21)),]

SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
	READING=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
	MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
	GRADE_9_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
	AMERICAN_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
	ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
	ALGEBRA_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"))
SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
	READING=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
	GRADE_9_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
	AMERICAN_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
	MATHEMATICS=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II"),
	ALGEBRA_I=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II"),
	ALGEBRA_II=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II"))
SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
	READING=rep(1L, 7),
	MATHEMATICS=rep(1L, 7),
	GRADE_9_LIT=rep(1L, 7),
	AMERICAN_LIT=rep(1L, 7),
	ALGEBRA_I=rep(1L, 7),
	ALGEBRA_II=rep(1L, 7))
SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["max.forward.projection.sequence"]] <- list(
	READING=7,
	MATHEMATICS=7,
	GRADE_9_LIT=7,
	AMERICAN_LIT=7,
	ALGEBRA_I=7,
	ALGEBRA_II=7)

# SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["fix.duplicates"]] <- "KEEP.ALL"
SGPstateData[["DEMO_EOCT"]][["SGP_Configuration"]][["sgPlot.show.content_area.progression"]] <- TRUE
SGPstateData[["DEMO_EOCT"]][["SGP_Norm_Group_Preference"]] <- NULL
SGPstateData[["DEMO_EOCT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["DEMO_EOCT"]][["Student_Report_Information"]] <- list(
	# Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=sgpData.years, READING=sgpData.years, GRADE_9_LIT=sgpData.years, AMERICAN_LIT=sgpData.years, ALGEBRA_I=sgpData.years, ALGEBRA_II=sgpData.years), ### FOR TESTING
	# Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=sgpData.years, READING=sgpData.years, GRADE_9_LIT=sgpData.years, AMERICAN_LIT=sgpData.years, ALGEBRA_I=sgpData.years, ALGEBRA_II=sgpData.years), ### FOR TESTING
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE, GRADE_9_LIT=TRUE, AMERICAN_LIT=TRUE, ALGEBRA_I=TRUE, ALGEBRA_II=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Mathematics", READING="Reading", GRADE_9_LIT="Grade 9 Literature", AMERICAN_LIT="American Literature", ALGEBRA_I="Algebra I", ALGEBRA_II="Algebra II"),
	Content_Areas_Domains=list(MATHEMATICS="MATHEMATICS", READING="READING", GRADE_9_LIT="READING", AMERICAN_LIT="READING", ALGEBRA_I="MATHEMATICS", ALGEBRA_II="MATHEMATICS"),
	Grades_Reported=list(MATHEMATICS=c("3","4","5","6","7","8"), READING=c("3","4","5","6","7","8"), GRADE_9_LIT="EOCT", AMERICAN_LIT="EOCT", ALGEBRA_I="EOCT", ALGEBRA_II="EOCT"),
	Grades_Reported_Domains=list(MATHEMATICS=c("3","4","5","6","7","8","EOCT"), READING=c("3","4","5","6","7","8","EOCT")),
	Achievement_Level_Labels=list(
		"Unsatisfactory"="Unsatisfactory",
		"Part Proficient"="Partially Proficient",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))


#########################################################
### GUATEMALA/GUA
#########################################################

load("Knots_Boundaries/GUA_Knots_Boundaries.Rdata")
SGPstateData[["GUA"]][["Achievement"]][["Knots_Boundaries"]] <- GUA_Knots_Boundaries

SGPstateData[["GUA"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_0=c(-0.844, 0.201,  1.261),
			GRADE_1=c(-0.844, 0.201,  1.261),
			GRADE_2=c(-0.66179, -0.37087, 0.08916),
			GRADE_3=c(-0.844, 0.193, 1.237),
			GRADE_4=c(-0.844, 0.193, 1.237)))

SGPstateData[["GUA"]][["Achievement"]][["Levels"]] <-
	list(
	 	Labels=c("Insatisfactorio", "Necesita mejorar", "Satisfactorio", "Excelente"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["GUA"]][["Growth"]][["Levels"]] <- c("Muy bajo", "Bajo", "T\u{ED}pico", "Alto", "Muy alto")
SGPstateData[["GUA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["GUA"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(20, 40, 61, 81), Labels=list("1st-19th", "20th-39th", "40th-60th", "61st-80th", "81st-99th"))

SGPstateData[["GUA"]][["Assessment_Program_Information"]][["Grades_Tested"]] <- c(0,1,2,3,4)

SGPstateData[["GUA"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
#										MATHEMATICS=as.character(2012:2018),
										READING=as.character(2012:2018)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
#										MATHEMATICS=as.character(2012:2018),
										READING=as.character(2012:2018)),
#		Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
		Vertical_Scale=list(READING=FALSE),
#		Content_Areas_Labels=list(MATHEMATICS="Matem\u{E1}ticas", READING="Lectura"),
		Content_Areas_Labels=list(READING="Lectura"),
#		Grades_Reported=list(MATHEMATICS=c(0,1,2,3,4), READING=c(0,1,2,3,4)),
		Grades_Reported=list(READING=c(0,1,2,3,4)),
		Achievement_Level_Labels=list(
			"Insatisfactorio"="Insatisfactorio",
			"Necesita mejorar"="Necesita mejorar",
			"Satisfactorio"="Satisfactorio",
			"Excelente"="Excelente"))

SGPstateData[["GUA"]][["SGP_Configuration"]] <- list(
							highest.level.summary.grouping="COUNTRY",
							sgp.minimum.default.panel.years=2)

SGPstateData[["GUA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/GUA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### GEORGIA
#########################################################

# load("CSEM/Georgia/Georgia_CSEM.Rdata")

SGPstateData[["GA"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			knots_1=c(805, 824, 840, 860),
			knots_2=c(804, 819, 835, 853),
			knots_3=c(797, 822, 841, 864),
			knots_4=c(792, 814, 833, 855),
			knots_5=c(800, 820, 839, 863),
			knots_6=c(792, 807, 822, 842),
			knots_7=c(800, 819, 835, 857),
			knots_8=c(790, 808, 827, 850),
			boundaries_1=c(656.1, 954.9),
			boundaries_2=c(681.4, 952.6),
			boundaries_3=c(616, 1024),
			boundaries_4=c(616, 1024),
			boundaries_5=c(616, 1024),
			boundaries_6=c(648.6, 977.4),
			boundaries_7=c(651.9, 977.1),
			boundaries_8=c(634.7, 1022.3),
			loss.hoss_1=c(681, 930),
			loss.hoss_2=c(704, 930),
			loss.hoss_3=c(650, 990),
			loss.hoss_4=c(650, 990),
			loss.hoss_5=c(650, 990),
			loss.hoss_6=c(650, 950),
			loss.hoss_7=c(650, 950),
			loss.hoss_8=c(650, 990)),
		MATHEMATICS.2015=list(
			knots_3=c(473, 499, 523, 552),
			knots_4=c(473, 499, 525, 558),
			knots_5=c(467, 495, 521, 553),
			knots_6=c(467, 494, 521, 553),
			knots_7=c(468, 495, 524, 563),
			knots_8=c(468, 493, 519, 552),
			boundaries_3=c(248.5, 746.5),
			boundaries_4=c(225.5, 759.5),
			boundaries_5=c(219.0, 771.0),
			boundaries_6=c(243.5, 741.5),
			boundaries_7=c(217.5, 787.5),
			boundaries_8=c(227.0, 803.0),
			loss.hoss_3=c(290, 705),
			loss.hoss_4=c(270, 715),
			loss.hoss_5=c(265, 725),
			loss.hoss_6=c(285, 700),
			loss.hoss_7=c(265, 740),
			loss.hoss_8=c(275, 755)),
		READING=list(
			knots_1=c(810, 827, 841, 862),
			knots_2=c(814, 831, 850, 862),
			knots_3=c(808, 826, 840, 860),
			knots_4=c(806, 824, 838, 854),
			knots_5=c(805, 821, 834, 850),
			knots_6=c(811, 825, 838, 854),
			knots_7=c(806, 819, 831, 843),
			knots_8=c(812, 825, 836, 850),
			boundaries_1=c(687.9, 941.1),
			boundaries_2=c(623, 947),
			boundaries_3=c(623, 947),
			boundaries_4=c(623, 947),
			boundaries_5=c(623, 947),
			boundaries_6=c(691.2, 940.8),
			boundaries_7=c(696.7, 940.3),
			boundaries_8=c(623, 947),
			loss.hoss_1=c(709, 920),
			loss.hoss_2=c(650, 920),
			loss.hoss_3=c(650, 920),
			loss.hoss_4=c(650, 920),
			loss.hoss_5=c(650, 920),
			loss.hoss_6=c(650, 920),
			loss.hoss_7=c(650, 920),
			loss.hoss_8=c(650, 920)),
		ELA=list(
			knots_1=c(802, 817, 831, 850),
			knots_2=c(804, 819, 832, 850),
			knots_3=c(806, 822, 836, 852),
			knots_4=c(805, 823, 836, 853),
			knots_5=c(811, 826, 840, 856),
			knots_6=c(809, 824, 836, 851),
			knots_7=c(811, 827, 840, 852),
			knots_8=c(811, 828, 842, 856),
			boundaries_1=c(624, 936),
			boundaries_2=c(672.4, 931.6),
			boundaries_3=c(666, 954),
			boundaries_4=c(622, 958),
			boundaries_5=c(679.2, 952.8),
			boundaries_6=c(681.4, 952.6),
			boundaries_7=c(622, 958),
	 		boundaries_8=c(620, 980),
			loss.hoss_1=c(650, 910),
			loss.hoss_2=c(694, 910),
			loss.hoss_3=c(650, 930),
			loss.hoss_4=c(650, 930),
			loss.hoss_5=c(650, 930),
			loss.hoss_6=c(650, 930),
			loss.hoss_7=c(650, 930),
			loss.hoss_8=c(650, 950)),
		ELA.2015=list(
			knots_3=c(451, 486, 517, 553),
			knots_4=c(458, 491, 519, 550),
			knots_5=c(464, 496, 525, 556),
			knots_6=c(451, 490, 523, 560),
			knots_7=c(456, 492, 522, 553),
			knots_8=c(470, 501, 525, 553),
			boundaries_3=c(115.0, 895.0),
			boundaries_4=c(153.5, 831.5),
			boundaries_5=c(155.0, 815.0),
			boundaries_6=c(72.0, 888.0),
			boundaries_7=c(103.0, 847.0),
			boundaries_8=c(174.5, 780.5),
			loss.hoss_3=c(180, 830),
			loss.hoss_4=c(210, 775),
			loss.hoss_5=c(210, 760),
			loss.hoss_6=c(140, 820),
			loss.hoss_7=c(165, 785),
			loss.hoss_8=c(225, 730)),
		SCIENCE=list(
			knots_3=c(795, 817, 837, 858),
			knots_4=c(794, 818, 840, 865),
			knots_5=c(789, 814, 835, 860),
			knots_6=c(787, 804, 821, 841),
			knots_7=c(796, 817, 838, 861),
			knots_8=c(787, 804, 820, 839),
			boundaries_3=c(616, 1024),
			boundaries_4=c(616, 1024),
			boundaries_5=c(616, 1024),
			boundaries_6=c(619, 991),
			boundaries_7=c(619, 991),
			boundaries_8=c(619, 991),
			loss.hoss_3=c(650, 990),
			loss.hoss_4=c(650, 990),
			loss.hoss_5=c(650, 990),
			loss.hoss_6=c(650, 960),
			loss.hoss_7=c(650, 960),
			loss.hoss_8=c(650, 960)),
		SCIENCE.2015=list(
			knots_3=c(470, 493, 518, 544),
			knots_4=c(461, 489, 515, 547),
			knots_5=c(456, 490, 521, 561),
			knots_6=c(448, 487, 523, 563),
			knots_7=c(450, 486, 521, 561),
			knots_8=c(444, 478, 508, 544),
			boundaries_3=c(233, 737),
			boundaries_4=c(180, 780),
			boundaries_5=c(98.0, 842),
			boundaries_6=c(114.5, 840.5),
			boundaries_7=c(162.0, 798.0),
			boundaries_8=c(103.0, 847.0),
			loss.hoss_3=c(275, 695),
			loss.hoss_4=c(230, 730),
			loss.hoss_5=c(160, 780),
			loss.hoss_6=c(175, 780),
			loss.hoss_7=c(215, 745),
			loss.hoss_8=c(165, 785)),
		SOCIAL_STUDIES=list(
			knots_3=c(801, 818, 832, 850),
			knots_4=c(800, 816, 830, 850),
			knots_5=c(797, 815, 830, 850),
			knots_6=c(778, 800, 822, 850),
			knots_7=c(778, 803, 829, 859),
			knots_8=c(788, 808, 827, 850),
			boundaries_3=c(642, 978),
			boundaries_4=c(620, 980),
			boundaries_5=c(669.5, 975.5),
			boundaries_6=c(617, 1013),
			boundaries_7=c(617, 1013),
			boundaries_8=c(634.7, 1022.3),
			loss.hoss_3=c(650, 950),
			loss.hoss_4=c(650, 950),
			loss.hoss_5=c(650, 950),
			loss.hoss_6=c(650, 980),
			loss.hoss_7=c(650, 980),
			loss.hoss_8=c(650, 990)),
		SOCIAL_STUDIES.2015=list(
			knots_3=c(468, 494, 512, 539),
			knots_4=c(460, 491, 517, 547),
			knots_5=c(468, 491, 514, 535),
			knots_6=c(463, 489, 516, 546),
			knots_7=c(465, 494, 521, 553),
			knots_8=c(463, 493, 519, 549),
			boundaries_3=c(234.5, 720.5),
			boundaries_4=c(205.0, 745.0),
			boundaries_5=c(252.5, 702.5),
			boundaries_6=c(257.5, 707.5),
			boundaries_7=c(239.5, 725.5),
			boundaries_8=c(192.5, 762.5),
			loss.hoss_3=c(275, 680),
			loss.hoss_4=c(250, 700),
			loss.hoss_5=c(290, 665),
			loss.hoss_6=c(295, 670),
			loss.hoss_7=c(280, 685),
			loss.hoss_8=c(240, 715)),
		GRADE_9_LIT=list(
			knots_EOCT=c(393, 414, 432, 453),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		GRADE_9_LIT.2015=list(
			knots_EOCT=c(467, 498, 523, 552),
			boundaries_EOCT=c(169, 787),
			loss.hoss_EOCT=c(220, 735)),
		AMERICAN_LIT=list(
			knots_EOCT=c(404, 422, 437, 456),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		AMERICAN_LIT.2015=list(
			knots_EOCT=c(466, 497, 523, 556),
			boundaries_EOCT=c(138, 802),
			loss.hoss_EOCT=c(190, 750)),
		BIOLOGY=list(
			knots_EOCT=c(381, 402, 424, 450),
			boundaries_EOCT=c(155, 695),
			loss.hoss_EOCT=c(200, 650)),
		BIOLOGY.2015=list(
			knots_EOCT=c(443, 483, 525, 571),
			boundaries_EOCT=c(72, 888),
			loss.hoss_EOCT=c(140, 820)),
		PHYSICAL_SCIENCE=list(
			knots_EOCT=c(380, 407, 432, 464),
			boundaries_EOCT=c(145, 805),
			loss.hoss_EOCT=c(200, 750)),
		PHYSICAL_SCIENCE.2015=list(
			knots_EOCT=c(451, 481, 512, 549),
			boundaries_EOCT=c(78, 882),
			loss.hoss_EOCT=c(145, 815)),
		US_HISTORY=list(
			knots_EOCT=c(370, 400, 425, 456),
			boundaries_EOCT=c(155, 695),
			loss.hoss_EOCT=c(200, 650)),
		US_HISTORY.2015=list(
			knots_EOCT=c(464, 496, 526, 562),
			boundaries_EOCT=c(160, 820),
			loss.hoss_EOCT=c(215, 765)),
		ECONOMICS=list(
			knots_EOCT=c(385, 410, 431, 460),
			boundaries_EOCT=c(155, 695),
			loss.hoss_EOCT=c(200, 650)),
		ECONOMICS.2015=list(
			knots_EOCT=c(458, 495, 529, 571),
			boundaries_EOCT=c(71, 899),
			loss.hoss_EOCT=c(140, 830)),
		ALGEBRA=list(
			knots_EOCT=c(382, 403, 420, 439),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		ALGEBRA_I=list(
			knots_EOCT=c(458, 489, 519, 557),
			boundaries_EOCT=c(141, 844),
			loss.hoss_EOCT=c(200, 785)),
		GEOMETRY=list(
			knots_EOCT=c(391, 415, 436, 462),
			boundaries_EOCT=c(270, 630),
			loss.hoss_EOCT=c(200, 600)),
		GEOMETRY.2015=list(
			knots_EOCT=c(462, 495, 533, 582),
			boundaries_EOCT=c(116, 879),
			loss.hoss_EOCT=c(180, 815)),
		COORDINATE_ALGEBRA=list(
			knots_EOCT=c(363, 381, 396, 414),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		COORDINATE_ALGEBRA.2015=list(
			knots_EOCT=c(459, 486, 512, 548),
			boundaries_EOCT=c(158, 848),
			loss.hoss_EOCT=c(215, 790)),
		ANALYTIC_GEOMETRY=list(
			knots_EOCT=c(367, 382, 397, 419),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		ANALYTIC_GEOMETRY.2015=list(
			knots_EOCT=c(459, 486, 515, 555),
			boundaries_EOCT=c(122, 872),
			loss.hoss_EOCT=c(185, 810)),
		MATHEMATICS_I=list(
			knots_EOCT=c(384, 400, 417, 436),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)),
		MATHEMATICS_II=list(
			knots_EOCT=c(382, 396, 409, 430),
			boundaries_EOCT=c(160, 640),
			loss.hoss_EOCT=c(200, 600)))

SGPstateData[["GA"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(800, 850),
			GRADE_4=c(800, 850),
			GRADE_5=c(800, 850),
			GRADE_6=c(800, 850),
			GRADE_7=c(800, 850),
			GRADE_8=c(800, 850)),
		MATHEMATICS.2015=list(
			GRADE_3=c(475, 525, 580),
			GRADE_4=c(475, 525, 585),
			GRADE_5=c(475, 525, 580),
			GRADE_6=c(475, 525, 580),
			GRADE_7=c(475, 525, 580),
			GRADE_8=c(475, 525, 579)),
		READING=list(
			GRADE_3=c(800, 850),
			GRADE_4=c(800, 850),
			GRADE_5=c(800, 850),
			GRADE_6=c(800, 850),
			GRADE_7=c(800, 850),
			GRADE_8=c(800, 850)),
		ELA=list(
			GRADE_3=c(800, 850),
			GRADE_4=c(800, 850),
			GRADE_5=c(800, 850),
			GRADE_6=c(800, 850),
			GRADE_7=c(800, 850),
			GRADE_8=c(800, 850)),
		ELA.2015=list(
			GRADE_3=c(475, 525, 581),
			GRADE_4=c(475, 525, 574),
			GRADE_5=c(475, 525, 587),
			GRADE_6=c(475, 525, 599),
			GRADE_7=c(475, 525, 592),
			GRADE_8=c(475, 525, 581)),
		SCIENCE=list(
			GRADE_3=c(800, 850),
			GRADE_4=c(800, 850),
			GRADE_5=c(800, 850),
			GRADE_6=c(800, 850),
			GRADE_7=c(800, 850),
			GRADE_8=c(800, 850)),
		SCIENCE.2015=list(
			GRADE_3=c(475, 525, 566),
			GRADE_4=c(475, 525, 578),
			GRADE_5=c(475, 525, 595),
			GRADE_6=c(475, 525, 610),
			GRADE_7=c(475, 525, 589),
			GRADE_8=c(475, 525, 593)),
		SOCIAL_STUDIES=list(
			GRADE_3=c(800, 850),
			GRADE_4=c(800, 850),
			GRADE_5=c(800, 850),
			GRADE_6=c(800, 850),
			GRADE_7=c(800, 850),
			GRADE_8=c(800, 850)),
		SOCIAL_STUDIES.2015=list(
			GRADE_3=c(475, 525, 560),
			GRADE_4=c(475, 525, 570),
			GRADE_5=c(475, 525, 555),
			GRADE_6=c(475, 525, 560),
			GRADE_7=c(475, 525, 564),
			GRADE_8=c(475, 525, 572)),
		GRADE_9_LIT=list(
			GRADE_EOCT=c(400, 450)),
		GRADE_9_LIT.2015=list(
			GRADE_EOCT=c(475, 525, 587)),
		AMERICAN_LIT=list(
			GRADE_EOCT=c(400, 450)),
		AMERICAN_LIT.2015=list(
			GRADE_EOCT=c(475, 525, 590)),
		BIOLOGY=list(
			GRADE_EOCT=c(400, 450)),
		BIOLOGY.2015=list(
			GRADE_EOCT=c(475, 525, 609)),
		PHYSICAL_SCIENCE=list(
			GRADE_EOCT=c(400, 450)),
		PHYSICAL_SCIENCE.2015=list(
			GRADE_EOCT=c(475, 525, 604)),
		US_HISTORY=list(
			GRADE_EOCT=c(400, 450)),
		US_HISTORY.2015=list(
			GRADE_EOCT=c(475, 525, 590)),
		ECONOMICS=list(
			GRADE_EOCT=c(400, 450)),
		ECONOMICS.2015=list(
			GRADE_EOCT=c(475, 525, 610)),
		ALGEBRA=list(
			GRADE_EOCT=c(400, 450)),
		ALGEBRA_I=list(
			GRADE_EOCT=c(475, 525, 594)),
		ALGEBRA_I.2015=list(
			GRADE_EOCT=c(475, 525, 594)),
		COORDINATE_ALGEBRA=list(
			GRADE_EOCT=c(400, 450)),
		COORDINATE_ALGEBRA.2015=list(
			GRADE_EOCT=c(475, 525, 594)),
		ANALYTIC_GEOMETRY=list(
			GRADE_EOCT=c(400, 450)),
		ANALYTIC_GEOMETRY.2015=list(
			GRADE_EOCT=c(475, 525, 596)),
		GEOMETRY=list( # CRT Geometry (pre-Milestones)
			GRADE_EOCT=c(400, 450)),
		GEOMETRY.2015=list(
			GRADE_EOCT=c(475, 525, 596)),
		MATHEMATICS_I=list(
			GRADE_EOCT=c(400, 450)),
		MATHEMATICS_II=list(
			GRADE_EOCT=c(400, 450)))


SGPstateData[["GA"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Beginning Learner", "Developing Learner", "Proficient Learner", "Distinguished Learner"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
# SGPstateData[["GA"]][["Achievement"]][["Levels"]] <-
# 	list(
# 		Labels=c("Does Not Meet Expectations", "Meets Expectations", "Exceeds Expectations"),
# 		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["GA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["GA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced" # "Cohort and Baseline Referenced"

SGPstateData[["GA"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["GA"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Georgia Milestones Assessment System",
		Assessment_Abbreviation="Milestones",
		Content_Areas=c("Mathematics", "ELA", "Science", "Social Studies"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c('2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018'),
		Test_Season="Spring",
		Test_Vendor="CTB/McGraw Hill",
		Scale_Change=list(MATHEMATICS='2015', ELA='2015', SCIENCE='2015', SOCIAL_STUDIES='2015',
			AMERICAN_LIT='2015', ANALYTIC_GEOMETRY='2015', BIOLOGY='2015', COORDINATE_ALGEBRA='2015', ALGEBRA_I='2015', ECONOMICS='2015', GRADE_9_LIT='2015', PHYSICAL_SCIENCE='2015', US_HISTORY='2015'),
		CSEM="SCALE_SCORE_CSEM")
		# CSEM=Georgia_CSEM)

# SGPstateData[["GA"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
# 	list(
# 		Assessment_Abbreviation="GA-CRCT",
# 		Assessment_Abbreviation.2015="Milestones",
# 		Assessment_Name="Georgia Criterion-Referenced Competency Tests",
# 		Assessment_Name.2015="Georgia Milestones Assessment System",
# 		Achievement_Levels=list(
# 	 		Labels=c("Does Not Meet Expectations", "Meets Expectations", "Exceeds Expectations"),
# 	 		Proficient=c("Not Proficient", "Proficient", "Proficient")),
# 		Achievement_Levels.2015=list(
# 			Labels=c("Beginning Learner", "Developing Learner", "Proficient Learner", "Distinguished Learner"),
# 			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
# 		Achievement_Level_Labels=list(
# 			"Does Not Meet"="Does Not Meet Expectations",
# 			"Meets"="Meets Expectations",
# 			"Exceeds"="Exceeds Expectations"),
# 		Achievement_Level_Labels.2015=list(
# 			"Beginning Learner"="Beginning Learner",
# 			"Developing Learner"="Developing Learner",
# 			"Proficient Learner"="Proficient Learner",
# 			"Distinguished Learner"="Distinguished Learner"),
# 		Content_Areas=c("Mathematics", "Reading", "ELA", "Science", "Social Studies"),
# 		Content_Areas.2015=c("Mathematics", "ELA", "Science", "Social Studies"),
# 		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA", READING="Reading", SCIENCE="Science", SOCIAL_STUDIES="Social Studies"),
# 		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA", SCIENCE="Science", SOCIAL_STUDIES="Social Studies"),
# 		Vertical_Scale="No",
# 		Vertical_Scale.2015="No",
# 		Grades_Tested=c(3,4,5,6,7,8, "EOCT"),
# 		Grades_Tested.2015=c(3,4,5,6,7,8, "EOCT"),
# 		Year="2015"
# 	)

SGPstateData[["GA"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores = list(
											ELA=as.character(2007:2020),
											GRADE_9_LIT=as.character(2007:2020),
											AMERICAN_LIT=as.character(2007:2020),
											SOCIAL_STUDIES=as.character(2007:2020),
											US_HISTORY=as.character(2007:2020),
											ECONOMICS=as.character(2007:2020),
											SCIENCE=as.character(2007:2020),
											BIOLOGY=as.character(2007:2020),
											PHYSICAL_SCIENCE=as.character(2007:2020),
											MATHEMATICS=as.character(2007:2020),
											COORDINATE_ALGEBRA=as.character(2007:2020),
											ANALYTIC_GEOMETRY=as.character(2007:2020),
											ALGEBRA_I=as.character(2007:2020),
											GEOMETRY=as.character(2007:2020)),
		Transformed_Achievement_Level_Cutscores_gaPlot = list(
											ELA=as.character(2007:2020),
											GRADE_9_LIT=as.character(2007:2020),
											AMERICAN_LIT=as.character(2007:2020),
											SOCIAL_STUDIES=as.character(2007:2020),
											US_HISTORY=as.character(2007:2020),
											ECONOMICS=as.character(2007:2020),
											SCIENCE=as.character(2007:2020),
											BIOLOGY=as.character(2007:2020),
											PHYSICAL_SCIENCE=as.character(2007:2020),
											MATHEMATICS=as.character(2007:2020),
											COORDINATE_ALGEBRA=as.character(2007:2020),
											ANALYTIC_GEOMETRY=as.character(2007:2020),
											ALGEBRA_I=as.character(2007:2020),
											GEOMETRY=as.character(2007:2020)),
		Vertical_Scale=list(ELA=FALSE, GRADE_9_LIT=FALSE, AMERICAN_LIT=FALSE, SOCIAL_STUDIES=FALSE, US_HISTORY=FALSE,
							ECONOMICS=FALSE, SCIENCE=FALSE, BIOLOGY=FALSE, PHYSICAL_SCIENCE=FALSE, MATHEMATICS=FALSE,
							COORDINATE_ALGEBRA=FALSE, ANALYTIC_GEOMETRY=FALSE, ALGEBRA_I=FALSE, GEOMETRY=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", ELA="ELA", SCIENCE="Science", SOCIAL_STUDIES="Social Studies",
			GRADE_9_LIT = "Grade 9 Lit", AMERICAN_LIT = "Amer Lit", US_HISTORY = "US Hist", ECONOMICS = "Economics",
			BIOLOGY = "Biology", PHYSICAL_SCIENCE = "Phys Sci", ALGEBRA_I ="Algebra I", GEOMETRY = "Geometry", COORDINATE_ALGEBRA = "Coord Alg", ANALYTIC_GEOMETRY= "Analytic Geom"), #MATHEMATICS_I = "Math I", MATHEMATICS_II = "Math II"),
		Content_Areas_Domains=list( ## Each Domain should be in CANONICAL PROGRESSION ORDER
			ELA="ELA", GRADE_9_LIT = "ELA", AMERICAN_LIT = "ELA", # READING="ELA",
			SOCIAL_STUDIES= "SOCIAL_STUDIES", US_HISTORY = "SOCIAL_STUDIES", ECONOMICS = "SOCIAL_STUDIES",
			MATHEMATICS="MATHEMATICS", ALGEBRA_I ="MATHEMATICS", GEOMETRY = "MATHEMATICS", # COORDINATE_ALGEBRA ="MATHEMATICS", ANALYTIC_GEOMETRY = "MATHEMATICS", # MATHEMATICS_II = "MATHEMATICS", # MATHEMATICS_I = "MATHEMATICS",
			SCIENCE="SCIENCE", PHYSICAL_SCIENCE = "SCIENCE", BIOLOGY = "SCIENCE"),
		Grades_Reported=list(
			ELA=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), GRADE_9_LIT = "EOCT", AMERICAN_LIT = "EOCT",
			SOCIAL_STUDIES=c(3,4,5,6,7,8), US_HISTORY = "EOCT", ECONOMICS = "EOCT",
			MATHEMATICS=c(3,4,5,6,7,8), ALGEBRA_I ="EOCT", GEOMETRY = "EOCT", COORDINATE_ALGEBRA ="EOCT", ANALYTIC_GEOMETRY = "EOCT",
			SCIENCE=c(3,4,5,6,7,8), PHYSICAL_SCIENCE = "EOCT", BIOLOGY = "EOCT"),
		Grades_Reported_Domains=list(ELA=c(3:8, "EOCT", "EOCT"), MATHEMATICS=c(3:8, "EOCT", "EOCT"), SCIENCE= c(3:8, "EOCT", "EOCT"), SOCIAL_STUDIES = c(3:8, "EOCT", "EOCT")),
		Achievement_Level_Labels=list(
					"Beginning Learner"="Beginning Learner",
					"Developing Learner"="Developing Learner",
					"Proficient Learner"="Proficient Learner",
					"Distinguished Learner"="Distinguished Learner"))

SGPstateData[["GA"]][["SGP_Configuration"]] <-
	list(
		# use.cohort.for.baseline.when.missing=TRUE,
		# sgp.projections.baseline.max.order=4,
		sgp.loss.hoss.adjustment = "GA",
		return.norm.group.scale.scores=TRUE,
		return.projection.group.scale.scores = TRUE,
		print.other.gp=TRUE,
		print.sgp.order=TRUE,
		sgp.cohort.size=1500, #  Winnow out all course progressions with fewer than 1,500 kids (per discussion on 1/27/16)
		sgp.less.than.sgp.cohort.size.return="<1500",
		# goodness.of.fit.minimum.n = 1, #  No longer needed with 'sgp.cohort.size' set.
		# max.order.for.percentile = 2, # Can't use this until 2017 when CRCT ELA/READING combo is no longer used for EOCT Lits priors
		grade.projection.sequence = list(
			# READING=c("3", "4", "5", "6", "7", "8"),  # Keep as long as READING used as a prior for getKnotsBoundaries function.
			# ELA=c("3", "4", "5", "6", "7", "8"), # Same for ELA.  End up projecting 7th grade ONLY to 8th grade, and then in 8th grade start to use both ELA and READING priors from 7th and 8th grades.
			# ELA=c("3", "3", "4", "4", "5", "5", "6", "6", "7", "7", "8", "8", "EOCT", "EOCT"),
			# GRADE_9_LIT=c("7", "7", "8", "8", "EOCT", "EOCT"),
			# GRADE_9_LIT=c("7", "7", "8", "8", "EOCT", "EOCT"),
			# AMERICAN_LIT=c("8", "8", "EOCT", "EOCT"),
			ELA=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			GRADE_9_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			AMERICAN_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"), # CANONICAL for growthAchievementPlot
			MATH_COORD_ALG=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			MATH_ALG_I = c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"), # Add GEOMETRY in 2017
			COORDINATE_ALGEBRA= c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			ANALYTIC_GEOMETRY = c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),  # Add ALGEBRA_I to GEOMETRY in 2017
			GEOMETRY =c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),  # Add GEOMETRY in 2017 - in 2016 no matrices going from Alg I to Geom to complete progression.
			SCIENCE=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"), # CANONICAL for growthAchievementPlot
			SCIENCE_PHYSCI=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			SCIENCE_BIO=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			BIOLOGY_PHYSCI=c("7", "8", "EOCT", "EOCT"),
			PHYSICAL_SCIENCE_BIO=c("7", "8", "EOCT", "EOCT"),
			SOCIAL_STUDIES=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
			US_HISTORY=c("8", "EOCT", "EOCT"),
			ECONOMICS=c("EOCT", "EOCT")),
		content_area.projection.sequence = list(
			# READING=c("READING", "READING", "READING", "READING", "READING", "READING"), # Keep as long as READING used as a prior for getKnotsBoundaries function.
			# ELA=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA"),
			# ELA=c("ELA", "READING", "ELA", "READING", "ELA", "READING", "ELA", "READING", "ELA", "READING", "ELA", "READING", "ELA", "GRADE_9_LIT", "AMERICAN_LIT"),
			# GRADE_9_LIT=c("ELA", "READING", "ELA", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
			# AMERICAN_LIT=c("ELA", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
			ELA=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "GRADE_9_LIT", "AMERICAN_LIT"),
			GRADE_9_LIT =c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "GRADE_9_LIT", "AMERICAN_LIT"),
			AMERICAN_LIT=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "GRADE_9_LIT", "AMERICAN_LIT"),

			MATHEMATICS=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"), # CANONICAL for growthAchievementPlot
			MATH_COORD_ALG=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "COORDINATE_ALGEBRA", "ANALYTIC_GEOMETRY"),
			MATH_ALG_I =c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"),# Add GEOMETRY in 2017
			COORDINATE_ALGEBRA=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "COORDINATE_ALGEBRA", "ANALYTIC_GEOMETRY"),
			ANALYTIC_GEOMETRY =c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "COORDINATE_ALGEBRA", "ANALYTIC_GEOMETRY"),
			ALGEBRA_I= c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"), # Add GEOMETRY in 2017 - Might need to add in MATHEMATICS priors, but might also duplicate the MATH_ALG_I analyses
			GEOMETRY = c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"), # Add GEOMETRY in 2017

			SCIENCE = c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"), # CANONICAL for growthAchievementPlot
			SCIENCE_PHYSCI=c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"),
			SCIENCE_BIO=c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "PHYSICAL_SCIENCE", "BIOLOGY"),
			BIOLOGY_PHYSCI=c("SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"), # Max 2 Priors
			PHYSICAL_SCIENCE_BIO=c("SCIENCE", "SCIENCE", "PHYSICAL_SCIENCE", "BIOLOGY"), # Max 2 Priors

			SOCIAL_STUDIES=c("SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "US_HISTORY", "ECONOMICS"),
			US_HISTORY=c("SOCIAL_STUDIES", "US_HISTORY", "ECONOMICS"),
			ECONOMICS=c("US_HISTORY", "ECONOMICS")),
		year_lags.projection.sequence = list(
			# READING=rep(1L, 5), # Keep as long as READING used as a prior for getKnotsBoundaries function.
			# ELA = rep(1L, 5), # c(1,1,1,1,1,0,1,2)
			# GRADE_9_LIT= as.integer(c(0, 1, 0, 1, 2)),
			# AMERICAN_LIT=as.integer(c(0, 1, 2)),
			ELA = c(rep(1L, 6), 2),
			GRADE_9_LIT =c(rep(1L, 6), 2),
			AMERICAN_LIT=c(rep(1L, 6), 2),
			MATHEMATICS=rep(1L, 7), # CANONICAL for growthAchievementPlot
			MATH_COORD_ALG=rep(1L, 7),
			MATH_ALG_I = rep(1L, 7),
			COORDINATE_ALGEBRA=rep(1L, 7),
			ANALYTIC_GEOMETRY =rep(1L, 7),
			ALGEBRA_I=rep(1L, 7),
			GEOMETRY =rep(1L, 7),
			SCIENCE=rep(1L, 7),
			SCIENCE_PHYSCI=rep(1L, 7),
			SCIENCE_BIO=rep(1L, 7),
			BIOLOGY_PHYSCI=rep(1L, 3),
			PHYSICAL_SCIENCE_BIO=rep(1L, 3),
			SOCIAL_STUDIES=as.integer(c(1,1,1,1,1,3,1)),
			US_HISTORY=as.integer(c(3,1)),
			ECONOMICS=1L),
		max.forward.projection.sequence = list(
			READING=3, # Keep as long as READING used as a prior for getKnotsBoundaries function.
			ELA=3,
			GRADE_9_LIT=3,
			AMERICAN_LIT=3,
			MATHEMATICS=3, # CANONICAL for growthAchievementPlot
			MATH_COORD_ALG=3,
			MATH_ALG_I=3,
			COORDINATE_ALGEBRA=3,
			ANALYTIC_GEOMETRY=3,
			ALGEBRA_I=3,
			GEOMETRY=3,
			SCIENCE=3,
			SCIENCE_PHYSCI=3,
			SCIENCE_BIO=3,
			BIOLOGY_PHYSCI=3,
			PHYSICAL_SCIENCE_BIO=3,
			SOCIAL_STUDIES=3,
			US_HISTORY=3,
			ECONOMICS=3))

SGPstateData[["GA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/GA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/GA/GA_Baseline_Matrices.Rdata")
#SGPstateData[["GA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- GA_Baseline_Matrices
load("SGP_Norm_Group_Preference/GA_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["GA"]][["SGP_Norm_Group_Preference"]] <- GA_SGP_Norm_Group_Preference

SGPstateData[["GA"]][['SGP_Progression_Preference']] <- data.table(
	SGP_PROJECTION_GROUP = c("SCIENCE_BIO", "SCIENCE_PHYSCI", "BIOLOGY_PHYSCI", "PHYSICAL_SCIENCE_BIO", "MATH_ALG_I", "MATH_COORD_ALG"),
	PREFERENCE = c(1, 2, 1, 2, 1, 2), key = "SGP_PROJECTION_GROUP")


#########################################################
### HAWAII
#########################################################

SGPstateData[["HI"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(251, 300, 324),
			GRADE_4=c(270, 300, 325),
			GRADE_5=c(278, 300, 328),
			GRADE_6=c(277, 300, 323),
			GRADE_7=c(281, 300, 334),
			GRADE_8=c(276, 300, 332),
			GRADE_9=c(275, 300, 331),
			GRADE_10=c(275, 300, 331),
			GRADE_11=c(275, 300, 331)),
		MATHEMATICS.2011=list(
			GRADE_3=c(268, 300, 343),
			GRADE_4=c(268, 300, 342),
			GRADE_5=c(269, 300, 339),
			GRADE_6=c(271, 300, 340),
			GRADE_7=c(271, 300, 339),
			GRADE_8=c(272, 300, 342),
			GRADE_9=c(277, 300, 336),
			GRADE_10=c(277, 300, 336),
			GRADE_11=c(277, 300, 336)),
		MATHEMATICS.2015=list(
			GRADE_3=c(2381, 2436, 2501),
			GRADE_4=c(2411, 2485, 2549),
			GRADE_5=c(2455, 2528, 2579),
			GRADE_6=c(2473, 2552, 2610),
			GRADE_7=c(2484, 2567, 2635),
			GRADE_8=c(2504, 2586, 2653),
			GRADE_9=c(2515, 2599, 2676),
			GRADE_10=c(2529, 2614, 2697),
			GRADE_11=c(2543, 2628, 2718)),
		READING=list(
			GRADE_3=c(271, 300, 352),
			GRADE_4=c(273, 300, 351),
			GRADE_5=c(282, 300, 346),
			GRADE_6=c(278, 300, 342),
			GRADE_7=c(286, 300, 343),
			GRADE_8=c(286, 300, 340),
			GRADE_9=c(289, 300, 336),
			GRADE_10=c(289, 300, 336),
			GRADE_11=c(289, 300, 336)),
		READING.2011=list(
			GRADE_3=c(266, 300, 324),
			GRADE_4=c(271, 300, 325),
			GRADE_5=c(269, 300, 328),
			GRADE_6=c(270, 300, 331),
			GRADE_7=c(270, 300, 336),
			GRADE_8=c(273, 300, 330),
			GRADE_9=c(277, 300, 340),
			GRADE_10=c(277, 300, 340),
			GRADE_11=c(277, 300, 340)),
		READING.2015=list(
			GRADE_3=c(2367, 2432, 2490),
			GRADE_4=c(2416, 2473, 2533),
			GRADE_5=c(2442, 2502, 2582),
			GRADE_6=c(2457, 2531, 2618),
			GRADE_7=c(2479, 2552, 2649),
			GRADE_8=c(2487, 2567, 2668),
			GRADE_9=c(2488, 2571, 2670),
			GRADE_10=c(2491, 2577, 2677),
			GRADE_11=c(2493, 2583, 2682)))

SGPstateData[["HI"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS.2016=list(
			boundaries_3=c(2001.9, 2831.1),
			boundaries_4=c(2015.6, 2908.4),
			boundaries_5=c(2015.4, 2970.6),
			boundaries_6=c(2022.2, 2991.8),
			boundaries_7=c(2022.4, 3049.6),
			boundaries_8=c(2025.0, 3081.0),
			boundaries_9=c(2021.3, 3181.7),
			boundaries_10=c(2021.3, 3181.7),
			boundaries_11=c(2021.3, 3181.7),
			knots_3=c(2369, 2415, 2454, 2498),
			knots_4=c(2407, 2456, 2496, 2541),
			knots_5=c(2429, 2485, 2533, 2582),
			knots_6=c(2435, 2499, 2547, 2602),
			knots_7=c(2437, 2505, 2560, 2618),
			knots_8=c(2446, 2521, 2581, 2645),
			knots_9=c(2446, 2521, 2581, 2645),
			knots_10=c(2446, 2521, 2581, 2645),
			knots_11=c(2459, 2533, 2594, 2662),
			loss.hoss_3=c(2071, 2762),
			loss.hoss_4=c(2090, 2834),
			loss.hoss_5=c(2095, 2891),
			loss.hoss_6=c(2103, 2911),
			loss.hoss_7=c(2108, 2964),
			loss.hoss_8=c(2113, 2993),
			loss.hoss_9=c(2118, 3085),
			loss.hoss_10=c(2118, 3085),
			loss.hoss_11=c(2118, 3085)),
		MATHEMATICS.2015=list(
			boundaries_3=c(2145.8, 2664.2),
			boundaries_4=c(2158.5, 2704.5),
			boundaries_5=c(2170.9, 2748.1),
			boundaries_6=c(2183.7, 2799.3),
			boundaries_7=c(2197.2, 2830.8),
			boundaries_8=c(2211.3, 2855.7),
			boundaries_9=c(2211.3, 2920.2),
			boundaries_10=c(2211.3, 2920.2),
			boundaries_11=c(2221.8, 2920.2),
			knots_3=c(2369, 2415, 2454, 2498),
			knots_4=c(2407, 2456, 2496, 2541),
			knots_5=c(2429, 2485, 2533, 2582),
			knots_6=c(2435, 2499, 2547, 2602),
			knots_7=c(2437, 2505, 2560, 2618),
			knots_8=c(2446, 2521, 2581, 2645),
			knots_9=c(2446, 2521, 2581, 2645),
			knots_10=c(2446, 2521, 2581, 2645),
			knots_11=c(2459, 2533, 2594, 2662),
			loss.hoss_3=c(2189, 2621),
			loss.hoss_4=c(2204, 2659),
			loss.hoss_5=c(2219, 2700),
			loss.hoss_6=c(2235, 2748),
			loss.hoss_7=c(2250, 2778),
			loss.hoss_8=c(2265, 2802),
			loss.hoss_9=c(2265, 2862),
			loss.hoss_10=c(2265, 2862),
			loss.hoss_11=c(2280, 2862)),
		MATHEMATICS.2011=list(
			boundaries_3=c(60, 540),
			boundaries_4=c(60, 540),
			boundaries_5=c(60, 540),
			boundaries_6=c(60, 540),
			boundaries_7=c(60, 540),
			boundaries_8=c(60, 540),
			boundaries_9=c(60, 540),
			boundaries_10=c(60, 540),
			boundaries_11=c(60, 540),
			knots_3=c(267, 290, 308, 330),
			knots_4=c(269, 290, 309, 330),
			knots_5=c(264, 287, 307, 328),
			knots_6=c(266, 288, 304, 325),
			knots_7=c(268, 289, 307, 329),
			knots_8=c(262, 286, 306, 329),
			knots_9=c(267, 282, 298, 314),
			knots_10=c(267, 282, 298, 314),
			knots_11=c(267, 282, 298, 314),
			loss.hoss_3=c(178, 453),
			loss.hoss_4=c(181, 458),
			loss.hoss_5=c(185, 464),
			loss.hoss_6=c(182, 465),
			loss.hoss_7=c(195, 471),
			loss.hoss_8=c(175, 474),
			loss.hoss_9=c(195, 467),
			loss.hoss_10=c(195, 467),
			loss.hoss_11=c(195, 467)),
		MATHEMATICS=list(
			boundaries_3=c(60, 540),
			boundaries_4=c(60, 540),
			boundaries_5=c(60, 540),
			boundaries_6=c(60, 540),
			boundaries_7=c(60, 540),
			boundaries_8=c(60, 540),
			boundaries_9=c(60, 540),
			boundaries_10=c(60, 540),
			boundaries_11=c(60, 540),
			knots_3=c(267, 290, 308, 330),
			knots_4=c(269, 290, 309, 330),
			knots_5=c(264, 287, 307, 328),
			knots_6=c(266, 288, 304, 325),
			knots_7=c(268, 289, 307, 329),
			knots_8=c(262, 286, 306, 329),
			knots_9=c(267, 282, 298, 314),
			knots_10=c(267, 282, 298, 314),
			knots_11=c(267, 282, 298, 314),
			loss.hoss_3=c(100, 500),
			loss.hoss_4=c(100, 500),
			loss.hoss_5=c(100, 500),
			loss.hoss_6=c(100, 500),
			loss.hoss_7=c(100, 500),
			loss.hoss_8=c(100, 500),
			loss.hoss_9=c(100, 500),
			loss.hoss_10=c(100, 500),
			loss.hoss_11=c(100, 500)),
		READING.2016=list(
			boundaries_3=c(1920.0, 2892.0),
			boundaries_4=c(1948.5, 2950.5),
			boundaries_5=c(1970.0, 3002.0),
			boundaries_6=c(1993.2, 3022.8),
			boundaries_7=c(1993.8, 3052.2),
			boundaries_8=c(2007.8, 3078.2),
			boundaries_9=c(2009.0, 3125.0),
			boundaries_10=c(2009.0, 3125.0),
			boundaries_11=c(2009.0, 3125.0),
			knots_3=c(2345, 2399, 2447, 2501),
			knots_4=c(2377, 2440, 2493, 2545),
			knots_5=c(2421, 2484, 2535, 2587),
			knots_6=c(2437, 2497, 2547, 2600),
			knots_7=c(2441, 2506, 2561, 2619),
			knots_8=c(2470, 2531, 2584, 2640),
			knots_9=c(2470, 2531, 2584, 2640),
			knots_10=c(2470, 2531, 2584, 2640),
			knots_11=c(2484, 2559, 2620, 2681),
			loss.hoss_3=c(2001, 2811),
			loss.hoss_4=c(2032, 2867),
			loss.hoss_5=c(2056, 2916),
			loss.hoss_6=c(2079, 2937),
			loss.hoss_7=c(2082, 2964),
			loss.hoss_8=c(2097, 2989),
			loss.hoss_9=c(2102, 3032),
			loss.hoss_10=c(2102, 3032),
			loss.hoss_11=c(2102, 3032)),
		READING.2015=list(
			boundaries_3=c(2063.1, 2673.9),
			boundaries_4=c(2077.8, 2716.2),
			boundaries_5=c(2151.0, 2751.0),
			boundaries_6=c(2158.6, 2775.4),
			boundaries_7=c(2209.3, 2793.7),
			boundaries_8=c(2239.9, 2817.1),
			boundaries_9=c(2249.9, 2844.6),
			boundaries_10=c(2249.4, 2844.6),
			boundaries_11=c(2249.4, 2844.6),
			knots_3=c(2345, 2399, 2447, 2501),
			knots_4=c(2377, 2440, 2493, 2545),
			knots_5=c(2421, 2484, 2535, 2587),
			knots_6=c(2437, 2497, 2547, 2600),
			knots_7=c(2441, 2506, 2561, 2619),
			knots_8=c(2470, 2531, 2584, 2640),
			knots_9=c(2470, 2531, 2584, 2640),
			knots_10=c(2470, 2531, 2584, 2640),
			knots_11=c(2484, 2559, 2620, 2681),
			loss.hoss_3=c(2114, 2623),
			loss.hoss_4=c(2131, 2663),
			loss.hoss_5=c(2201, 2701),
			loss.hoss_6=c(2210, 2724),
			loss.hoss_7=c(2258, 2745),
			loss.hoss_8=c(2288, 2769),
			loss.hoss_9=c(2288, 2795),
			loss.hoss_10=c(2288, 2795),
			loss.hoss_11=c(2299, 2795)),
		READING.2011=list(
			boundaries_3=c(60, 540),
			boundaries_4=c(60, 540),
			boundaries_5=c(60, 540),
			boundaries_6=c(60, 540),
			boundaries_7=c(60, 540),
			boundaries_8=c(60, 540),
			boundaries_9=c(60, 540),
			boundaries_10=c(60, 540),
			boundaries_11=c(60, 540),
			knots_3=c(274, 300, 319, 339),
			knots_4=c(274, 300, 319, 338),
			knots_5=c(278, 301, 317, 337),
			knots_6=c(278, 301, 319, 338),
			knots_7=c(286, 306, 324, 344),
			knots_8=c(287, 306, 320, 340),
			knots_9=c(285, 303, 315, 331),
			knots_10=c(285, 303, 315, 331),
			knots_11=c(285, 303, 315, 331),
			loss.hoss_3=c(200, 442),
			loss.hoss_4=c(210, 438),
			loss.hoss_5=c(206, 451),
			loss.hoss_6=c(204, 444),
			loss.hoss_7=c(187, 448),
			loss.hoss_8=c(210, 460),
			loss.hoss_9=c(200, 433),
			loss.hoss_10=c(200, 433),
			loss.hoss_11=c(200, 433)),
		READING=list(
			boundaries_3=c(60, 540),
			boundaries_4=c(60, 540),
			boundaries_5=c(60, 540),
			boundaries_6=c(60, 540),
			boundaries_7=c(60, 540),
			boundaries_8=c(60, 540),
			boundaries_9=c(60, 540),
			boundaries_10=c(60, 540),
			boundaries_11=c(60, 540),
			knots_3=c(274, 300, 319, 339),
			knots_4=c(274, 300, 319, 338),
			knots_5=c(278, 301, 317, 337),
			knots_6=c(278, 301, 319, 338),
			knots_7=c(286, 306, 324, 344),
			knots_8=c(287, 306, 320, 340),
			knots_9=c(285, 303, 315, 331),
			knots_10=c(285, 303, 315, 331),
			knots_11=c(285, 303, 315, 331),
			loss.hoss_3=c(100, 500),
			loss.hoss_4=c(100, 500),
			loss.hoss_5=c(100, 500),
			loss.hoss_6=c(100, 500),
			loss.hoss_7=c(100, 500),
			loss.hoss_8=c(100, 500),
			loss.hoss_9=c(100, 500),
			loss.hoss_10=c(100, 500),
			loss.hoss_11=c(100, 500)))

SGPstateData[["HI"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Not Met Standard", "Nearly Met Standard", "Met Standard", "Exceeded Standard"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["HI"]][["Achievement"]][["Levels"]] <-
#		list(
#			Labels=c("Well Below Proficiency", "Approaches Proficiency", "Meets Proficiency", "Exceeds Proficiency"),
#			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["HI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["HI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["HI"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["HI"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Smarter Balanced Assessment",
		Assessment_Abbreviation="SBA",
		Organization=list(
			Name="Hawaii State Department of Education",
			Abbreviation="HIDOE",
			URL="www.doe.k12.hi.us",
			Contact="808-586-3230"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8,11),
		Assessment_Years=c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"),
		Scale_Change=list(MATHEMATICS="2015", READING="2015"),
		Test_Season="Spring")

SGPstateData[["HI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="HSA",
		Assessment_Abbreviation.2015="SBA",
		Assessment_Name="Hawaii State Assesment",
		Assessment_Name.2015="Smarter Balanced Assessment",
		Achievement_Levels=list(
			Labels=c("Well Below Proficiency", "Approaches Proficiency", "Meets Proficiency", "Exceeds Proficiency"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2015=list(
			Labels=c("Not Met Standard", "Nearly Met Standard", "Met Standard", "Exceeded Standard"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Well Below"="Well Below Proficiency",
			"Approaches"="Approaches Proficiency",
			"Meets"="Meets Proficiency",
			"Exceeds"="Exceeds Proficiency"),
		Achievement_Level_Labels.2015=list(
			"Not Met"="Not Met Standard",
			"Nearly Met"="Nearly Met Standard",
			"Met"="Met Standard",
			"Exceeded"="Exceeded Standard"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Content_Areas_Labels.2015=list(MATHEMATICS="Math", READING="ELA"),
		Vertical_Scale="No",
		Vertical_Scale.2015="Yes",
		Grades_Tested=c(3,4,5,6,7,8,10),
		Grades_Tested.2015=c(3,4,5,6,7,8,11),
		Year="2015"
	)

SGPstateData[["HI"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
										MATHEMATICS=as.character(2008:2014),
										READING=as.character(2008:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
										MATHEMATICS=as.character(2008:2014),
										READING=as.character(2008:2014)),
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
#		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), READING=c(3,4,5,6,7,8,10)), ### 2014 and prior
#		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10,11), READING=c(3,4,5,6,7,8,10,11)), ### 2015
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)), ### 2016 and later
		Achievement_Level_Labels=list(
			"Not Met"="Not Met Standard",
			"Nearly Met"="Nearly Met Standard",
			"Met"="Met Standard",
			"Exceeded"="Exceeded Standard"))

SGPstateData[["HI"]][["SGP_Configuration"]] <- list(
	sgPlot.fan=TRUE,
	output.groups=c("COMPLEX", "SCHOOL"),
	outputSGP.translate.names=FALSE,
	state.multiple.year.summary=3,
	output.column.order=list(SGP_Data_LONG=
		c("VALID_CASE", "YEAR", "CONTENT_AREA", "GRADE", "ID", "LAST_NAME", "FIRST_NAME", "SCALE_SCORE", "ACHIEVEMENT_LEVEL",
		  "SCHOOL_NUMBER", "SCHOOL_NAME", "EMH_LEVEL", "GRADE_RANGE", "SCHOOL_TYPE", "SCHOOL_LEVEL", "DISTRICT_NUMBER",
		  "DISTRICT_NAME", "COMPLEX_NUMBER", "COMPLEX_NAME", "COMPLEX_AREA_NUMBER", "COMPLEX_AREA_NAME", "ETHNICITY_DOE",
		  "ETHNICITY_FED5", "ETHNICITY_FED7", "DISADVANTAGED_STATUS", "ELL_STATUS", "SPECIAL_EDUCATION_STATUS",
		  "GENDER", "TEST_ADMINISTRATION", "MIGRANT_STATUS", "HIGH_NEED_STATUS", "FULL_SCHOOL_YEAR_STATUS", "SCHOOL_ENROLLMENT_STATUS",
		  "DISTRICT_ENROLLMENT_STATUS", "COMPLEX_ENROLLMENT_STATUS", "COMPLEX_AREA_ENROLLMENT_STATUS", "STATE_ENROLLMENT_STATUS",
		  "SGP", "SGP_LEVEL", "SCALE_SCORE_PRIOR", "SGP_BASELINE", "SGP_LEVEL_BASELINE", "ACHIEVEMENT_LEVEL_PRIOR",
		  "CATCH_UP_KEEP_UP_STATUS", "MOVE_UP_STAY_UP_STATUS", "ETHNICITY", "HIGH_NEEDS_STATUS_DEMOGRAPHIC",
		  "SCALE_SCORE_PRIOR_STANDARDIZED", "SGP_NORM_GROUP", "SGP_NORM_GROUP_BASELINE", "SGP_TARGET_3_YEAR",
		  "SGP_TARGET_MOVE_UP_STAY_UP_3_YEAR", "ELL_STATUS_MULTILEVEL")))

#load("Baseline_Coefficient_Matrices/HI/HI_Baseline_Matrices.Rdata")
#SGPstateData[["HI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- HI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["HI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- HI_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["HI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/HI_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### IDAHO
#########################################################

SGPstateData[["ID"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(151.3, 261.1),
			boundaries_4=c(161.4, 264.6),
			boundaries_5=c(163.8, 286.2),
			boundaries_6=c(169, 301),
			boundaries_7=c(176.7, 300.3),
			boundaries_8=c(184.2, 301.8),
			boundaries_9=c(196.7, 296.3),
			boundaries_10=c(191.6, 304.4),
			knots_3=c(193, 201, 207, 214),
			knots_4=c(203, 210, 216, 223),
			knots_5=c(210, 217, 223, 230),
			knots_6=c(217, 224, 231, 239),
			knots_7=c(221, 228, 234, 243),
			knots_8=c(228, 235, 242, 249),
			knots_9=c(234, 240, 246, 254),
			knots_10=c(235, 243, 249, 257),
			loss.hoss_3=c(161, 252),
			loss.hoss_4=c(170, 256),
			loss.hoss_5=c(174, 276),
			loss.hoss_6=c(180, 290),
			loss.hoss_7=c(187, 290),
			loss.hoss_8=c(194, 292),
			loss.hoss_9=c(205, 288),
			loss.hoss_10=c(201, 295)),
		MATHEMATICS.2011=list(
			boundaries_3=c(138.2, 279.8),
			boundaries_4=c(160.1, 278.9),
			boundaries_5=c(162.4, 301.6),
			boundaries_6=c(160.1, 302.9),
			boundaries_7=c(165.6, 302.4),
			boundaries_8=c(170.9, 304.1),
			boundaries_9=c(153.8, 300.2),
			boundaries_10=c(170.7, 306.3),
			knots_3=c(194, 202, 208, 214),
			knots_4=c(202, 210, 216, 222),
			knots_5=c(209, 215, 221, 227),
			knots_6=c(213, 220, 225, 233),
			knots_7=c(216, 223, 229, 237),
			knots_8=c(221, 228, 234, 242),
			knots_9=c(223, 230, 236, 245),
			knots_10=c(225, 232, 239, 248),
			loss.hoss_3=c(150, 268),
			loss.hoss_4=c(170, 269),
			loss.hoss_5=c(174, 290),
			loss.hoss_6=c(172, 291),
			loss.hoss_7=c(177, 291),
			loss.hoss_8=c(182, 293),
			loss.hoss_9=c(166, 288),
			loss.hoss_10=c(182, 295)),
#		MATHEMATICS.2015=list(
#			boundaries_3=c(2145.8, 2664.2),
#			boundaries_4=c(2158.5, 2704.5),
#			boundaries_5=c(2170.9, 2748.1),
#			boundaries_6=c(2183.7, 2799.3),
#			boundaries_7=c(2197.2, 2830.8),
#			boundaries_8=c(2205.3, 2855.7),
#			boundaries_9=c(2211.3, 2920.2),
#			boundaries_10=c(2211.3, 2920.2),
#			boundaries_11=c(2221.8, 2920.2),
#			knots_3=c(2369, 2415, 2454, 2498),
#			knots_4=c(2407, 2456, 2496, 2541),
#			knots_5=c(2429, 2485, 2533, 2582),
#			knots_6=c(2435, 2499, 2547, 2602),
#			knots_7=c(2437, 2505, 2560, 2618),
#			knots_8=c(2446, 2521, 2581, 2645),
#			knots_9=c(2446, 2521, 2581, 2645),
#			knots_10=c(2446, 2521, 2581, 2645),
#			knots_11=c(2459, 2533, 2594, 2662),
#			loss.hoss_3=c(2189, 2621),
#			loss.hoss_4=c(2204, 2659),
#			loss.hoss_5=c(2219, 2700),
#			loss.hoss_6=c(2235, 2748),
#			loss.hoss_7=c(2250, 2778),
#			loss.hoss_8=c(2265, 2802),
#			loss.hoss_9=c(2265, 2862),
#			loss.hoss_10=c(2265, 2862),
#			loss.hoss_11=c(2280, 2862)),
		MATHEMATICS.2015=list(
			boundaries_3=c(2001.9, 2831.1),
			boundaries_4=c(2015.6, 2908.4),
			boundaries_5=c(2015.4, 2970.6),
			boundaries_6=c(2022.2, 2991.8),
			boundaries_7=c(2022.4, 3049.6),
			boundaries_8=c(2025.0, 3081.0),
			boundaries_9=c(2021.3, 3181.7),
			boundaries_10=c(2021.3, 3181.7),
			boundaries_11=c(2021.3, 3181.7),
			knots_3=c(2369, 2415, 2454, 2498),
			knots_4=c(2407, 2456, 2496, 2541),
			knots_5=c(2429, 2485, 2533, 2582),
			knots_6=c(2435, 2499, 2547, 2602),
			knots_7=c(2437, 2505, 2560, 2618),
			knots_8=c(2446, 2521, 2581, 2645),
			knots_9=c(2446, 2521, 2581, 2645),
			knots_10=c(2446, 2521, 2581, 2645),
			knots_11=c(2459, 2533, 2594, 2662),
			loss.hoss_3=c(2071, 2762),
			loss.hoss_4=c(2090, 2834),
			loss.hoss_5=c(2095, 2891),
			loss.hoss_6=c(2103, 2911),
			loss.hoss_7=c(2108, 2964),
			loss.hoss_8=c(2113, 2993),
			loss.hoss_9=c(2118, 3085),
			loss.hoss_10=c(2118, 3085),
			loss.hoss_11=c(2118, 3085)),
		LANGUAGE_USAGE=list(
			boundaries_3=c(159.1, 277.9),
			boundaries_4=c(167.9, 277.1),
			boundaries_5=c(168.6, 281.4),
			boundaries_6=c(168.5, 282.5),
			boundaries_7=c(167.2, 284.8),
			boundaries_8=c(175.9, 285.1),
			boundaries_9=c(178.1, 284.9),
			boundaries_10=c(175.6, 288.4),
			knots_3=c(192, 199, 206, 212),
			knots_4=c(203, 210, 216, 222),
			knots_5=c(207, 214, 219, 226),
			knots_6=c(212, 218, 223, 229),
			knots_7=c(214, 221, 226, 232),
			knots_8=c(218, 224, 229, 237),
			knots_9=c(221, 226, 232, 238),
			knots_10=c(223, 228, 234, 239),
			loss.hoss_3=c(169, 268),
			loss.hoss_4=c(177, 268),
			loss.hoss_5=c(178, 272),
			loss.hoss_6=c(178, 273),
			loss.hoss_7=c(177, 275),
			loss.hoss_8=c(185, 276),
			loss.hoss_9=c(187, 276),
			loss.hoss_10=c(185, 279)),
		LANGUAGE_USAGE.2011=list(
			boundaries_3=c(138.2, 279.8),
			boundaries_4=c(160.1, 278.9),
			boundaries_5=c(162.4, 301.6),
			boundaries_6=c(160.1, 302.9),
			boundaries_7=c(165.6, 302.4),
			boundaries_8=c(170.9, 304.1),
			boundaries_9=c(153.8, 300.2),
			boundaries_10=c(170.7, 306.3),
			knots_3=c(194, 202, 208, 214),
			knots_4=c(202, 210, 216, 222),
			knots_5=c(209, 215, 221, 227),
			knots_6=c(213, 220, 225, 233),
			knots_7=c(216, 223, 229, 237),
			knots_8=c(221, 228, 234, 242),
			knots_9=c(223, 230, 236, 245),
			knots_10=c(225, 232, 239, 248),
			loss.hoss_3=c(150, 268),
			loss.hoss_4=c(170, 269),
			loss.hoss_5=c(174, 290),
			loss.hoss_6=c(172, 291),
			loss.hoss_7=c(177, 291),
			loss.hoss_8=c(182, 293),
			loss.hoss_9=c(166, 288),
			loss.hoss_10=c(182, 295)),
		READING=list(
			boundaries_3=c(163.2, 256.8),
			boundaries_4=c(167.4, 270.6),
			boundaries_5=c(167.2, 272.8),
			boundaries_6=c(162.6, 275.4),
			boundaries_7=c(174.5, 276.5),
			boundaries_8=c(178.5, 280.5),
			boundaries_9=c(155.5, 281.5),
			boundaries_10=c(175, 283),
			knots_3=c(196, 203, 209, 214),
			knots_4=c(201, 208, 214, 220),
			knots_5=c(207, 214, 219, 225),
			knots_6=c(210, 218, 223, 229),
			knots_7=c(215, 222, 227, 233),
			knots_8=c(220, 226, 232, 238),
			knots_9=c(220, 226, 231, 237),
			knots_10=c(223, 229, 234, 241),
			loss.hoss_3=c(171, 249),
			loss.hoss_4=c(176, 262),
			loss.hoss_5=c(176, 264),
			loss.hoss_6=c(172, 266),
			loss.hoss_7=c(183, 268),
			loss.hoss_8=c(187, 272),
			loss.hoss_9=c(166, 271),
			loss.hoss_10=c(184, 274)),
		READING.2011=list(
			boundaries_3=c(138.2, 279.8),
			boundaries_4=c(160.1, 278.9),
			boundaries_5=c(162.4, 301.6),
			boundaries_6=c(160.1, 302.9),
			boundaries_7=c(165.6, 302.4),
			boundaries_8=c(170.9, 304.1),
			boundaries_9=c(153.8, 300.2),
			boundaries_10=c(170.7, 306.3),
			knots_3=c(194, 202, 208, 214),
			knots_4=c(202, 210, 216, 222),
			knots_5=c(209, 215, 221, 227),
			knots_6=c(213, 220, 225, 233),
			knots_7=c(216, 223, 229, 237),
			knots_8=c(221, 228, 234, 242),
			knots_9=c(223, 230, 236, 245),
			knots_10=c(225, 232, 239, 248),
			loss.hoss_3=c(150, 268),
			loss.hoss_4=c(170, 269),
			loss.hoss_5=c(174, 290),
			loss.hoss_6=c(172, 291),
			loss.hoss_7=c(177, 291),
			loss.hoss_8=c(182, 293),
			loss.hoss_9=c(166, 288),
			loss.hoss_10=c(182, 295)),
#		READING.2015=list(
#			boundaries_3=c(2063.1, 2673.9),
#			boundaries_4=c(2077.8, 2716.2),
#			boundaries_5=c(2151.0, 2751.0),
#			boundaries_6=c(2158.6, 2775.4),
#			boundaries_7=c(2209.3, 2793.7),
#			boundaries_8=c(2239.9, 2817.1),
#			boundaries_9=c(2249.9, 2844.6),
#			boundaries_10=c(2249.4, 2844.6),
#			boundaries_11=c(2249.4, 2844.6),
#			knots_3=c(2345, 2399, 2447, 2501),
#			knots_4=c(2377, 2440, 2493, 2545),
#			knots_5=c(2421, 2484, 2535, 2587),
#			knots_6=c(2437, 2497, 2547, 2600),
#			knots_7=c(2441, 2506, 2561, 2619),
#			knots_8=c(2470, 2531, 2584, 2640),
#			knots_9=c(2470, 2531, 2584, 2640),
#			knots_10=c(2470, 2531, 2584, 2640),
#			knots_11=c(2484, 2559, 2620, 2681),
#			loss.hoss_3=c(2114, 2623),
#			loss.hoss_4=c(2131, 2663),
#			loss.hoss_5=c(2201, 2701),
#			loss.hoss_6=c(2210, 2724),
#			loss.hoss_7=c(2258, 2745),
#			loss.hoss_8=c(2288, 2769),
#			loss.hoss_9=c(2288, 2795),
#			loss.hoss_10=c(2288, 2795),
#			loss.hoss_11=c(2299, 2795)),
		READING.2015=list(
			boundaries_3=c(1920.0, 2892.0),
			boundaries_4=c(1948.5, 2950.5),
			boundaries_5=c(1970.0, 3002.0),
			boundaries_6=c(1993.2, 3022.8),
			boundaries_7=c(1993.8, 3052.2),
			boundaries_8=c(2007.8, 3078.2),
			boundaries_9=c(2009.0, 3125.0),
			boundaries_10=c(2009.0, 3125.0),
			boundaries_11=c(2009.0, 3125.0),
			knots_3=c(2345, 2399, 2447, 2501),
			knots_4=c(2377, 2440, 2493, 2545),
			knots_5=c(2421, 2484, 2535, 2587),
			knots_6=c(2437, 2497, 2547, 2600),
			knots_7=c(2441, 2506, 2561, 2619),
			knots_8=c(2470, 2531, 2584, 2640),
			knots_9=c(2470, 2531, 2584, 2640),
			knots_10=c(2470, 2531, 2584, 2640),
			knots_11=c(2484, 2559, 2620, 2681),
			loss.hoss_3=c(2001, 2811),
			loss.hoss_4=c(2032, 2867),
			loss.hoss_5=c(2056, 2916),
			loss.hoss_6=c(2079, 2937),
			loss.hoss_7=c(2082, 2964),
			loss.hoss_8=c(2097, 2989),
			loss.hoss_9=c(2102, 3032),
			loss.hoss_10=c(2102, 3032),
			loss.hoss_11=c(2102, 3032)))

SGPstateData[["ID"]][["Achievement"]][["Cutscores"]] <-
	list(
		LANGUAGE_USAGE=list(
			GRADE_3=c(188, 196, 207),
			GRADE_4=c(195, 203, 216),
			GRADE_5=c(201, 209, 222),
			GRADE_6=c(206, 214, 227),
			GRADE_7=c(209, 218, 232),
			GRADE_8=c(213, 221, 236),
			GRADE_9=c(218, 226, 242),
			GRADE_10=c(218, 226, 242)),
		MATHEMATICS=list(
			GRADE_3=c(181, 190, 204),
			GRADE_4=c(193, 201, 216),
			GRADE_5=c(202, 211, 224),
			GRADE_6=c(209, 218, 231),
			GRADE_7=c(215, 223, 237),
			GRADE_8=c(220, 229, 243),
			GRADE_9=c(230, 238, 251),
			GRADE_10=c(230, 238, 251)),
		MATHEMATICS.2015=list(
			GRADE_3=c(2381, 2436, 2501),
			GRADE_4=c(2411, 2485, 2549),
			GRADE_5=c(2455, 2528, 2579),
			GRADE_6=c(2473, 2552, 2610),
			GRADE_7=c(2484, 2567, 2635),
			GRADE_8=c(2504, 2586, 2653),
			GRADE_9=c(2515, 2599, 2676),
			GRADE_10=c(2529, 2614, 2697),
			GRADE_11=c(2543, 2628, 2718)),
		READING=list(
			GRADE_3=c(187, 192, 208),
			GRADE_4=c(193, 198, 214),
			GRADE_5=c(197, 204, 219),
			GRADE_6=c(201, 208, 223),
			GRADE_7=c(204, 212, 227),
			GRADE_8=c(207, 214, 229),
			GRADE_9=c(211, 220, 235),
			GRADE_10=c(211, 220, 235)),
		READING.2015=list(
			GRADE_3=c(2367, 2432, 2490),
			GRADE_4=c(2416, 2473, 2533),
			GRADE_5=c(2442, 2502, 2582),
			GRADE_6=c(2457, 2531, 2618),
			GRADE_7=c(2479, 2552, 2649),
			GRADE_8=c(2487, 2567, 2668),
			GRADE_9=c(2488, 2571, 2670),
			GRADE_10=c(2491, 2577, 2677),
			GRADE_11=c(2493, 2583, 2682)))

SGPstateData[["ID"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("1", "2", "3", "4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["ID"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ID"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["ID"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["ID"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Idaho Standards Achievement Tests by Smarter Balanced",
		Assessment_Abbreviation="ISAT by SB",
			Organization=list(
			Name="Idaho Department of Education",
			Abbreviation="IDOE",
			URL="www.sde.idaho.gov/",
			Contact="support@sde.idaho.gov"),
		Scale_Change=list(MATHEMATICS="2015", READING="2015"),
	#	Content_Areas=c("Language Usage", "Mathematics", "Reading"), ## Changed to SBAC in 2015
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8,9,10),
		Test_Season="Spring",
		Test_Vendor="SBAC/AIR",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["ID"]][["Student_Report_Information"]] <-
	list(
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
#		Content_Areas_Labels=list(LANGUAGE_USAGE="Language", MATHEMATICS="Math", READING="Read"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
#		Grades_Reported=list(LANGUAGE_USAGE=c(3,4,5,6,7,8,9,10), MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10)),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10)),
		Achievement_Level_Labels=list(
			"1"="Level 1",
			"2"="Level 2",
			"3"="Level 3",
			"4"="Level 4"))

SGPstateData[["ID"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="ISAT",
		Assessment_Abbreviation.2015="ISAT by SB",
		Assessment_Name="Idaho Standards Achievement Test",
		Assessment_Name.2015="Idaho Standards Achievement Test by Smarter Balanced",
		Achievement_Levels=list(
			Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2015=list(
			Labels=c("1", "2", "3", "4"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"),
		Achievement_Level_Labels.2015=list(
			"1"="Level 1",
			"2"="Level 2",
			"3"="Level 3",
			"4"="Level 4"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Content_Areas_Labels.2015=list(MATHEMATICS="Math", READING="ELA"),
		Vertical_Scale="No",
		Vertical_Scale.2015="Yes",
		Grades_Tested=c(3,4,5,6,7,8,9,10),
		Grades_Tested.2015=c(3,4,5,6,7,8,9,10),
		Year="2015")

SGPstateData[["ID"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/ID_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

SGPstateData[["ID"]][["SGP_Configuration"]] <- list(
	gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, READING=TRUE),
	sgp.projections.max.forward.progression.years=FALSE
)


#########################################################
### ILLINOIS
#########################################################

### ILLINOIS (Original meta-data prior to PARCC transition)

load("CSEM/Illinois/ILLINOIS_CSEM.Rdata")

SGPstateData[["IL_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(108.95, 352.05),
			boundaries_4=c(108.25, 366.75),
			boundaries_5=c(107.55, 381.45),
			boundaries_6=c(107.05, 391.95),
			boundaries_7=c(106.4, 405.6),
			boundaries_8=c(105.5, 424.5),

			knots_3=c(191, 210, 224, 243),
			knots_4=c(206, 223, 238, 255),
			knots_5=c(217, 235, 250, 270),
			knots_6=c(231, 248, 264, 281),
			knots_7=c(239, 258, 274, 292),
			knots_8=c(250, 266, 281, 298),

			loss.hoss_3=c(120, 341),
			loss.hoss_4=c(120, 355),
			loss.hoss_5=c(120, 369),
			loss.hoss_6=c(120, 379),
			loss.hoss_7=c(120, 392),
			loss.hoss_8=c(120, 410)
			),
		READING=list(
			boundaries_3=c(120, 329),
			boundaries_4=c(120, 341),
			boundaries_5=c(120, 351),
			boundaries_6=c(120, 360),
			boundaries_7=c(120, 369),
			boundaries_8=c(120, 367),

			knots_3=c(176, 197, 212, 227),
			knots_4=c(192, 209, 220, 237),
			knots_5=c(206, 222, 235, 247),
			knots_6=c(220, 233, 244, 257),
			knots_7=c(220, 235, 247, 263),
			knots_8=c(232, 244, 254, 266),

			loss.hoss_3=c(109.55, 339.45),
			loss.hoss_4=c(108.95, 352.05),
			loss.hoss_5=c(108.45, 362.55),
			loss.hoss_6=c(108.00, 372.00),
			loss.hoss_7=c(107.55, 381.45),
			loss.hoss_8=c(107.65, 379.35)
			),
		SCIENCE=list(
			boundaries_4=c(107.95, 373.05),
			boundaries_7=c(106.50, 403.50),

			knots_4=c(181, 197, 211, 227),
			knots_7=c(210, 226, 240, 256),

			loss.hoss_4=c(120, 361),
			loss.hoss_7=c(120, 390)
			))

SGPstateData[["IL_ORIGINAL"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(163, 184, 224),
			GRADE_4=c(172, 200, 247),
			GRADE_5=c(180, 214, 271),
			GRADE_6=c(194, 225, 276),
			GRADE_7=c(207, 235, 281),
			GRADE_8=c(221, 246, 288)
			),
		MATHEMATICS.2013=list(
			GRADE_3=c(173, 214, 255),
			GRADE_4=c(191, 224, 267),
			GRADE_5=c(201, 235, 280),
			GRADE_6=c(214, 247, 292),
			GRADE_7=c(221, 257, 302),
			GRADE_8=c(234, 267, 310)
			),
		READING=list(
			GRADE_3=c(156, 191, 227),
			GRADE_4=c(158, 203, 237),
			GRADE_5=c(161, 215, 247),
			GRADE_6=c(167, 220, 257),
			GRADE_7=c(174, 226, 267),
			GRADE_8=c(180, 261, 278)
			),
		READING.2013=list(
			GRADE_3=c(160, 207, 236),
			GRADE_4=c(175, 217, 249),
			GRADE_5=c(193, 228, 261),
			GRADE_6=c(202, 237, 267),
			GRADE_7=c(203, 239, 271),
			GRADE_8=c(218, 248, 271)
			),
		SCIENCE=list(
			GRADE_4=c(158, 187, 237),
			GRADE_7=c(197, 214, 260)
			),
		SCIENCE.2013=list(
			GRADE_4=c(158, 187, 237),
			GRADE_7=c(197, 214, 260)
			))

SGPstateData[["IL_ORIGINAL"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Warning", "Below", "Meets", "Exceeds"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["IL_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["IL_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["IL_ORIGINAL"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["IL_ORIGINAL"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Illinois Standards Achievement Test",
		Assessment_Abbreviation="ISAT",
		Organization=list(
			Name="Illinois State Board of Education",
			Abbreviation="ISBE",
			URL="www.isbe.state.il.us",
			Contact="866-262-6663"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016"),
		Test_Season="Spring",
		Scale_Change=list(MATHEMATICS="2015", READING="2015"),
		Test_Vendor="ISBE Division of Assessment",
		CSEM=Illinois_CSEM)

SGPstateData[["IL_ORIGINAL"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
												MATHEMATICS=as.character(2015:2018),
												ELA=as.character(2015:2018),
												ALGEBRA_I=as.character(2015:2018),
												GEOMETRY=as.character(2015:2018),
												ALGEBRA_II=as.character(2015:2018)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
												MATHEMATICS=as.character(2015:2018),
												ELA=as.character(2015:2018),
												ALGEBRA_I=as.character(2015:2018),
												GEOMETRY=as.character(2015:2018),
												ALGEBRA_II=as.character(2015:2018)),
		Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Warning"="Warning",
			"Below"="Below",
			"Meets"="Meets",
			"Exceeds"="Exceeds"))


### ILLINOIS

load("Knots_Boundaries/PARCC_IL_Knots_Boundaries.Rdata")
SGPstateData[["IL"]] <- SGPstateData[['PARCC']]
SGPstateData[["IL"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_IL_Knots_Boundaries

SGPstateData[["IL"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="Illinois State Board of Education",
			Abbreviation="ISBE",
			URL="www.isbe.net",
			Contact="866-262-6663"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["IL"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
		ELA=c("3", "4", "5", "6", "7", "8", "9"),
		ELA_SS=c("3", "4", "5", "6", "7", "8", "9"),
		MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
		MATHEMATICS_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"))
SGPstateData[["IL"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
		ELA=rep("ELA", 7), ELA_SS=rep("ELA_SS", 7),
		MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
		MATHEMATICS_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"))
SGPstateData[["IL"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
		ELA=rep(1L, 6), ELA_SS=rep(1L, 6),
		MATHEMATICS=rep(1L, 7), MATHEMATICS_SS=rep(1L, 7))


#########################################################
### INDIANA
#########################################################

SGPstateData[["IN"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		ELA=list(
			boundaries_2=c(94.1, 695.9),
			boundaries_3=c(103.3, 786.7),
			boundaries_4=c(113.2, 806.8),
			boundaries_5=c(128.15, 826.85),
			boundaries_6=c(173.3, 856.7),
			boundaries_7=c(203.4, 876.6),
			boundaries_8=c(223.4, 896.6),
			boundaries_10=c(85, 415),
			knots_2=c(402, 432, 458, 490),
			knots_3=c(422, 452, 478, 507),
			knots_4=c(440, 473, 498, 528),
			knots_5=c(461, 490, 514, 541),
			knots_6=c(468, 509, 543, 582),
			knots_7=c(496, 526, 551, 580),
			knots_8=c(494, 530, 561, 598),
			knots_10=c(213, 244, 269, 295),
			loss.hoss_2=c(100, 690),
			loss.hoss_3=c(110, 780),
			loss.hoss_4=c(115, 800),
			loss.hoss_5=c(130, 820),
			loss.hoss_6=c(175, 850),
			loss.hoss_7=c(210, 870),
			loss.hoss_8=c(230, 890),
			loss.hoss_10=c(100, 400)),
		MATHEMATICS=list(
			boundaries_2=c(94.8, 625.2),
			boundaries_3=c(134.05, 740.95),
			boundaries_4=c(174.3, 755.7),
			boundaries_5=c(214.45, 780.55),
			boundaries_6=c(234.5, 795.5),
			boundaries_7=c(254.5, 815.5),
			boundaries_8=c(335.1, 834.9),
			boundaries_10=c(85, 415),
			knots_2=c(379, 414, 441, 472),
			knots_3=c(409, 447, 478, 515),
			knots_4=c(434, 471, 501, 536),
			knots_5=c(471, 507, 536, 568),
			knots_6=c(486, 521, 551, 585),
			knots_7=c(503, 541, 575, 614),
			knots_8=c(530, 571, 604, 641),
			knots_10=c(210, 240, 266, 297),
			loss.hoss_2=c(100, 620),
			loss.hoss_3=c(140, 735),
			loss.hoss_4=c(180, 750),
			loss.hoss_5=c(220, 775),
			loss.hoss_6=c(240, 790),
			loss.hoss_7=c(260, 810),
			loss.hoss_8=c(340, 830),
			loss.hoss_10=c(100, 400)))

SGPstateData[["IN"]][["Achievement"]][["Cutscores"]] <-
	list(
		ELA=list(
			GRADE_3=c(417, 521),
			GRADE_4=c(437, 535),
			GRADE_5=c(468, 548),
			GRADE_6=c(478, 579),
			GRADE_7=c(501, 584),
			GRADE_8=c(508, 627)),
		ELA.2015=list(
			GRADE_3=c(428, 500),
			GRADE_4=c(456, 529),
			GRADE_5=c(486, 546),
			GRADE_6=c(502, 572),
			GRADE_7=c(516, 592),
			GRADE_8=c(537, 617),
			GRADE_10=c(244, 292)),
		MATHEMATICS=list(
			GRADE_3=c(413, 513),
			GRADE_4=c(445, 541),
			GRADE_5=c(463, 556),
			GRADE_6=c(487, 590),
			GRADE_7=c(511, 603),
			GRADE_8=c(537, 641)),
		MATHEMATICS.2015=list(
			GRADE_3=c(425, 480),
			GRADE_4=c(458, 508),
			GRADE_5=c(480, 536),
			GRADE_6=c(510, 560),
			GRADE_7=c(533, 578),
			GRADE_8=c(554, 595),
			GRADE_10=c(271, 339)))

SGPstateData[["IN"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Did Not Pass", "Pass", "Pass +"),
		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["IN"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["IN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["IN"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 65),
		Labels=c("1st - 34th", "35th - 64th", "65th - 99th"))

SGPstateData[["IN"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Indiana Statewide Testing for Educational Progress-Plus",
		Assessment_Abbreviation="ISTEP+",
			Organization=list(
			Name="Indiana Department of Education",
			Abbreviation="IDOE",
			URL="www.doe.in.gov",
			Contact="webmaster@doe.in.gov"),
		Content_Areas=c("English/Language Arts", "Mathematics"),
		Scale_Change=list(MATHEMATICS="2015", ELA="2015"),
		Grades_Tested=c(3,4,5,6,7,8,10),
		Test_Season="Spring",
		Test_Vendor="Pearson")

SGPstateData[["IN"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="ISTEP+",
		Assessment_Abbreviation.2015="ISTEP+",
		Assessment_Name="Indiana Statewide Testing for Educational Progress-Plus",
		Assessment_Name.2015="Indiana Statewide Testing for Educational Progress-Plus",
		Achievement_Levels=list(
			Labels=c("Did Not Pass", "Pass", "Pass +"),
			Proficient=c("Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2015=list(
			Labels=c("Did Not Pass", "Pass", "Pass +"),
			Proficient=c("Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Did Not Pass"="Did Not Pass",
			"Pass"="Pass",
			"Pass +"="Pass +"),
		Achievement_Level_Labels.2015=list(
			"Did Not Pass"="Did Not Pass",
			"Pass"="Pass",
			"Pass +"="Pass +"),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA"),
		Vertical_Scale="No",
		Vertical_Scale.2015="Yes",
		Grades_Tested=c(3,4,5,6,7,8,10),
		Grades_Tested.2015=c(3,4,5,6,7,8,10),
		Year="2015"
	)

SGPstateData[["IN"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE),
	Content_Areas_Labels=list(ELA="ELA", MATHEMATICS="Math"),
	Grades_Reported=list(ELA=c(3,4,5,6,7,8,10), MATHEMATICS=c(3,4,5,6,7,8,10)),
	Achievement_Level_Labels=list(
		"Did Not Pass"="Did Not Pass",
		"Pass"="Pass",
		"Pass +"="Pass +"))

SGPstateData[["IN"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=3,
	max.order.for.projection=3,
	sgp.projections.baseline.max.order=2,
	sgp.projections.lagged.baseline.max.order=2,
	percentile.cuts=c(1,35,65,99),
	sgp.loss.hoss.adjustment="IN",
	lagged.percentile.trajectory.values=c(1,35,65,99))

SGPstateData[["IN"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/IN_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/IN_Baseline_Matrices.Rdata")
#SGPstateData[["IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- IN_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- IN_Baseline_Matrices[["ELA.BASELINE"]]


########################################################
### IOWA
#########################################################

#load("Knots_Boundaries/IOWA_Knots_Boundaries.Rdata")
#SGPstateData[["IA"]][["Achievement"]][["Knots_Boundaries"]] <- IA_Knots_Boundaries

SGPstateData[["IA"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(175,218),
			GRADE_4=c(189,236),
			GRADE_5=c(202,254),
			GRADE_6=c(213,265),
			GRADE_7=c(226,288),
			GRADE_8=c(239,304),
			GRADE_9=c(249,318),
			GRADE_10=c(257,326),
			GRADE_11=c(263,332)),
		MATHEMATICS=list(
			GRADE_3=c(177,205),
			GRADE_4=c(189,224),
			GRADE_5=c(200,243),
			GRADE_6=c(212,258),
			GRADE_7=c(222,277),
			GRADE_8=c(236,291),
			GRADE_9=c(249,311),
			GRADE_10=c(257,320),
			GRADE_11=c(263,327)))

SGPstateData[["IA"]][["Achievement"]][["Levels"]] <-
    list(
    Labels=c("Not Proficient", "Proficient", "Advanced"),
    Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["IA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["IA"]][["Growth"]][["Cutscores"]] <-
    list(
    Cuts=c(35, 66),
    Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["IA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["IA"]][["Assessment_Program_Information"]] <-
    list(
    Assessment_Name="Iowa Assessment",
    Assessment_Abbreviation="ITP",
    Organization=list(
        Name="IOWA",
        Abbreviation="IA"),
    Content_Areas=c("Mathematics", "Reading"),
    Grades_Tested=c(3,4,5,6,7,8,9,10,11),
    Test_Season="Spring",
    Test_Vendor="ITP")

SGPstateData[["IA"]][["Student_Report_Information"]] <- list(
    Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
    Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
    Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10,11), READING=c(3,4,5,6,7,8,9,10,11)),
    Achievement_Level_Labels=list(
        "Not Proficient"="Not Proficient",
        "Proficient"="Proficient",
        "Advanced"="Advanced"))


#########################################################
### KANSAS
#########################################################

load("Knots_Boundaries/KS_Knots_Boundaries.Rdata")
SGPstateData[["KS"]][["Achievement"]][["Knots_Boundaries"]] <- KS_Knots_Boundaries

SGPstateData[["KS"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(58, 70, 85, 93),
			GRADE_4=c(54, 63, 80, 89),
			GRADE_5=c(54, 62, 78, 88),
			GRADE_6=c(53, 63, 79, 90),
			GRADE_7=c(44, 56, 71, 84),
			GRADE_8=c(45, 58, 73, 86),
			GRADE_11=c(38, 50, 68, 82)),
		READING=list(
			GRADE_3=c(55, 67, 80, 89),
			GRADE_4=c(57, 68, 81, 89),
			GRADE_5=c(57, 68, 80, 88),
			GRADE_6=c(52, 64, 79, 88),
			GRADE_7=c(50, 63, 77, 87),
			GRADE_8=c(50, 64, 79, 89),
			GRADE_11=c(54, 68, 81, 89)))

SGPstateData[["KS"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Academic Warning (Unsatisfactory)", "Approaching Standard (Basic)", "Meets Standard (Proficient)", "Exceeds Standard (Advanced)", "Exemplary", "Not Tested or Missing"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient", NA))

SGPstateData[["KS"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["KS"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["KS"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["KS"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Kansas General Education Assessments",
	Assessment_Abbreviation="KS-GEA",
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Spring",
	Assessment_Years=c("2005_2006", "2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"),
	Test_Vendor="The Center for Educational Testing and Evaluation (CETE) at The University of Kansas")
######  Grades and Assessment Years need to be verified - based on Sheng's sample data

SGPstateData[["KS"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=paste(2005:2015, 2006:2018, sep="_"),
									READING=paste(2005:2015, 2006:2018, sep="_")),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=paste(2005:2015, 2006:2018, sep="_"),
									READING=paste(2005:2015, 2006:2018, sep="_")),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)),
	Achievement_Level_Labels=list(
		"Warning"="Academic Warning (Unsatisfactory)",
		"Approaches"="Approaching Standard (Basic)",
		"Meets"="Meets Standard (Proficient)",
		"Exceeds"="Exceeds Standard (Advanced)",
		"Exemplary"="Exemplary"))

SGPstateData[["AOB"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AOB_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### KENTUCKY
#########################################################

SGPstateData[["KY"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(80, 320),
			boundaries_4=c(85.5, 319.5),
			boundaries_5=c(87.7, 319.3),
			boundaries_6=c(89.9, 319.1),
			boundaries_7=c(94.3, 318.7),
			boundaries_8=c(92.1, 318.9),
			knots_3= c(191, 202, 213, 225),
			knots_4=c(194, 204, 213, 226),
			knots_5=c(194, 205, 214, 226),
			knots_6=c(192, 201, 212, 223),
			knots_7=c(192, 201, 210, 222),
			knots_8=c(193, 202, 212, 223),
			loss.hoss_3=c(100, 300),
			loss.hoss_4=c(105, 300),
			loss.hoss_5=c(107, 300),
			loss.hoss_6=c(109, 300),
			loss.hoss_7=c(113, 300),
			loss.hoss_8=c(111, 300)),
		READING=list(
			boundaries_3=c(85.7, 305.3),
			boundaries_4=c(80.3, 316.7),
			boundaries_5=c(89.1, 315.9),
			boundaries_6=c(84.4, 319.6),
			boundaries_7=c(89.9, 319.1),
			boundaries_8=c(91, 295),
			knots_3= c(194, 206, 215, 226),
			knots_4=c(195, 206, 215, 225),
			knots_5=c(197, 207, 214, 223),
			knots_6=c(194, 205, 214, 224),
			knots_7=c(197, 207, 215, 225),
			knots_8=c(197, 206, 214, 223),
			loss.hoss_3=c(104, 287),
			loss.hoss_4=c(100, 297),
			loss.hoss_5=c(108, 297),
			loss.hoss_6=c(104, 300),
			loss.hoss_7=c(109, 300),
			loss.hoss_8=c(108, 278)))

SGPstateData[["KY"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(192, 210, 234),
			GRADE_4=c(194, 210, 229),
			GRADE_5=c(192, 210, 229),
			GRADE_6=c(191, 210, 231),
			GRADE_7=c(192, 210, 231),
			GRADE_8=c(192, 210, 232)),
		READING=list(
			GRADE_3=c(198, 210, 226),
			GRADE_4=c(197, 210, 227),
			GRADE_5=c(198, 210, 226),
			GRADE_6=c(199, 210, 227),
			GRADE_7=c(199, 210, 226),
			GRADE_8=c(199, 210, 225)))

SGPstateData[["KY"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Novice", "Apprentice", "Proficient", "Distinguished"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["KY"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="K-PREP",
	Assessment_Abbreviation="K-PREP",
	Content_Areas=c("READING", "MATHEMATICS"),
	Assessment_Years=c("2012_2013", "2013_2014", "2014_2015", "2015_2016"),
	Grades_Tested=c(3, 4, 5, 6, 7, 8),
	Test_Vendor="Pearson",
	Test_Season="Spring")

SGPstateData[["KY"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=paste(2012:2015, 2013:2018, sep="_"),
									READING=paste(2012:2015, 2013:2018, sep="_")),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=paste(2012:2015, 2013:2018, sep="_"),
									READING=paste(2012:2015, 2013:2018, sep="_")),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Novice"="Novice",
		"Apprentice"="Apprentice",
		"Proficient"="Proficient",
		"Distinguished"="Distinguished"))


#########################################################
### MAINE
#########################################################

SGPstateData[["ME"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		READING=list(
			knots_3=c(338, 344, 348, 356),
			knots_4=c(436, 442, 448, 454),
			knots_5=c(536, 542, 548, 555),
			knots_6=c(634, 640, 648, 655),
			knots_7=c(734, 742, 750, 758),
			knots_8=c(830, 840, 848, 858),
			boundaries_3=c(292, 388),
			boundaries_4=c(392, 488),
			boundaries_5=c(492, 588),
			boundaries_6=c(592, 688),
			boundaries_7=c(692, 788),
			boundaries_8=c(792, 888),
			boundaries_11=c(1092, 1180),
			loss.hoss_3=c(300, 380),
			loss.hoss_4=c(400, 480),
			loss.hoss_5=c(500, 580),
			loss.hoss_6=c(600, 680),
			loss.hoss_7=c(700, 780),
			loss.hoss_8=c(800, 880),
			loss.hoss_11=c(1100, 1180)),
		MATHEMATICS=list(
			knots_3=c(336, 342, 348, 354),
			knots_4=c(436, 442, 448, 454),
			knots_5=c(535, 542, 548, 554),
			knots_6=c(634, 642, 648, 656),
			knots_7=c(732, 742, 750, 758),
			knots_8=c(834, 842, 850, 858),
			boundaries_3=c(292, 388),
			boundaries_4=c(392, 488),
			boundaries_5=c(492, 588),
			boundaries_6=c(592, 688),
			boundaries_7=c(692, 788),
			boundaries_8=c(792, 888),
			boundaries_11=c(1092, 1188),
			loss.hoss_3=c(300, 380),
			loss.hoss_4=c(400, 480),
			loss.hoss_5=c(500, 580),
			loss.hoss_6=c(600, 680),
			loss.hoss_7=c(700, 780),
			loss.hoss_8=c(800, 880),
			loss.hoss_11=c(1100, 1180)))

SGPstateData[["ME"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(332, 340, 353),
			GRADE_4=c(431, 440, 455),
			GRADE_5=c(533, 540, 554),
			GRADE_6=c(633, 640, 653),
			GRADE_7=c(734, 740, 752),
			GRADE_8=c(834, 840, 852),
			GRADE_11=c(1134, 1140, 1152)),
		READING=list(
			GRADE_3=c(331, 340, 357),
			GRADE_4=c(431, 440, 456),
			GRADE_5=c(530, 540, 556),
			GRADE_6=c(629, 640, 659),
			GRADE_7=c(729, 740, 760),
			GRADE_8=c(828, 840, 859),
			GRADE_11=c(1130, 1140, 1154)))

SGPstateData[["ME"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["ME"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ME"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["ME"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["ME"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Maine NECAP",
		Assessment_Abbreviation="NECAP",
		Organization=list(
			Name="Maine Department of Education",
			Abbreviation="MDOE",
			URL="www.maine.gov/education",
			Contact="207-624-6600"),
		Content_Areas=c("Mathematics", "Reading"),
		Scale_Change=list(MATHEMATICS="2014_2015", READING="2014_2015"),
		Grades_Tested=c(3,4,5,6,7,8),
		Test_Season="Fall",
		Test_Vendor="Measured Progress")
#		CSEM=NECAP_CSEM)

SGPstateData[["ME"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
										MATHEMATICS=paste(2007:2013, 2008:2014, sep="_"),
										READING=paste(2007:2013, 2008:2014, sep="_")),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
										MATHEMATICS=paste(2007:2013, 2008:2014, sep="_"),
										READING=paste(2007:2013, 2008:2014, sep="_")),
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Below Proficient"="Substantially Below Proficient",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Distinction"="Proficient with Distinction"))

SGPstateData[["ME"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/ME_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/ME/ME_Baseline_Matrices.Rdata")
#SGPstateData[["ME"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- ME_Baseline_Matrices[["READING.BASELINE"]]
#SGPstateData[["ME"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- ME_Baseline_Matrices[["MATHEMATICS.BASELINE"]]


#########################################################
### MARYLAND
#########################################################

load("Knots_Boundaries/PARCC_MD_Knots_Boundaries.Rdata")
SGPstateData[["MD"]] <- SGPstateData[['PARCC']]
SGPstateData[["MD"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_MD_Knots_Boundaries

SGPstateData[["MD"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="Maryland State Department of Education",
			Abbreviation="MSDE",
			URL="www.marylandpublicschools.org",
			Contact="888-246-0016"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")


#########################################################
### MASSACHUSETTS
#########################################################

### MASSACHUSETTS (MCAS meta-data)

#load("CSEM/Massachusetts/Massachusetts_CSEM.Rdata")
#SGPstateData[["MA_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		MATHEMATICS=list(
#			boundaries_3=c(-6.904, 4.189),
#			boundaries_4=c(-5.225, 2.647),
#			boundaries_5=c(-7.580, 4.115),
#			boundaries_6=c(-9.691, 4.801),
#			boundaries_7=c(-11.246, 4.736),
#			boundaries_8=c(-18.094, 4.696),
#			boundaries_10=c(-18.094, 4.696),
#			knots_3=c(-0.436, 0.155, 0.618, 1.250),
#			knots_4=c(-0.553, -0.125, 0.225, 0.658),
#			knots_5=c(-0.794, -0.156, 0.368, 0.956),
#			knots_6=c(-0.848, -0.081, 0.500, 1.258),
#			knots_7=c(-1.097, -0.346, 0.292, 1.021),
#			knots_8=c(-1.175, -0.369, 0.298, 0.988),
#			knots_10=c(-1.175, -0.369, 0.298, 0.988),
#			loss.hoss_3=c(-6.904, 4.189),
#			loss.hoss_4=c(-5.225, 2.647),
#			loss.hoss_5=c(-7.580, 4.115),
#			loss.hoss_6=c(-9.691, 4.801),
#			loss.hoss_7=c(-11.246, 4.736),
#			loss.hoss_8=c(-18.094, 4.696),
#			loss.hoss_10=c(-18.094, 4.696)),
#		ELA=list(
#			boundaries_3=c(-8.275, 3.620),
#			boundaries_4=c(-2.788, 3.995),
#			boundaries_5=c(-4.08, 4.08),
#			boundaries_6=c(-4.088, 4.841),
#			boundaries_7=c(-6.11, 4.82),
#			boundaries_8=c(-6.375, 5.67),
#			boundaries_10=c(-6.375, 5.67),
#			knots_3=c(-0.903, -0.331, 0.181, 0.763),
#			knots_4=c(-1.161, -0.463, .079, 0.759),
#			knots_5=c(-0.854, -0.201, -0.301, 0.977),
#			knots_6=c(-0.721, -0.031, 0.537, 1.077),
#			knots_7=c(-0.697, 0.053, 0.596, 1.265),
#			knots_8=c(-0.520, 0.236, 0.834, 1.622),
#			knots_10=c(-0.520, 0.236, 0.834, 1.622),
#			loss.hoss_3=c(-8.275, 3.620),
#			loss.hoss_4=c(-2.788, 3.995),
#			loss.hoss_5=c(-4.08, 4.08),
#			loss.hoss_6=c(-4.088, 4.841),
#			loss.hoss_7=c(-6.11, 4.82),
#			loss.hoss_8=c(-6.375, 5.67),
#			loss.hoss_10=c(-6.375, 5.67)))

#SGPstateData[["MA_ORIGINAL"]][["Achievement"]][["Cutscores"]] <- list(
#	ELA=list(
#		GRADE_3=c(-1.42909369, -0.215034418, 1.091762353),
#		GRADE_4=c(-1.701038566, -0.231680055, 1.298985981),
#		GRADE_5=c(-1.676113199, -0.192168777, 1.366544216),
#		GRADE_6=c(-1.691579968, -0.17458534, 1.760596127),
#		GRADE_7=c(-1.729307659, -0.234448095, 1.794513035),
#		GRADE_8=c(-1.659630289, -0.307644016, 2.092363055),
#		GRADE_10=c(-1.810870172, -0.278593633, 1.435370133)),
#	ELA.2010=list(
#		GRADE_3=c(-1.621318975, -0.235480278, 1.018899635),
#		GRADE_4=c(-1.682014372, -0.223930122, 1.37276864),
#		GRADE_5=c(-1.599576055, -0.227214179, 1.254204256),
#		GRADE_6=c(-1.731083908, -0.262337138, 1.729612884),
#		GRADE_7=c(-1.650343315, -0.290737927, 1.927702368),
#		GRADE_8=c(-1.608374133, -0.247825427, 2.050635042),
#		GRADE_10=c(-1.919766153, -0.227606302, 1.492616535)),
#	ELA.2011=list(
#		GRADE_3=c(-1.644681109, -0.283594296, 1.205757479),
#		GRADE_4=c(-1.715332096, -0.22960969, 1.486208717),
#		GRADE_5=c(-1.701200572, -0.312242947, 1.192126975),
#		GRADE_6=c(-1.671314382, -0.201858788, 1.673682971),
#		GRADE_7=c(-1.698154856, -0.247514204, 1.744052569),
#		GRADE_8=c(-1.619903644, -0.279321809, 1.992450909),
#		GRADE_10=c(-1.909834297, -0.302027595, 1.414670298)),
#	ELA.2012=list(
#		GRADE_3=c(-1.686017235, -0.31126683, 0.901631274),
#		GRADE_4=c(-1.672310689, -0.303124723, 1.382321351),
#		GRADE_5=c(-1.659283658, -0.241931899, 1.266161997),
#		GRADE_6=c(-1.623704972, -0.232602665, 1.618507533),
#		GRADE_7=c(-1.695255017, -0.213966527, 1.845140149),
#		GRADE_8=c(-1.681302569, -0.301606879, 2.106119446),
#		GRADE_10=c(-1.895658417, -0.289381678, 1.451536227)),
#	ELA.2013=list(
#		GRADE_3=c(-1.677320162, -0.21672897, 1.117832811),
#		GRADE_4=c(-1.740793321, -0.280595031, 1.452778744),
#		GRADE_5=c(-1.629517738, -0.306804018, 1.1993955),
#		GRADE_6=c(-1.717854121, -0.178538123, 1.81569587),
#		GRADE_7=c(-1.722321416, -0.253271057, 1.786744892),
#		GRADE_8=c(-1.613784175, -0.257666012, 2.081155848),
#		GRADE_10=c(-1.813457499, -0.237741623, 1.470799706)),
#	MATHEMATICS=list(
#		GRADE_3=c(-0.679597014, 0.259570745, 1.440019007),
#		GRADE_4=c(-0.818911094, 0.150419543, 0.745903854),
#		GRADE_5=c(-0.843950203, 0.171740196, 1.079620173),
#		GRADE_6=c(-0.90862029, 0.145456382, 1.234203935),
#		GRADE_7=c(-0.849875919, 0.174870873, 1.251282185),
#		GRADE_8=c(-0.879401299, 0.170045893, 1.180853733),
#		GRADE_10=c(-1.417415757, 0.15243449, 1.371427206)),
#	MATHEMATICS.2010=list(
#		GRADE_3=c(-0.869475871, 0.187857155, 1.32813029),
#		GRADE_4=c(-0.792569016, 0.158288036, 0.760617004),
#		GRADE_5=c(-0.829436707, 0.186441511, 1.03658179),
#		GRADE_6=c(-0.879909019, 0.172964143, 1.220837038),
#		GRADE_7=c(-0.855205788, 0.142883728, 1.325876342),
#		GRADE_8=c(-0.901223853, 0.196553224, 1.27311411),
#		GRADE_10=c(-1.538201277, 0.178728912, 1.355127466)),
#	MATHEMATICS.2011=list(
#		GRADE_3=c(-0.836216032, 0.135066055, 1.457577645),
#		GRADE_4=c(-0.812718733, 0.174743403, 0.758801425),
#		GRADE_5=c(-0.808464525, 0.149127134, 1.088119238),
#		GRADE_6=c(-0.859234498, 0.190546824, 1.209532603),
#		GRADE_7=c(-0.90052886, 0.193310389, 1.321574452),
#		GRADE_8=c(-0.92188104, 0.132145402, 1.180694563),
#		GRADE_10=c(-1.415991148, 0.145731612, 1.445822342)),
#	MATHEMATICS.2012=list(
#		GRADE_3=c(-0.774653198, 0.206120813, 1.222999624),
#		GRADE_4=c(-0.770931912, 0.132958294, 0.786784793),
#		GRADE_5=c(-0.806186904, 0.159558291, 1.100842745),
#		GRADE_6=c(-0.8459956, 0.198964231, 1.194926159),
#		GRADE_7=c(-0.924844147, 0.203457327, 1.24529973),
#		GRADE_8=c(-0.927795391, 0.176658004, 1.242965789),
#		GRADE_10=c(-1.411008894, 0.109299723, 1.452366601)),
#	MATHEMATICS.2013=list(
#		GRADE_3=c(-0.819602484, 0.214018392, 1.235457872),
#		GRADE_4=c(-0.835527388, 0.131079297, 0.779292276),
#		GRADE_5=c(-0.898299863, 0.142907475, 1.081483186),
#		GRADE_6=c(-0.850822498, 0.160319072, 1.272165299),
#		GRADE_7=c(-0.891990177, 0.126106113, 1.260375497),
#		GRADE_8=c(-0.878231414, 0.141874403, 1.303559999),
#		GRADE_10=c(-1.381145218, 0.111910031, 1.371984305)))

#SGPstateData[["MA_ORIGINAL"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

#SGPstateData[["MA_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Moderate", "High", "Very High")

#SGPstateData[["MA_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

#SGPstateData[["MA_ORIGINAL"]][["Growth"]][["Cutscores"]] <- list(
#	Cuts=c(20, 40, 61, 81),
#	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

#SGPstateData[["MA_ORIGINAL"]][["Assessment_Program_Information"]] <-
#	list(
#		Assessment_Name="Massachusetts Comprehensive Assessment System",
#		Assessment_Abbreviation="MCAS",
#			Organization=list(
#			Name="Massachusetts Department of Elementary and Secondary Education",
#			Abbreviation="ESE",
#			URL="http://www.doe.mass.edu/",
#			Contact="781-338-3000"),
#		Content_Areas=c("Mathematics", "English Language Arts"),
#		Grades_Tested=c(3,4,5,6,7,8,10),
#		Test_Season="Spring",
#		Test_Vendor="Measured Progress",
#		CSEM=Massachusetts_CSEM)

#SGPstateData[["MA_ORIGINAL"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
#	list(
#		Assessment_Abbreviation="MCAS",
#		Assessment_Abbreviation.2015="PARCC",
#		Assessment_Name="Massachusetts Comprehensive Assessment System",
#		Assessment_Name.2015="Partnership for Assessment of Readiness for College and Careers",
#		Achievement_Levels=list(
#		Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#		Achievement_Levels.2015=list(
#			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
#			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#		Achievement_Level_Labels=list(
#			"Warning/Failing"="Warning/Failing",
#			"Needs Improvement"="Needs Improvement",
#			"Proficient"="Proficient",
#			"Advanced"="Advanced"),
#		Achievement_Level_Labels.2015=list(
#			"Level 1"="Level 1",
#			"Level 2"="Level 2",
#			"Level 3"="Level 3",
#			"Level 4"="Level 4",
#			"Level 5"="Level 5"),
#		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA", ALGEBRA_I="Algebra I"),
#		Vertical_Scale="No",
#		Vertical_Scale.2015="No",
#		Grades_Tested=c(3,4,5,6,7,8),
#		Grades_Tested.2015=c(3,4,5,6,7,8),
#		Year="2015",
#		Equate_Interval_Digits=2
#	)

#SGPstateData[["MA_ORIGINAL"]][["Student_Report_Information"]] <- list(
#	Transformed_Achievement_Level_Cutscores=list(
#									MATHEMATICS=as.character(2009:2016),
#									ELA=as.character(2009:2016)),
#	Transformed_Achievement_Level_Cutscores_gaPlot=list(
#									MATHEMATICS=as.character(2009:2016),
#									ELA=as.character(2009:2016)),
#	Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
#	Projection_Fan_Limits=c(5, 95),
#	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), ELA=c(3,4,5,6,7,8,10)),
#	Achievement_Level_Labels=list(
#		"Warning/Failing"="Warning/Failing",
#		"Needs Improvement"="Needs Improvement",
#		"Proficient"="Proficient",
#		"Advanced"="Advanced"))

#SGPstateData[["MA_ORIGINAL"]][["SGP_Configuration"]] <- list(
#						sgp.projections.max.forward.progression.grade=8)

#load("Baseline_Coefficient_Matrices/MA/MA_Baseline_Matrices_2009_2013.Rdata")
#SGPstateData[["MA_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- MA_Baseline_Matrices_2009_2013[["ELA.BASELINE"]]
#SGPstateData[["MA_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- MA_Baseline_Matrices_2009_2013[["MATHEMATICS.BASELINE"]]

#SGPstateData[["MA_ORIGINAL"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### MASSACHUSETTS_MCAS

#load("CSEM/Massachusetts/Massachusetts_MCAS_CSEM.Rdata")
#SGPstateData[["MA_MCAS"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		MATHEMATICS=list(
#			boundaries_3=c(-6.904, 4.189),
#			boundaries_4=c(-5.225, 2.647),
#			boundaries_5=c(-7.580, 4.115),
#			boundaries_6=c(-9.691, 4.801),
#			boundaries_7=c(-11.246, 4.736),
#			boundaries_8=c(-18.094, 4.696),
#			boundaries_10=c(-18.094, 4.696),
#			knots_3=c(-0.436, 0.155, 0.618, 1.250),
#			knots_4=c(-0.553, -0.125, 0.225, 0.658),
#			knots_5=c(-0.794, -0.156, 0.368, 0.956),
#			knots_6=c(-0.848, -0.081, 0.500, 1.258),
#			knots_7=c(-1.097, -0.346, 0.292, 1.021),
#			knots_8=c(-1.175, -0.369, 0.298, 0.988),
#			knots_10=c(-1.175, -0.369, 0.298, 0.988),
#			loss.hoss_3=c(-6.904, 4.189),
#			loss.hoss_4=c(-5.225, 2.647),
#			loss.hoss_5=c(-7.580, 4.115),
#			loss.hoss_6=c(-9.691, 4.801),
#			loss.hoss_7=c(-11.246, 4.736),
#			loss.hoss_8=c(-18.094, 4.696),
#			loss.hoss_10=c(-18.094, 4.696)),
#		ELA=list(
#			boundaries_3=c(-8.275, 3.620),
#			boundaries_4=c(-2.788, 3.995),
#			boundaries_5=c(-4.08, 4.08),
#			boundaries_6=c(-4.088, 4.841),
#			boundaries_7=c(-6.11, 4.82),
#			boundaries_8=c(-6.375, 5.67),
#			boundaries_10=c(-6.375, 5.67),
#			knots_3=c(-0.903, -0.331, 0.181, 0.763),
#			knots_4=c(-1.161, -0.463, .079, 0.759),
#			knots_5=c(-0.854, -0.201, -0.301, 0.977),
#			knots_6=c(-0.721, -0.031, 0.537, 1.077),
#			knots_7=c(-0.697, 0.053, 0.596, 1.265),
#			knots_8=c(-0.520, 0.236, 0.834, 1.622),
#			knots_10=c(-0.520, 0.236, 0.834, 1.622),
#			loss.hoss_3=c(-8.275, 3.620),
#			loss.hoss_4=c(-2.788, 3.995),
#			loss.hoss_5=c(-4.08, 4.08),
#			loss.hoss_6=c(-4.088, 4.841),
#			loss.hoss_7=c(-6.11, 4.82),
#			loss.hoss_8=c(-6.375, 5.67),
#			loss.hoss_10=c(-6.375, 5.67)))

#SGPstateData[["MA_MCAS"]][["Achievement"]][["Cutscores"]] <-
#	list(
#		ELA=list(
#			GRADE_3=c(-1.42909369, -0.215034418, 1.091762353),
#			GRADE_4=c(-1.701038566, -0.231680055, 1.298985981),
#			GRADE_5=c(-1.676113199, -0.192168777, 1.366544216),
#			GRADE_6=c(-1.691579968, -0.17458534, 1.760596127),
#			GRADE_7=c(-1.729307659, -0.234448095, 1.794513035),
#			GRADE_8=c(-1.659630289, -0.307644016, 2.092363055),
#			GRADE_10=c(-1.810870172, -0.278593633, 1.435370133)),
#		ELA.2010=list(
#			GRADE_3=c(-1.621318975, -0.235480278, 1.018899635),
#			GRADE_4=c(-1.682014372, -0.223930122, 1.37276864),
#			GRADE_5=c(-1.599576055, -0.227214179, 1.254204256),
#			GRADE_6=c(-1.731083908, -0.262337138, 1.729612884),
#			GRADE_7=c(-1.650343315, -0.290737927, 1.927702368),
#			GRADE_8=c(-1.608374133, -0.247825427, 2.050635042),
#			GRADE_10=c(-1.919766153, -0.227606302, 1.492616535)),
#		ELA.2011=list(
#			GRADE_3=c(-1.644681109, -0.283594296, 1.205757479),
#			GRADE_4=c(-1.715332096, -0.22960969, 1.486208717),
#			GRADE_5=c(-1.701200572, -0.312242947, 1.192126975),
#			GRADE_6=c(-1.671314382, -0.201858788, 1.673682971),
#			GRADE_7=c(-1.698154856, -0.247514204, 1.744052569),
#			GRADE_8=c(-1.619903644, -0.279321809, 1.992450909),
#			GRADE_10=c(-1.909834297, -0.302027595, 1.414670298)),
#		ELA.2012=list(
#			GRADE_3=c(-1.686017235, -0.31126683, 0.901631274),
#			GRADE_4=c(-1.672310689, -0.303124723, 1.382321351),
#			GRADE_5=c(-1.659283658, -0.241931899, 1.266161997),
#			GRADE_6=c(-1.623704972, -0.232602665, 1.618507533),
#			GRADE_7=c(-1.695255017, -0.213966527, 1.845140149),
#			GRADE_8=c(-1.681302569, -0.301606879, 2.106119446),
#			GRADE_10=c(-1.895658417, -0.289381678, 1.451536227)),
#		ELA.2013=list(
#			GRADE_3=c(-1.677320162, -0.21672897, 1.117832811),
#			GRADE_4=c(-1.740793321, -0.280595031, 1.452778744),
#			GRADE_5=c(-1.629517738, -0.306804018, 1.1993955),
#			GRADE_6=c(-1.717854121, -0.178538123, 1.81569587),
#			GRADE_7=c(-1.722321416, -0.253271057, 1.786744892),
#			GRADE_8=c(-1.613784175, -0.257666012, 2.081155848),
#			GRADE_10=c(-1.813457499, -0.237741623, 1.470799706)),
#		MATHEMATICS=list(
#			GRADE_3=c(-0.679597014, 0.259570745, 1.440019007),
#			GRADE_4=c(-0.818911094, 0.150419543, 0.745903854),
#			GRADE_5=c(-0.843950203, 0.171740196, 1.079620173),
#			GRADE_6=c(-0.90862029, 0.145456382, 1.234203935),
#			GRADE_7=c(-0.849875919, 0.174870873, 1.251282185),
#			GRADE_8=c(-0.879401299, 0.170045893, 1.180853733),
#			GRADE_10=c(-1.417415757, 0.15243449, 1.371427206)),
#		MATHEMATICS.2010=list(
#			GRADE_3=c(-0.869475871, 0.187857155, 1.32813029),
#			GRADE_4=c(-0.792569016, 0.158288036, 0.760617004),
#			GRADE_5=c(-0.829436707, 0.186441511, 1.03658179),
#			GRADE_6=c(-0.879909019, 0.172964143, 1.220837038),
#			GRADE_7=c(-0.855205788, 0.142883728, 1.325876342),
#			GRADE_8=c(-0.901223853, 0.196553224, 1.27311411),
#			GRADE_10=c(-1.538201277, 0.178728912, 1.355127466)),
#		MATHEMATICS.2011=list(
#			GRADE_3=c(-0.836216032, 0.135066055, 1.457577645),
#			GRADE_4=c(-0.812718733, 0.174743403, 0.758801425),
#			GRADE_5=c(-0.808464525, 0.149127134, 1.088119238),
#			GRADE_6=c(-0.859234498, 0.190546824, 1.209532603),
#			GRADE_7=c(-0.90052886, 0.193310389, 1.321574452),
#			GRADE_8=c(-0.92188104, 0.132145402, 1.180694563),
#			GRADE_10=c(-1.415991148, 0.145731612, 1.445822342)),
#		MATHEMATICS.2012=list(
#			GRADE_3=c(-0.774653198, 0.206120813, 1.222999624),
#			GRADE_4=c(-0.770931912, 0.132958294, 0.786784793),
#			GRADE_5=c(-0.806186904, 0.159558291, 1.100842745),
#			GRADE_6=c(-0.8459956, 0.198964231, 1.194926159),
#			GRADE_7=c(-0.924844147, 0.203457327, 1.24529973),
#			GRADE_8=c(-0.927795391, 0.176658004, 1.242965789),
#			GRADE_10=c(-1.411008894, 0.109299723, 1.452366601)),
#		MATHEMATICS.2013=list(
#			GRADE_3=c(-0.819602484, 0.214018392, 1.235457872),
#			GRADE_4=c(-0.835527388, 0.131079297, 0.779292276),
#			GRADE_5=c(-0.898299863, 0.142907475, 1.081483186),
#			GRADE_6=c(-0.850822498, 0.160319072, 1.272165299),
#			GRADE_7=c(-0.891990177, 0.126106113, 1.260375497),
#			GRADE_8=c(-0.878231414, 0.141874403, 1.303559999),
#			GRADE_10=c(-1.381145218, 0.111910031, 1.371984305)))

#SGPstateData[["MA_MCAS"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

#SGPstateData[["MA_MCAS"]][["Growth"]][["Cutscores"]] <- list(
#	Cuts=c(20, 40, 61, 81),
#	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

#SGPstateData[["MA_MCAS"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
#SGPstateData[["MA_MCAS"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Moderate", "High", "Very High")

#SGPstateData[["MA_MCAS"]][["Assessment_Program_Information"]] <- list(
#	Assessment_Name="Massachusetts Comprehensive Assessment System",
#	Assessment_Abbreviation="MCAS",
#		Organization=list(
#		Name="Massachusetts Department of Elementary and Secondary Education",
#		Abbreviation="ESE",
#		URL="http://www.doe.mass.edu/",
#		Contact="781-338-3000"),
#	Content_Areas=c("Mathematics", "English Language Arts"),
#	Grades_Tested=c(3,4,5,6,7,8,10),
#	Test_Season="Spring",
#	Test_Vendor="Measured Progress",
#	CSEM=Massachusetts_MCAS_CSEM)

#SGPstateData[["MA_MCAS"]][["Student_Report_Information"]] <- list(
#	Transformed_Achievement_Level_Cutscores=list(
#									MATHEMATICS=as.character(2009:2016),
#									ELA=as.character(2009:2016)),
#	Transformed_Achievement_Level_Cutscores_gaPlot=list(
#									MATHEMATICS=as.character(2009:2016),
#									ELA=as.character(2009:2016)),
#	Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
#	Projection_Fan_Limits=c(5, 95),
#	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), ELA=c(3,4,5,6,7,8,10)),
#	Achievement_Level_Labels=list(
#		"Warning/Failing"="Warning/Failing",
#		"Needs Improvement"="Needs Improvement",
#		"Proficient"="Proficient",
#		"Advanced"="Advanced"))

#SGPstateData[["MA_MCAS"]][["SGP_Configuration"]] <- list(
#	sgp.projections.max.forward.progression.grade=8)

#SGPstateData[["MA_MCAS"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### MASSACHUSETTS_PARCC

#load("CSEM/Massachusetts/Massachusetts_PARCC_CSEM.Rdata")

#load("Knots_Boundaries/MA_PARCC_Knots_Boundaries.Rdata")
#SGPstateData[["MA_PARCC"]][["Achievement"]][["Knots_Boundaries"]] <- MA_PARCC_Knots_Boundaries

#SGPstateData[["MA_PARCC"]][["Achievement"]][["Cutscores"]] <- list(
#	ELA=list(
#		GRADE_3=c(-1.42909369, -0.215034418, 1.091762353),
#		GRADE_4=c(-1.701038566, -0.231680055, 1.298985981),
#		GRADE_5=c(-1.676113199, -0.192168777, 1.366544216),
#		GRADE_6=c(-1.691579968, -0.17458534, 1.760596127),
#		GRADE_7=c(-1.729307659, -0.234448095, 1.794513035),
#		GRADE_8=c(-1.659630289, -0.307644016, 2.092363055),
#		GRADE_10=c(-1.810870172, -0.278593633, 1.435370133)),
#	ELA.2010=list(
#		GRADE_3=c(-1.621318975, -0.235480278, 1.018899635),
#		GRADE_4=c(-1.682014372, -0.223930122, 1.37276864),
#		GRADE_5=c(-1.599576055, -0.227214179, 1.254204256),
#		GRADE_6=c(-1.731083908, -0.262337138, 1.729612884),
#		GRADE_7=c(-1.650343315, -0.290737927, 1.927702368),
#		GRADE_8=c(-1.608374133, -0.247825427, 2.050635042),
#		GRADE_10=c(-1.919766153, -0.227606302, 1.492616535)),
#	ELA.2011=list(
#		GRADE_3=c(-1.644681109, -0.283594296, 1.205757479),
#		GRADE_4=c(-1.715332096, -0.22960969, 1.486208717),
#		GRADE_5=c(-1.701200572, -0.312242947, 1.192126975),
#		GRADE_6=c(-1.671314382, -0.201858788, 1.673682971),
#		GRADE_7=c(-1.698154856, -0.247514204, 1.744052569),
#		GRADE_8=c(-1.619903644, -0.279321809, 1.992450909),
#		GRADE_10=c(-1.909834297, -0.302027595, 1.414670298)),
#	ELA.2012=list(
#		GRADE_3=c(-1.686017235, -0.31126683, 0.901631274),
#		GRADE_4=c(-1.672310689, -0.303124723, 1.382321351),
#		GRADE_5=c(-1.659283658, -0.241931899, 1.266161997),
#		GRADE_6=c(-1.623704972, -0.232602665, 1.618507533),
#		GRADE_7=c(-1.695255017, -0.213966527, 1.845140149),
#		GRADE_8=c(-1.681302569, -0.301606879, 2.106119446),
#		GRADE_10=c(-1.895658417, -0.289381678, 1.451536227)),
#	ELA.2013=list(
#		GRADE_3=c(-1.677320162, -0.21672897, 1.117832811),
#		GRADE_4=c(-1.740793321, -0.280595031, 1.452778744),
#		GRADE_5=c(-1.629517738, -0.306804018, 1.1993955),
#		GRADE_6=c(-1.717854121, -0.178538123, 1.81569587),
#		GRADE_7=c(-1.722321416, -0.253271057, 1.786744892),
#		GRADE_8=c(-1.613784175, -0.257666012, 2.081155848),
#		GRADE_10=c(-1.813457499, -0.237741623, 1.470799706)),
#	ELA.2015 =list(
#		GRADE_3=c(-0.9853, -0.2993, 0.3904, 2.0464),
#		GRADE_4=c(-1.3364, -0.5317, 0.2807, 1.5798),
#		GRADE_5=c(-1.3927, -0.5453, 0.3031, 1.9675),
#		GRADE_6=c(-1.3797, -0.5106, 0.3583, 1.7538),
#		GRADE_7=c(-1.1893, -0.4518, 0.2858, 1.3188),
#		GRADE_8=c(-1.1576, -0.4282, 0.3001, 1.5809)),

#	MATHEMATICS=list(
#		GRADE_3=c(-0.679597014, 0.259570745, 1.440019007),
#		GRADE_4=c(-0.818911094, 0.150419543, 0.745903854),
#		GRADE_5=c(-0.843950203, 0.171740196, 1.079620173),
#		GRADE_6=c(-0.90862029, 0.145456382, 1.234203935),
#		GRADE_7=c(-0.849875919, 0.174870873, 1.251282185),
#		GRADE_8=c(-0.879401299, 0.170045893, 1.180853733),
#		GRADE_10=c(-1.417415757, 0.15243449, 1.371427206)),
#	MATHEMATICS.2010=list(
#		GRADE_3=c(-0.869475871, 0.187857155, 1.32813029),
#		GRADE_4=c(-0.792569016, 0.158288036, 0.760617004),
#		GRADE_5=c(-0.829436707, 0.186441511, 1.03658179),
#		GRADE_6=c(-0.879909019, 0.172964143, 1.220837038),
#		GRADE_7=c(-0.855205788, 0.142883728, 1.325876342),
#		GRADE_8=c(-0.901223853, 0.196553224, 1.27311411),
#		GRADE_10=c(-1.538201277, 0.178728912, 1.355127466)),
#	MATHEMATICS.2011=list(
#		GRADE_3=c(-0.836216032, 0.135066055, 1.457577645),
#		GRADE_4=c(-0.812718733, 0.174743403, 0.758801425),
#		GRADE_5=c(-0.808464525, 0.149127134, 1.088119238),
#		GRADE_6=c(-0.859234498, 0.190546824, 1.209532603),
#		GRADE_7=c(-0.90052886, 0.193310389, 1.321574452),
#		GRADE_8=c(-0.92188104, 0.132145402, 1.180694563),
#		GRADE_10=c(-1.415991148, 0.145731612, 1.445822342)),
#	MATHEMATICS.2012=list(
#		GRADE_3=c(-0.774653198, 0.206120813, 1.222999624),
#		GRADE_4=c(-0.770931912, 0.132958294, 0.786784793),
#		GRADE_5=c(-0.806186904, 0.159558291, 1.100842745),
#		GRADE_6=c(-0.8459956, 0.198964231, 1.194926159),
#		GRADE_7=c(-0.924844147, 0.203457327, 1.24529973),
#		GRADE_8=c(-0.927795391, 0.176658004, 1.242965789),
#		GRADE_10=c(-1.411008894, 0.109299723, 1.452366601)),
#	MATHEMATICS.2013=list(
#		GRADE_3=c(-0.819602484, 0.214018392, 1.235457872),
#		GRADE_4=c(-0.835527388, 0.131079297, 0.779292276),
#		GRADE_5=c(-0.898299863, 0.142907475, 1.081483186),
#		GRADE_6=c(-0.850822498, 0.160319072, 1.272165299),
#		GRADE_7=c(-0.891990177, 0.126106113, 1.260375497),
#		GRADE_8=c(-0.878231414, 0.141874403, 1.303559999),
#		GRADE_10=c(-1.381145218, 0.111910031, 1.371984305)),
#	MATHEMATICS.2015=list(
#		GRADE_3=c(-1.2554, -0.4704, 0.3141, 1.5706),
#		GRADE_4=c(-1.292, -0.4443, 0.4003, 1.9593),
#		GRADE_5=c(-1.2863, -0.4264, 0.4358, 1.8156),
#		GRADE_6=c(-1.2872, -0.4151, 0.4579, 1.7864),
#		GRADE_7=c(-1.3656, -0.3931, 0.5803, 1.9826),
#		GRADE_8=c(-0.8499, -0.1114, 0.6337, 2.1573)),
#	ALGEBRA_I.2015=list(
#		GRADE_8=c(-1.114, -0.2949, 0.5287, 2.3463))
#)

###  PARCC SCALE SCORE METRIC CUTSCORES ###
# 	ELA.2015 =list(
# 		GRADE_3=c(700, 725, 750, 810),
# 		GRADE_4=c(700, 725, 750, 790),
# 		GRADE_5=c(700, 725, 750, 799),
# 		GRADE_6=c(700, 725, 750, 790),
# 		GRADE_7=c(700, 725, 750, 785),
# 		GRADE_8=c(700, 725, 750, 794),
# 		GRADE_9=c(700, 725, 750, 791),
# 		GRADE_10=c(700, 725, 750, 794),
# 		GRADE_11=c(700, 725, 750, 792)),
#
# 	MATHEMATICS.2015 =list(
# 		GRADE_3=c(700, 725, 750, 790),
# 		GRADE_4=c(700, 725, 750, 796),
# 		GRADE_5=c(700, 725, 750, 790),
# 		GRADE_6=c(700, 725, 750, 788),
# 		GRADE_7=c(700, 725, 750, 786),
# 		GRADE_8=c(700, 725, 750, 801)),
#
# 	ALGEBRA_I.2015 =list(
# 		GRADE_8=c(700, 725, 750, 805),
# 		GRADE_EOCT=c(700, 725, 750, 805)),

# 	ALGEBRA_II.2015 =list(GRADE_EOCT=c(700, 725, 750, 808)),
# 	GEOMETRY.2015=list(GRADE_EOCT=c(700, 725, 750, 783)),
# 	INTEGRATED_MATH_1.2015=list(GRADE_EOCT=c(700, 725, 750, 799)),
# 	INTEGRATED_MATH_2.2015=list(GRADE_EOCT=c(700, 725, 750, 785)),
# 	INTEGRATED_MATH_3=list(GRADE_EOCT=c(700, 725, 750, 804))
###

#SGPstateData[["MA_PARCC"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
#	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["MA_PARCC"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

#SGPstateData[["MA_PARCC"]][["Growth"]][["Cutscores"]] <- list(
#	Cuts=c(20, 40, 61, 81),
#	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

#SGPstateData[["MA_PARCC"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
#SGPstateData[["MA_PARCC"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Moderate", "High", "Very High")

#SGPstateData[["MA_PARCC"]][["Assessment_Program_Information"]] <-
#	list(
#	Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
#	Assessment_Abbreviation="PARCC",
#	Organization=list(
#		Name="Massachusetts Department of Elementary and Secondary Education",
#		Abbreviation="ESE",
#		URL="http://www.doe.mass.edu/",
#		Contact="781-338-3000"),
#	Content_Areas=c("Mathematics", "English Language Arts"),
#	Grades_Tested=c(3,4,5,6,7,8),
#	Test_Season="Spring",
#	Test_Vendor="PARCC",
#	CSEM=Massachusetts_PARCC_CSEM)

#SGPstateData[["MA_PARCC"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
#	list(
#		Assessment_Abbreviation="MCAS",
#		Assessment_Abbreviation.2015="PARCC",
#		Assessment_Name="Massachusetts Comprehensive Assessment System",
#		Assessment_Name.2015="Partnership for Assessment of Readiness for College and Careers",
#		Achievement_Levels=list(
#			Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#		Achievement_Levels.2015=list(
#			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
#			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#		Achievement_Level_Labels=list(
#			"Warning/Failing"="Warning/Failing",
#			"Needs Improvement"="Needs Improvement",
#			"Proficient"="Proficient",
#			"Advanced"="Advanced"),
#		Achievement_Level_Labels.2015=list(
#				"Level 1"="Level 1",
#				"Level 2"="Level 2",
#				"Level 3"="Level 3",
#				"Level 4"="Level 4",
#				"Level 5"="Level 5"),
#		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA", ALGEBRA_I="Algebra I"),
#		Vertical_Scale="No",
#		Vertical_Scale.2015="No",
#		Grades_Tested=c(3,4,5,6,7,8),
#		Grades_Tested.2015=c(3,4,5,6,7,8),
#		Year="2015",
#		Equate_Interval_Digits=2
#	)

#SGPstateData[["MA_PARCC"]][["Student_Report_Information"]] <- list(
#	Transformed_Achievement_Level_Cutscores=list(
#									MATHEMATICS=as.character(2009:2018),
#									ELA=as.character(2009:2018)),
#	Transformed_Achievement_Level_Cutscores_gaPlot=list(
#									MATHEMATICS=as.character(2009:2018),
#									ELA=as.character(2009:2018)),
#	Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
#	Projection_Fan_Limits=c(5, 95),
#	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"), ### NOTE Algebra I not equated so no charts possible
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8), ALGEBRA_I=c(8)),
#	Achievement_Level_Labels=list(
#		"Level 1"="Level 1",
#		"Level 2"="Level 2",
#		"Level 3"="Level 3",
#		"Level 4"="Level 4",
#		"Level 5"="Level 5"))

#SGPstateData[["MA_PARCC"]][["SGP_Configuration"]] <-
#	list(
#		sgp.projections.max.forward.progression.grade=8)

#SGPstateData[["MA_PARCC"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### MASSACHUSETTS 2016

#load("Knots_Boundaries/MA_2016_Knots_Boundaries.Rdata")
#load("Knots_Boundaries/MA_2016_Knots_Boundaries_PRE_2014.Rdata")
# SGPstateData[["MA_2016"]] <- SGPstateData[['PARCC']]
#SGPstateData[["MA_2016"]][["Achievement"]][["Knots_Boundaries"]] <- c(MA_2016_Knots_Boundaries_PRE_2014, MA_2016_Knots_Boundaries)

#SGPstateData[["MA_2016"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

#SGPstateData[["MA_2016"]][["Growth"]][["Cutscores"]] <- list(
#	Cuts=c(20, 40, 61, 81),
#	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

#SGPstateData[["MA_2016"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
#SGPstateData[["MA_2016"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Moderate", "High", "Very High")

#SGPstateData[["MA_2016"]][["Assessment_Program_Information"]] <- list(
#	Assessment_Name="Massachusetts Comprehensive Assessment System",
#	Assessment_Abbreviation="MCAS",
#		Organization=list(
#		Name="Massachusetts Department of Elementary and Secondary Education",
#		Abbreviation="ESE",
#		URL="http://www.doe.mass.edu/",
#		Contact="781-338-3000"),
#	Content_Areas=c("Mathematics", "English Language Arts"),
#	Grades_Tested=c(3,4,5,6,7,8,10),
#	Scale_Change=list(MATHEMATICS="2015", ELA="2015"),
#	Test_Season="Spring",
#	Test_Vendor="Measured Progress/Pearson")


### MASSACHUSETTS

load("Knots_Boundaries/MA_2017_Knots_Boundaries.Rdata")
SGPstateData[["MA"]][["Achievement"]][["Knots_Boundaries"]] <- MA_2017_Knots_Boundaries

SGPstateData[["MA"]][["Achievement"]][["Cutscores"]] <- list(
	ELA =list(
		GRADE_3=c(-1.58103875, 0.011395, 1.60382875),
		GRADE_4=c(-1.56114375, 0.030745, 1.62263375),
		GRADE_5=c(-1.65871875, 0.03758, 1.73387875),
		GRADE_6=c(-1.59094, -0.0106625, 1.569615),
		GRADE_7=c(-1.55992625, 0.010925, 1.58177625),
		GRADE_8=c(-1.4563275, 0.051195, 1.5587175),
		GRADE_10=c(-2.770, -1.507, 0.129)),
	MATHEMATICS=list(
		GRADE_3=c(-1.37721625, 0.02747, 1.43215625),
		GRADE_4=c(-1.37875875, 0.054015, 1.48678875),
		GRADE_5=c(-1.55075375, 0.0249325, 1.60061875),
		GRADE_6=c(-1.5180775, -0.00828, 1.5015175),
		GRADE_7=c(-1.41406125, 0.0311575, 1.47637625),
		GRADE_8=c(-1.49566, -0.008435, 1.47879),
		GRADE_10=c(-1.597, -0.784, 0.021))
	)

SGPstateData[["MA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["MA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["MA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["MA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["MA"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Massachusetts Comprehensive Assessment System 2.0",
		Assessment_Abbreviation="MCAS 2.0",
		Organization=list(
			Name="Massachusetts Department of Elementary and Secondary Education",
			Abbreviation="ESE",
			URL="www.doe.mass.edu",
			Contact="781-338-3000"),
		Content_Areas=c("English Language Arts", "Mathematics", "Algebra I"),
		Grades_Tested=c(3,4,5,6,7,8,10),
		Assessment_Years=c("2015", "2016", "2017", "2018"),
		Test_Season="Spring",
		Test_Vendor="Measured Progress/Pearson",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["MA"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=as.character(2009:2018),
									ELA=as.character(2009:2018)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=as.character(2009:2018),
									ELA=as.character(2009:2018)),
	Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
	Projection_Fan_Limits=c(5, 95),
	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"), ### NOTE Algebra I not equated so no charts possible
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), ELA=c(3,4,5,6,7,8,10), ALGEBRA_I=c(8)),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"))

SGPstateData[["MA"]][["SGP_Configuration"]] <- list(
		print.other.gp=TRUE)

#########################################################
### MICHIGAN
#########################################################

load("Knots_Boundaries/MI_Knots_Boundaries.Rdata")
SGPstateData[["MI"]][["Achievement"]][["Knots_Boundaries"]] <- MI_Knots_Boundaries

SGPstateData[["MI"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(322, 336, 371),
		GRADE_4=c(423, 434, 470),
		GRADE_5=c(516, 531, 584),
		GRADE_6=c(614, 629, 675),
		GRADE_7=c(714, 731, 776),
		GRADE_8=c(809, 830, 865),
		GRADE_EOCT=c(1093, 1116, 1138)),
	MATHEMATICS.2014_2015=list(
		GRADE_3=c(1280, 1300, 1322),
		GRADE_4=c(1376, 1400, 1420),
		GRADE_5=c(1479, 1500, 1515),
		GRADE_6=c(1579, 1600, 1615),
		GRADE_7=c(1680, 1700, 1717),
		GRADE_8=c(1781, 1800, 1815),
		GRADE_11=c(2082, 2100, 2118)),
	READING=list(
		GRADE_3=c(301, 324, 364),
		GRADE_4=c(395, 419, 478),
		GRADE_5=c(501, 521, 565),
		GRADE_6=c(602, 619, 653),
		GRADE_7=c(698, 721, 760),
		GRADE_8=c(796, 818, 853),
		GRADE_EOCT=c(1081, 1108, 1141)),
	READING.2014_2015=list(
		GRADE_3=c(1280, 1300, 1318),
		GRADE_4=c(1383, 1400, 1417),
		GRADE_5=c(1482, 1500, 1524),
		GRADE_6=c(1579, 1600, 1624),
		GRADE_7=c(1680, 1700, 1727),
		GRADE_8=c(1777, 1800, 1828),
		GRADE_11=c(2079, 2100, 2122)),
	SCIENCE=list(
		GRADE_5=c(526, 553, 567),
		GRADE_8=c(826, 845, 863)),
	SCIENCE.2014_2015=list(
		GRADE_4=c(1374, 1400, 1410),
		GRADE_7=c(1681, 1700, 1717),
		GRADE_11=c(2079, 2100, 2120)),
	SOCIAL_STUDIES=list(
		GRADE_6=c(593, 625, 649),
		GRADE_9=c(899, 928, 960),
		GRADE_EOCT=c(1097, 1129, 1158)),
	SOCIAL_STUDIES.2014_2015=list(
		GRADE_5=c(1458, 1500, 1530),
		GRADE_8=c(1771, 1800, 1831),
		GRADE_11=c(2069, 2100, 2131)),
	WRITING=list(
		GRADE_4=c(362, 400, 429),
		GRADE_7=c(666, 700, 733),
		GRADE_EOCT=c(1097, 1129, 1158))) ### THIS ROW NEEDS TO BE CHECKED

SGPstateData[["MI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Not Proficient", "Partially Proficient", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["MI"]][["Growth"]][["Levels"]] <- c("Low", "Medium", "High")

SGPstateData[["MI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["MI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["MI"]][["Assessment_Program_Information"]] <- list(
	Assessment_Abbreviation="M-STEP",
	Assessment_Name="Michigan Student Test of Educational Progress",
#	Assessment_Abbreviation="MEAP/MME",
#	Assessment_Name="Michigan Educational Assessment Program",
	Organization=list(
		Name="Michigan Department of Education",
		Abbreviation="MDE",
		URL="http://www.michigan.gov/mde",
		Contact="651-582-8200"),
	Content_Areas=c("Mathematics", "Reading", "Social Studies", "Science"),
#	Content_Areas=c("Mathematics", "Reading", "Writing", "Social Studies", "Science"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Assessment_Years=c("2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"),
	Scale_Change=list(MATHEMATICS="2014_2015", READING="2014_2015", SOCIAL_STUDIES="2014_2015", SCIENCE="2014_2015"),
	Test_Season="Spring",
	Test_Vendor="SBAC/DRC",
	CSEM="CSEM")

SGPstateData[["MI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="MEAP",
		Assessment_Abbreviation.2014_2015="M-STEP",
		Assessment_Name="Michigan Educational Assessment Program",
		Assessment_Name.2014_2015="Michigan Student Test of Educational Progress",
		Achievement_Levels=list(
			Labels=c("Not Proficient", "Partially Proficient", "Proficient", "Advanced"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2014_2015=list(
			Labels=c("Not Proficient", "Partially Proficient", "Proficient", "Advanced"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Not Proficient" = "Not Proficient",
			"Partially Proficient" = "Part Proficient",
			"Proficient" = "Proficient",
			"Advanced" = "Advanced"),
		Achievement_Level_Labels.2014_2015=list(
			"Not Proficient" = "Not Proficient",
			"Partially Proficient" = "Part Proficient",
			"Proficient" = "Proficient",
			"Advanced" = "Advanced"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", SCIENCE="Science", SOCIAL_STUDIES="Social Studies", WRITING="Writing"),
		Content_Areas_Labels.2014_2015=list(MATHEMATICS="Math", READING="ELA", SCIENCE="Science", SOCIAL_STUDIES="Social Studies"),
		Vertical_Scale="No",
		Vertical_Scale.2014_2015="No",
		Grades_Tested=c(3,4,5,6,7,8),
		Grades_Tested.2014_2015=c(3,4,5,6,7,8,11),
		Year="2014_2015"
	)

SGPstateData[["MI"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=paste(2007:2017, 2008:2018, sep="_"),
									READING=paste(2007:2017, 2008:2018, sep="_")),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=paste(2007:2017, 2008:2018, sep="_"),
									READING=paste(2007:2017, 2008:2018, sep="_")),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
#	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", SCIENCE="Science", SOCIAL_STUDIES="Social Studies", WRITING="Writing"),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA", SCIENCE="Science", SOCIAL_STUDIES="Social Studies"),
	Grades_Reported=list(
		MATHEMATICS=c(3,4,5,6,7,8,11),
		READING=c(3,4,5,6,7,8,11),
		SCIENCE=c(4,7,11),
#		SCIENCE=c(5,8,11),
		SOCIAL_STUDIES=c(5,8,11)),
#		SOCIAL_STUDIES=c(6,9,11),
#		WRITING=c(4,7,11)),
	Achievement_Level_Labels=list(
		"Not Proficient" = "Not Proficient",
		"Partially Proficient" = "Part Proficient",
		"Proficient" = "Proficient",
		"Advanced" = "Advanced"))


#########################################################
### MINNESOTA
#########################################################

SGPstateData[["MN"]][["Achievement"]][["Knots_Boundaries"]] <- list(
	MATHEMATICS=list(
		loss.hoss_3=c(301, 399),
		loss.hoss_4=c(401, 499),
		loss.hoss_5=c(501, 599),
		loss.hoss_6=c(601, 699),
		loss.hoss_7=c(701, 799),
		loss.hoss_8=c(801, 899),
		loss.hoss_11=c(1101, 1199)),
	READING=list(
		loss.hoss_3=c(301, 399),
		loss.hoss_4=c(401, 499),
		loss.hoss_5=c(501, 599),
		loss.hoss_6=c(601, 699),
		loss.hoss_7=c(701, 799),
		loss.hoss_8=c(801, 899),
		loss.hoss_10=c(1001, 1099)),
	SCIENCE=list(
		loss.hoss_5=c(501, 599),
		loss.hoss_8=c(801, 899),
		loss.hoss_10=c(1001, 1099)))

SGPstateData[["MN"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(340, 350, 366),
		GRADE_4=c(440, 450, 466),
		GRADE_5=c(540, 550, 563),
		GRADE_6=c(640, 650, 662),
		GRADE_7=c(740, 750, 760),
		GRADE_8=c(840, 850, 861),
		GRADE_11=c(1140, 1150, 1164)),
	READING=list(
		GRADE_3=c(340, 350, 365),
		GRADE_4=c(440, 450, 464),
		GRADE_5=c(540, 550, 565),
		GRADE_6=c(640, 650, 661),
		GRADE_7=c(740, 750, 761),
		GRADE_8=c(840, 850, 860),
		GRADE_10=c(1040, 1050, 1062)),
	SCIENCE=list(
		GRADE_5=c(540, 550, 567),
		GRADE_8=c(840, 850, 860),
		GRADE_10=c(1040, 1050, 1063)))

SGPstateData[["MN"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Does Not Meet", "Partially Meets", "Meets", "Exceeds", "No Score"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["MN"]][["Growth"]][["Levels"]] <- c("Low", "Medium", "High")

SGPstateData[["MN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["MN"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["MN"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Minnesota Comprehensive Assessments",
	Assessment_Abbreviation="MCAs",
	Organization=list(
		Name="Minnesota Department of Education",
		Abbreviation="MDOE",
		URL="www.education.state.mn.us/mde/index.html",
		Contact="651-582-8200"),
		Content_Areas=c("Mathematics", "Reading", "Science"),
		Grades_Tested=c(3,4,5,6,7,8,10,11),
		Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016"),
		Scale_Change=list(MATHEMATICS="2015", READING="2015", SCIENCE="2015"),
		Test_Season="Spring",
		Test_Vendor="Pearson")
#			CSEM=Minnesota_CSEM)

SGPstateData[["MN"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
								MATHEMATICS=as.character(2006:2018),
								READING=as.character(2006:2018)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
								MATHEMATICS=as.character(2006:2018),
								READING=as.character(2006:2018)),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", SCIENCE="Science"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10,11), READING=c(3,4,5,6,7,8,10,11), SCIENCE=c(3,4,5,6,7,8,10,11)),
	Achievement_Level_Labels=list(
		"Does Not Meet" = "Does Not Meet",
		"Partially Meets" = "Partially Meets",
		"Meets" = "Meets",
		"Exceeds" = "Exceeds"))


#########################################################
### MISSISSIPPI
#########################################################

SGPstateData[["MS"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(78.2, 195.8),
			boundaries_4=c(96.8, 195.2),
			boundaries_5=c(88.8, 199.2),
			boundaries_6=c(86.0, 194.0),
			boundaries_7=c(78.0, 198.0),
			boundaries_8=c(95.7, 195.3),
			knots_3=c(142.0, 149.0, 155.0, 161.0),
			knots_4=c(143.0, 149.0, 155.0, 161.0),
			knots_5=c(142.0, 149.0, 154.0, 160.0),
			knots_6=c(142.0, 148.0, 154.0, 160.0),
			knots_7=c(143.0, 149.0, 154.0, 160.0),
			knots_8=c(142.0, 149.0, 154.0, 160.0),
			loss.hoss_3=c(88.0, 186.0),
			loss.hoss_4=c(105.0, 187.0),
			loss.hoss_5=c(98.0, 190.0),
			loss.hoss_6=c(95.0, 185.0),
			loss.hoss_7=c(88.0, 188.0),
			loss.hoss_8=c(104.0, 187.0)),
		READING_LANGUAGE_ARTS=list(
			boundaries_3=c(97.9, 195.1),
			boundaries_4=c(91.7, 203.3),
			boundaries_5=c(97.6, 198.4),
			boundaries_6=c(86.5, 200.5),
			boundaries_7=c(91.7, 203.3),
			boundaries_8=c(95.3, 199.7),
			knots_3=c(140.0, 147.0, 152.0, 159.0),
			knots_4=c(141.0, 148.0, 153.0, 159.0),
			knots_5=c(140.0, 147.0, 152.0, 158.0),
			knots_6=c(140.0, 147.0, 153.0, 159.0),
			knots_7=c(140.0, 147.0, 152.0, 158.0),
			knots_8=c(139.0, 146.0, 152.0, 158.0),
			loss.hoss_3=c(106.0, 187.0),
			loss.hoss_4=c(101.0, 194.0),
			loss.hoss_5=c(106.0, 190.0),
			loss.hoss_6=c(96.0, 191.0),
			loss.hoss_7=c(101.0, 194.0),
			loss.hoss_8=c(104.0, 191.0)),
		SCIENCE=list(
			boundaries_5=c(458.3, 706.7),
			boundaries_8=c(749.6, 1018.4),
			knots_5=c(534.0, 547.0, 561.0, 580.0),
			knots_8=c(833.0, 845.0, 859.0, 876.0),
			loss.hoss_5=c(479.0, 686.0),
			loss.hoss_8=c(772.0, 996.0)),
		SCIENCE.2009_2010=list(
			boundaries_5=c(460.5, 705.4),
			boundaries_8=c(669.5, 1023.5),
			knots_5=c(532.0, 550.0, 563.0, 579.0),
			knots_8=c(836.0, 847.0, 858.0, 875.0),
			loss.hoss_5=c(481.0, 685.0),
			loss.hoss_8=c(699.0, 994.0)),
		SCIENCE.2010_2011=list(
			boundaries_5=c(102.0, 198.0),
			boundaries_8=c(104.0, 200.0),
			knots_5=c(140.0, 148.0, 153.0, 159.0),
			knots_8=c(143.0, 149.0, 155.0, 161.0),
			loss.hoss_5=c(110.0, 190.0),
			loss.hoss_8=c(112.0, 192.0)),
		ALGEBRA=list(
			boundaries_EOCT=c(605.4, 696.6),
			knots_EOCT=c(636.0, 636.0, 640.0, 646.0),
			loss.hoss_EOCT=c(613.0, 689.0)),
		BIOLOGY=list(
			boundaries_EOCT=c(184.3, 516.7),
			knots_EOCT=c(259.0, 275.0, 289.0, 314.0),
			loss.hoss_EOCT=c(212.0, 489.0)),
		BIOLOGY.2010_2011=list(
			boundaries_EOCT=c(604.8, 667.2),
			knots_EOCT=c(621.0, 630.0, 635.0, 641.0),
			loss.hoss_EOCT=c(610.0, 662.0)),
		ENGLISH.2007_2008=list(
			boundaries_EOCT=c(598.9, 672.1),
			knots_EOCT=c(629.0, 633.0, 636.0, 639.0),
			loss.hoss_EOCT=c(605.0, 666.0)),
		ENGLISH.2010_2011=list(
			boundaries_EOCT=c(201.9, 527.1),
			knots_EOCT=c(315.0, 337.8, 358.0, 387.0),
			loss.hoss_EOCT=c(229.0, 500.0)),
		ENGLISH.2011_2012=list(
			boundaries_EOCT=c(598.9, 672.1),
			knots_EOCT=c(629.0, 633.0, 636.0, 639.0),
			loss.hoss_EOCT=c(605.0, 666.0)))

SGPstateData[["MS"]][["Achievement"]][["Cutscores"]] <-
	list(READING_LANGUAGE_ARTS =list(
		GRADE_3=c(138, 150, 162),
		GRADE_4=c(138, 150, 162),
		GRADE_5=c(138, 150, 164),
		GRADE_6=c(137, 150, 166),
		GRADE_7=c(138, 150, 168),
		GRADE_8=c(138, 150, 167)),
	  MATHEMATICS=list(
		GRADE_3=c(138, 150, 165),
		GRADE_4=c(141, 150, 165),
		GRADE_5=c(141, 150, 164),
		GRADE_6=c(142, 150, 164),
		GRADE_7=c(142, 150, 164),
		GRADE_8=c(142, 150, 164)),
	  SCIENCE=list(
		GRADE_5=c(140, 150, 160),
		GRADE_8=c(141, 150, 162)),
	  ALGEBRA=list(
		GRADE_EOCT=c(642, 650, 661)),
	  BIOLOGY=list(
		GRADE_EOCT=c(640, 650, 665)),
	  ENGLISH=list(
		GRADE_EOCT=c(642, 650, 661)),
	  HISTORY=list(
		GRADE_EOCT=c(641, 647, 658)))

SGPstateData[["MS"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Minimal", "Basic", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["MS"]][["Growth"]][["Levels"]] <- c("Very Low", "Low Moderate", "High Moderate", "Very High")

SGPstateData[["MS"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["MS"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(25, 50, 75),
	Labels=list("1st - 24th", "25th - 49th", "50th - 74th", "75th - 99th"))

SGPstateData[["MS"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Mississippi Curriculum Test, 2nd Edition",
	Assessment_Abbreviation="MCT2",
	Organization=list(
		Name="Mississippi Department of Education",
		Abbreviation="MDE",
		URL="www.mde.k12.ms.us",
		Contact="601-359-3513"),
	Content_Areas=c("Reading Language Arts", "Mathematics"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Scale_Change=list(READING="2014_2015", MATHEMATICS="2014_2015"),
	Test_Vendor="Pearson")

SGPstateData[["MS"]][["Student_Report_Information"]] <-
	list(
	Transformed_Achievement_Level_Cutscores=list(
								MATHEMATICS=paste(2007:2017, 2008:2018, sep="_"),
								READING_LANGUAGE_ARTS=paste(2007:2017, 2008:2018, sep="_")),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
								MATHEMATICS=paste(2007:2017, 2008:2018, sep="_"),
								READING_LANGUAGE_ARTS=paste(2007:2017, 2008:2018, sep="_")),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING_LANGUAGE_ARTS=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING_LANGUAGE_ARTS="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING_LANGUAGE_ARTS=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Minimal"="Minimal",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

SGPstateData[["MS"]][["SGP_Configuration"]] <- list(sgp.loss.hoss.adjustment="MS")

SGPstateData[["MS"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MS_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/MS/MS_Baseline_Matrices.Rdata")
#SGPstateData[["MS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- MS_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["MS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING_LANGUAGE_ARTS.BASELINE"]] <- MS_Baseline_Matrices[["READING_LANGUAGE_ARTS.BASELINE"]]
load("SGP_Norm_Group_Preference/MS_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["MS"]][["SGP_Norm_Group_Preference"]] <- MS_SGP_Norm_Group_Preference


#########################################################
### MISSOURI
#########################################################

#load("CSEM/Missouri/Missouri_CSEM.Rdata")
SGPstateData[["MO"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		COMMUNICATION_ARTS=list(
			boundaries_3=c(451.65, 793.35),
			boundaries_4=c(466.50, 823.50),
			boundaries_5=c(481.45, 843.55),
			boundaries_6=c(501.50, 858.50),
			boundaries_7=c(511.50, 868.50),
			boundaries_8=c(526.55, 878.45),
			knots_3=c(612, 633, 649, 668),
			knots_4=c(630, 650, 666, 684),
			knots_5=c(646, 665, 680, 698),
			knots_6=c(646, 665, 679, 695),
			knots_7=c(647, 668, 685, 702),
			knots_8=c(662, 683, 699, 717),
			loss.hoss_3=c(455, 790),
			loss.hoss_4=c(470, 820),
			loss.hoss_5=c(485, 840),
			loss.hoss_6=c(505, 855),
			loss.hoss_7=c(515, 865),
			loss.hoss_8=c(530, 875),
			loss.hoss_11=c(545, 885)),
		MATHEMATICS=list(
			boundaries_3=c(446.70, 783.30),
			boundaries_4=c(461.60, 808.40),
			boundaries_5=c(476.50, 833.50),
			boundaries_6=c(491.50, 848.50),
			boundaries_7=c(506.50, 863.50),
			boundaries_8=c(521.40, 888.60),
			knots_3=c(593, 614, 631, 651),
			knots_4=c(618, 638, 654, 672),
			knots_5=c(631, 654, 673, 693),
			knots_6=c(646, 669, 688, 708),
			knots_7=c(647, 671, 690, 711),
			knots_8=c(669, 693, 711, 732),
			loss.hoss_3=c(450, 780),
			loss.hoss_4=c(465, 805),
			loss.hoss_5=c(480, 830),
			loss.hoss_6=c(495, 845),
			loss.hoss_7=c(510, 860),
			loss.hoss_8=c(525, 885),
			loss.hoss_10=c(555, 910)))

SGPstateData[["MO"]][["Achievement"]][["Cutscores"]] <-
	list(
		COMMUNICATION_ARTS=list(
			GRADE_3=c(592, 648, 673),
			GRADE_4=c(612, 662, 691),
			GRADE_5=c(625, 675, 702),
			GRADE_6=c(631, 676, 704),
			GRADE_7=c(634, 680, 712),
			GRADE_8=c(639, 696, 723),
			GRADE_11=c(679, 725, 753)),
		MATHEMATICS=list(
			GRADE_3=c(568, 628, 667),
			GRADE_4=c(596, 651, 688),
			GRADE_5=c(605, 668, 706),
			GRADE_6=c(628, 681, 721),
			GRADE_7=c(640, 685, 724),
			GRADE_8=c(670, 710, 741),
			GRADE_10=c(695, 738, 785)))

SGPstateData[["MO"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["MO"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["MO"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["MO"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["MO"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Missouri Assessment Program",
		Assessment_Abbreviation="MAP",
		Organization=list(
			Name="Missouri Department of Elementary and Secondary Education",
			Abbreviation="MDESE",
			URL="www.dese.mo.gov/MOSIS/MCDS_pilot-student-growth.html",
			Contact="573-751-4212"),
		Content_Areas=c("Mathematics", "Communication Arts"),
		Grades_Tested=c(3,4,5,6,7,8,10,11),
		Test_Season="Spring",
		Test_Vendor="CTB/McGraw Hill")
#		CSEM=Missouri_CSEM)

SGPstateData[["MO"]][["Student_Report_Information"]] <-
	list(
		Vertical_Scale=list(MATHEMATICS=TRUE, COMMUNICATION_ARTS=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", COMMUNICATION_ARTS="Comm Arts"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), COMMUNICATION_ARTS=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

SGPstateData[["MO"]][["SGP_Configuration"]] <- list(state.multiple.year.summary=5)


#########################################################
### NCSC (National Center and State Collaborative) South Dakota
#########################################################

SGPstateData[["NCSC_SD"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(1236, 1240, 1254),
		GRADE_4=c(1233, 1240, 1251),
		GRADE_5=c(1231, 1240, 1255),
		GRADE_6=c(1234, 1240, 1249),
		GRADE_7=c(1232, 1240, 1254),
		GRADE_8=c(1234, 1240, 1249)),
	MATHEMATICS.2018=list(
		GRADE_3=c(1235, 1242, 1254),
		GRADE_4=c(1232, 1239, 1251),
		GRADE_5=c(1232, 1240, 1253),
		GRADE_6=c(1233, 1239, 1251),
		GRADE_7=c(1234, 1240, 1254),
		GRADE_8=c(1234, 1240, 1251),
		GRADE_11=c(1235, 1240, 1250)),
	ELA=list(
		GRADE_3=c(1234, 1240, 1251),
		GRADE_4=c(1234, 1240, 1258),
		GRADE_5=c(1232, 1240, 1256),
		GRADE_6=c(1231, 1240, 1253),
		GRADE_7=c(1236, 1240, 1255),
		GRADE_8=c(1230, 1240, 1250)),
	ELA.2018=list(
		GRADE_3=c(1234, 1240, 1254),
		GRADE_4=c(1234, 1240, 1259),
		GRADE_5=c(1232, 1240, 1256),
		GRADE_6=c(1231, 1237, 1251),
		GRADE_7=c(1236, 1240, 1255),
		GRADE_8=c(1230, 1238, 1250),
		GRADE_11=c(1236, 1240, 1255)))

SGPstateData[["NCSC_SD"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		ELA=list(
			boundaries_3=c(1191, 1299),
			boundaries_4=c(1191, 1299),
			boundaries_5=c(1191, 1299),
			boundaries_6=c(1191, 1299),
			boundaries_7=c(1191, 1299),
			boundaries_8=c(1191, 1299),
			knots_3=c(1229, 1238, 1246, 1257),
			knots_4=c(1229, 1238.6, 1247, 1256),
			knots_5=c(1233, 1240, 1248.2, 1258),
			knots_6=c(1228, 1236, 1242, 1251),
			knots_7=c(1232, 1238, 1245, 1255),
			knots_8=c(1227.4, 1234, 1241, 1250),
			loss.hoss_3=c(1200, 1290),
			loss.hoss_4=c(1200, 1290),
			loss.hoss_5=c(1200, 1290),
			loss.hoss_6=c(1200, 1290),
			loss.hoss_7=c(1200, 1290),
			loss.hoss_8=c(1200, 1290)),
		MATHEMATICS=list(
			boundaries_3=c(1191, 1299),
			boundaries_4=c(1191, 1299),
			boundaries_5=c(1191, 1299),
			boundaries_6=c(1191, 1299),
			boundaries_7=c(1191, 1299),
			boundaries_8=c(1191, 1299),
			knots_3=c(1232, 1240, 1247, 1259),
			knots_4=c(1230, 1238, 1245, 1255),
			knots_5=c(1236, 1242, 1247, 1256),
			knots_6=c(1232, 1238, 1242, 1254),
			knots_7=c(1235.8, 1239, 1246, 1255.2),
			knots_8=c(1231, 1239, 1243, 1252),
			loss.hoss_3=c(1200, 1290),
			loss.hoss_4=c(1200, 1290),
			loss.hoss_5=c(1200, 1290),
			loss.hoss_6=c(1200, 1290),
			loss.hoss_7=c(1200, 1290),
			loss.hoss_8=c(1200, 1290)))

SGPstateData[["NCSC_SD"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NCSC_SD"]][["Growth"]][["Levels"]] <- c("Much Below Average", "Below Average", "Average", "Above Average", "Much Above Average")

SGPstateData[["NCSC_SD"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NCSC_SD"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(20, 40, 61, 81),
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["NCSC_SD"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Multi-State Alternate Assessment",
	Assessment_Abbreviation="NCSC-MSAA",
	Organization=list(
		Name="South Dakota Department of Education",
		Abbreviation="SDDOE",
		URL="www.doe.sd.gov",
		Contact="DOE.Accountability@state.sd.us"),
	Content_Areas=c("Mathematics", "ELA"),
	Grades_Tested=c(3,4,5,6,7,8),
	Assessment_Years=c("2015", "2016", "2017", "2018"),
	Test_Vendor="Measured Progress",
	Test_Season="Spring")

SGPstateData[["NCSC_SD"]][["Student_Report_Information"]] <-
	list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=as.character(2015:2020),
									ELA=as.character(2015:2020)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=as.character(2015:2020),
									ELA=as.character(2015:2020)),
	Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"),
	Growth_Level_Labels=list(
		"Much Below"="Much Below Average",
		"Below"="Below Average",
		"Typical"="Typical",
		"Above"="Above Average",
		"Much Above"="Much Above Average"))

SGPstateData[["NCSC_SD"]][['SGP_Configuration']] <- list(
			Show_Fan_Growth_Labels=FALSE)


#########################################################
### AUSTRALIA/NAPLAN
#########################################################

SGPstateData[["NAPLAN"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		READING=list(
	  		knots_3=c(352.1, 399.5, 446.9, 493.5),
			knots_5=c(431.5, 476.9, 520.2, 561.4),
			knots_7=c(476.3, 514.8, 548.6, 591.9),
			knots_9=c(516.6, 553.9, 590.4, 630.1),
			boundaries_3=c(-72.340001, 835.340013),
			boundaries_5=c(-6.169996, 918.669973),
			boundaries_7=c(81.870006, 903.029973),
			boundaries_9=c(115.189993, 969.710001),
			loss.hoss_3=c(186.4, 898.5),
			loss.hoss_5=c(150.3, 834.6),
			loss.hoss_7=c(70.9, 841.6),
			loss.hoss_9=c(3.3, 759.7)),
	 	WRITING=list(
	  		knots_3=c(371.1, 402.9, 440.9, 480.0),
			knots_5=c(434.2, 480.0, 509.4, 546.2),
			knots_7=c(464.9, 509.4, 538.5, 594.5),
			knots_9=c(494.8, 538.5, 582.5, 639.1),
			boundaries_3=c(23.450001, 811.249973),
			boundaries_5=c(15.439997, 899.360014),
			boundaries_7=c(10.189997, 957.110014),
			boundaries_9=c(10.189997, 957.110014),
			loss.hoss_3=c(89.1, 878.2),
			loss.hoss_5=c(89.1, 878.2),
			loss.hoss_7=c(89.1, 825.7),
			loss.hoss_9=c(89.1, 745.6)),
		NUMERACY=list(
	  		knots_3=c(351.2, 389.6, 427.8, 472.0),
			knots_5=c(438.3, 473.1, 507.6, 551.0),
			knots_7=c(481.1, 515.0, 550.8, 597.0),
			knots_9=c(524.6, 558.3, 592.6, 636.8),
			boundaries_3=c(-76.329999, 839.629987),
			boundaries_5=c(45.440001, 901.760027),
			boundaries_7=c(100.580008, 988.819986),
			boundaries_9=c(124.050005, 1021.049986),
			loss.hoss_3=c(198.8, 946.3),
			loss.hoss_5=c(174.6, 914.8),
			loss.hoss_7=c(116.8, 830.4),
			loss.hoss_9=c(0.0, 763.3)),
		GRAMMAR=list(
	  		knots_3=c(357.3, 408.8, 453.7, 495.9),
			knots_5=c(437.1, 484.5, 522.4, 573.7),
			knots_7=c(466.8, 503.3, 542.6, 585.0),
			knots_9=c(506.5, 546.5, 578.1, 625.8),
			boundaries_3=c(0.0, 758.120013),
			boundaries_5=c(0.0, 917.259973),
			boundaries_7=c(2.250000, 971.250000),
			boundaries_9=c(94.190005, 921.110013),
			loss.hoss_3=c(163.1, 852.2),
			loss.hoss_5=c(83.0, 890.5),
			loss.hoss_7=c(52.0, 838.6),
			loss.hoss_9=c(0.0, 689.2)),
		SPELLING=list(
	  		knots_3=c(350.8, 392.2, 432.9, 475.7),
			knots_5=c(432.6, 469.2, 507.2, 548.9),
			knots_7=c(472.9, 517.8, 552.0, 591.0),
			knots_9=c(508.1, 553.0, 589.7, 634.5),
			boundaries_3=c(142.680003, 660.120000),
			boundaries_5=c(216.870013, 712.829999),
			boundaries_7=c(255.899988, 842.6999880),
			boundaries_9=c(287.219989, 882.179974),
			loss.hoss_3=c(336.8, 832.6),
			loss.hoss_5=c(304.8, 793.8),
			loss.hoss_7=c(258.2, 671.5),
			loss.hoss_9=c(185.8, 617.0)))

SGPstateData[["NAPLAN"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(270, 322),
			GRADE_5=c(374, 426),
			GRADE_7=c(426, 478),
			GRADE_9=c(478, 530)),
			WRITING=list(
			GRADE_3=c(270, 322),
			GRADE_5=c(374, 426),
			GRADE_7=c(426, 478),
			GRADE_9=c(478, 530)),
		NUMERACY=list(GRADE_3=c(270, 322),
			GRADE_5=c(374, 426),
			GRADE_7=c(426, 478),
			GRADE_9=c(478, 530)),
		GRAMMAR=list(GRADE_3=c(270, 322),
			GRADE_5=c(374, 426),
			GRADE_7=c(426, 478),
			GRADE_9=c(478, 530)),
		SPELLING=list(GRADE_3=c(270, 322),
			GRADE_5=c(374, 426),
			GRADE_7=c(426, 478),
			GRADE_9=c(478, 530)))

SGPstateData[["NAPLAN"]][["Achievement"]][["Levels"]] <-
	list(
	 	Labels=c("Below Nat Min Std", "At Nat Min Std", "Above Nat Min Std"),
		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NAPLAN"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Typical", "High", "Very High")
SGPstateData[["NAPLAN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["NAPLAN"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(20, 40, 60, 80), Labels=list("1st-19th", "20th-39th", "40th-59th", "60th-79th", "80th-99th"))

SGPstateData[["NAPLAN"]][["Assessment_Program_Information"]][["Grades_Tested"]] <- c(3, 5, 7, 9)

SGPstateData[["NAPLAN"]][["Student_Report_Information"]] <-
	list(
		Content_Areas_Labels=list(NUMERACY="Numeracy", READING="Reading", WRITING="Writing", GRAMMAR="Grammar", SPELLING="Spelling"),
		Grades_Reported=list(NUMERACY=c(3,5,7,9), READING=c(3,5,7,9), WRITING=c(3,5,7,9), GRAMMAR=c(3,5,7,9), SPELLING=c(3,5,7,9)),
		Achievement_Level_Labels=list(
			"Below Standard"="Below Nat Min Std",
			"At Standard"="At Nat Min Std",
			"Above Standard"="Above Nat Min Std"))


#########################################################
### NEBRASKA
#########################################################

load("Knots_Boundaries/NE_Knots_Boundaries.Rdata")
SGPstateData[["NE"]][["Achievement"]][["Knots_Boundaries"]] <- NE_Knots_Boundaries

SGPstateData[["NE"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(85,135),
			GRADE_4=c(85,135),
			GRADE_5=c(85,135),
			GRADE_6=c(85,135),
			GRADE_7=c(85,135),
			GRADE_8=c(85,135),
			GRADE_11=c(85,135)),
		READING=list(
			GRADE_3=c(85,135),
			GRADE_4=c(85,135),
			GRADE_5=c(85,135),
			GRADE_6=c(85,135),
			GRADE_7=c(85,135),
			GRADE_8=c(85,135),
			GRADE_11=c(85,135)))

SGPstateData[["NE"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Below the Standards", "Meets the Standards", "Exceeds the Standards"),
		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NE"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NE"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NE"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NE"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Nebraska State Accountability: NeSA",
	Assessment_Abbreviation="NeSA",
	Organization=list(
		Name="Nebraska Department of Education",
		Abbreviation="NDOE",
		URL="www.education.ne.gov",
		Contact="402-471-2295"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Spring",
	Test_Vendor="DRC")

SGPstateData[["NE"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
										MATHEMATICS=as.character(2009:2018),
										READING=as.character(2009:2018)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
										MATHEMATICS=as.character(2009:2018),
										READING=as.character(2009:2018)),
		Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Below"="Below the Standards",
			"Meets"="Meets the Standards",
			"Exceeds"="Exceeds the Standards"))

SGPstateData[["NE"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NE_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

#load("Baseline_Coefficient_Matrices/NE/NE_Baseline_Matrices.Rdata")
#SGPstateData[["NE"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NE_Baseline_Matrices[["MATHEMATICS.BASELINE"]]


#########################################################
### NEVADA
#########################################################

#load("CSEM/Nevada/Nevada_CSEM.Rdata")

load("Knots_Boundaries/NV_Knots_Boundaries.Rdata")
SGPstateData[["NV"]][["Achievement"]][["Knots_Boundaries"]] <- NV_Knots_Boundaries
#SGPstateData[["NV"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		READING=list(
#			knots_3=c(256, 296, 327, 357),
#			knots_4=c(246, 297, 335, 375),
#			knots_5=c(237, 281, 313, 349),
#			knots_6=c(241, 297, 342, 382),
#			knots_7=c(258, 310, 350, 387),
#			knots_8=c(256, 298, 328, 363),
#			boundaries_3=c(60, 540),
#			boundaries_4=c(60, 540),
#			boundaries_5=c(60, 540),
#			boundaries_6=c(60, 540),
#			boundaries_7=c(60, 540),
#			boundaries_8=c(60, 540),
#			loss.hoss_3=c(100, 500),
#			loss.hoss_4=c(100, 500),
#			loss.hoss_5=c(100, 500),
#			loss.hoss_6=c(100, 500),
#			loss.hoss_7=c(100, 500),
#			loss.hoss_8=c(100, 500)),
#		MATHEMATICS=list(
#			knots_3=c(254, 295, 328, 367),
#			knots_4=c(260, 308, 342, 384),
#			knots_5=c(257, 300, 335, 376),
#			knots_6=c(229, 293, 342, 398),
#			knots_7=c(226, 289, 337, 397),
#			knots_8=c(219, 276, 320, 373),
#			boundaries_3=c(60, 540),
#			boundaries_4=c(60, 540),
#			boundaries_5=c(60, 540),
#			boundaries_6=c(60, 540),
#			boundaries_7=c(60, 540),
#			boundaries_8=c(60, 540),
#			loss.hoss_3=c(100, 500),
#			loss.hoss_4=c(100, 500),
#			loss.hoss_5=c(100, 500),
#			loss.hoss_6=c(100, 500),
#			loss.hoss_7=c(100, 500),
#			loss.hoss_8=c(100, 500)))

SGPstateData[["NV"]][["Achievement"]][["Cutscores"]] <-
		list(
			MATHEMATICS=list(
				GRADE_3=c(2381, 2436, 2501),
				GRADE_4=c(2411, 2485, 2549),
				GRADE_5=c(2455, 2528, 2579),
				GRADE_6=c(2473, 2552, 2610),
				GRADE_7=c(2484, 2567, 2635),
				GRADE_8=c(2504, 2586, 2653)),
			ELA=list(
				GRADE_3=c(2367, 2432, 2490),
				GRADE_4=c(2416, 2473, 2533),
				GRADE_5=c(2442, 2502, 2582),
				GRADE_6=c(2457, 2531, 2618),
				GRADE_7=c(2479, 2552, 2649),
				GRADE_8=c(2487, 2567, 2668)))
#	list(
#		MATHEMATICS=list(
#			GRADE_3=c(200, 300, 354),
#			GRADE_4=c(200, 300, 375),
#			GRADE_5=c(200, 300, 380),
#			GRADE_6=c(200, 300, 404),
#			GRADE_7=c(200, 300, 412),
#			GRADE_8=c(200, 300, 418),
#			GRADE_10=c(200, 300, 400)),
#		MATHEMATICS.2009_2010=list(
#			GRADE_3=c(250, 300, 349),
#			GRADE_4=c(250, 300, 376),
#			GRADE_5=c(250, 300, 474),
#			GRADE_6=c(183, 255, 406),
#			GRADE_7=c(210, 267, 389),
#			GRADE_8=c(201, 267, 375),
#			GRADE_10=c(105, 242, 323)),
#		MATHEMATICS.2012_2013=list(
#			GRADE_3=c(250, 300, 349),
#			GRADE_4=c(250, 300, 376),
#			GRADE_5=c(250, 300, 474),
#			GRADE_6=c(250, 300, 406),
#			GRADE_7=c(250, 300, 389),
#			GRADE_8=c(250, 300, 375),
#			GRADE_10=c(250, 300, 344)),
#		MATHEMATICS.2013_2014=list(
#			GRADE_3=c(250, 300, 349),
#			GRADE_4=c(250, 300, 376),
#			GRADE_5=c(250, 300, 474),
#			GRADE_6=c(250, 300, 406),
#			GRADE_7=c(250, 300, 389),
#			GRADE_8=c(250, 300, 375),
#			GRADE_10=c(105, 242, 323)),
#		READING=list(
#			GRADE_3=c(200, 300, 356),
#			GRADE_4=c(200, 300, 380),
#			GRADE_5=c(200, 300, 385),
#			GRADE_6=c(200, 300, 389),
#			GRADE_7=c(200, 300, 397),
#			GRADE_8=c(200, 300, 373),
#			GRADE_10=c(200, 251, 400)),
#		READING.2010_2011=list(
#			GRADE_3=c(250, 300, 361),
#			GRADE_4=c(250, 300, 379),
#			GRADE_5=c(250, 300, 374),
#			GRADE_6=c(250, 300, 367),
#			GRADE_7=c(250, 300, 369),
#			GRADE_8=c(250, 300, 343),
#			GRADE_10=c(250, 300, 436)))

SGPstateData[["NV"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Minimal Understanding", "Partial Understanding", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NV"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NV"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NV"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(40, 61),
		Labels=list("1st - 39th", "40th - 60th", "61st - 99th"))

SGPstateData[["NV"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Smarter Balanced Assessment",
#		Assessment_Name="Nevada Proficiency Examination Program",
		Assessment_Abbreviation="SBAC",
#		Assessment_Abbreviation="CRT",
		Organization=list(
			Name="Nevada Department of Education",
			Abbreviation="NDE",
			URL="www.doe.nv.gov",
			Contact="adaminfo@doe.nv.gov"),
		Content_Areas=c("Mathematics", "ELA"),
#		Content_Areas=c("Mathematics", "Reading"),
#		Scale_Change=list(MATHEMATICS="2015", READING="2015"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("2016", "2017"),
		Test_Vendor="DRC",
#		Test_Vendor="Measured Progress",
		Test_Season="Spring")

SGPstateData[["NV"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
										MATHEMATICS=as.character(2008:2014),
										READING=as.character(2008:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
										MATHEMATICS=as.character(2008:2014),
										READING=as.character(2008:2014)),
		Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
#		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Minimal"="Minimal Understanding",
			"Partial"="Partial Understanding",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

SGPstateData[["NV"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=4,
	max.order.for.projection=4)

#load("Baseline_Coefficient_Matrices/NV/NV_Baseline_Matrices.Rdata")
#SGPstateData[["NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NV_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- NV_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["NV"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NV_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### NEW HAMPSHIRE
#########################################################

load("Knots_Boundaries/NH_SBAC_Knots_Boundaries.Rdata")
load("Knots_Boundaries/NH_Knots_Boundaries.Rdata")

SGPstateData[["NH"]][["Achievement"]][["Knots_Boundaries"]] <-
	c(NH_SBAC_Knots_Boundaries, # SBAC Knots/Boundaries beginning in 2014_2015
	  NH_Knots_Boundaries, # Knots/Boundaries beginning in 2017_2018
	list(
		READING=list(
			knots_3=c(335, 342, 348, 355),
			knots_4=c(434, 442, 447, 455),
			knots_5=c(535, 542, 548, 555),
			knots_6=c(634, 642, 648, 655),
			knots_7=c(733, 742, 749, 756),
			knots_8=c(833, 842, 849, 856),
			boundaries_3=c(292, 388),
			boundaries_4=c(392, 488),
			boundaries_5=c(492, 588),
			boundaries_6=c(592, 688),
			boundaries_7=c(692, 788),
			boundaries_8=c(792, 888),
			loss.hoss_3=c(300, 380),
			loss.hoss_4=c(400, 480),
			loss.hoss_5=c(500, 580),
			loss.hoss_6=c(600, 680),
			loss.hoss_7=c(700, 780),
			loss.hoss_8=c(800, 880),
			loss.hoss_11=c(1100, 1180)),
		MATHEMATICS=list(
			knots_3=c(332, 339, 345, 352),
			knots_4=c(430, 439, 446, 452),
			knots_5=c(532, 539, 545, 552),
			knots_6=c(631, 638, 644, 651),
			knots_7=c(731, 737, 743, 749),
			knots_8=c(831, 837, 843, 849),
			boundaries_3=c(292, 388),
			boundaries_4=c(392, 488),
			boundaries_5=c(492, 588),
			boundaries_6=c(592, 688),
			boundaries_7=c(692, 788),
			boundaries_8=c(792, 888),
			loss.hoss_3=c(300, 380),
			loss.hoss_4=c(400, 480),
			loss.hoss_5=c(500, 580),
			loss.hoss_6=c(600, 680),
			loss.hoss_7=c(700, 780),
			loss.hoss_8=c(800, 880),
			loss.hoss_11=c(1100, 1180))))

SGPstateData[["NH"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(332, 340, 353),
			GRADE_4=c(431, 440, 455),
			GRADE_5=c(533, 540, 554),
			GRADE_6=c(633, 640, 653),
			GRADE_7=c(734, 740, 752),
			GRADE_8=c(834, 840, 852),
			GRADE_11=c(1134, 1140, 1152)),
		MATHEMATICS.2014_2015=list(
			GRADE_3=c(2381, 2436, 2501),
			GRADE_4=c(2411, 2485, 2549),
			GRADE_5=c(2455, 2528, 2579),
			GRADE_6=c(2473, 2552, 2610),
			GRADE_7=c(2484, 2567, 2635),
			GRADE_8=c(2504, 2586, 2653)),
		MATHEMATICS.2017_2018=list(
			GRADE_3=c(410, 431, 455),
			GRADE_4=c(431, 460, 492),
			GRADE_5=c(460, 495, 522),
			GRADE_6=c(479, 518, 556),
			GRADE_7=c(507, 552, 587),
			GRADE_8=c(539, 591, 625)),
		READING=list(
			GRADE_3=c(331, 340, 357),
			GRADE_4=c(431, 440, 456),
			GRADE_5=c(530, 540, 556),
			GRADE_6=c(629, 640, 659),
			GRADE_7=c(729, 740, 760),
			GRADE_8=c(828, 840, 859),
			GRADE_11=c(1130, 1140, 1154)),
		READING.2014_2015=list(
			GRADE_3=c(2367, 2432, 2490),
			GRADE_4=c(2416, 2473, 2533),
			GRADE_5=c(2442, 2502, 2582),
			GRADE_6=c(2457, 2531, 2618),
			GRADE_7=c(2479, 2552, 2649),
			GRADE_8=c(2487, 2567, 2668)),
		READING.2017_2018=list(
			GRADE_3=c(557, 587, 616),
			GRADE_4=c(580, 605, 635),
			GRADE_5=c(594, 621, 664),
			GRADE_6=c(605, 642, 688),
			GRADE_7=c(608, 644, 697),
			GRADE_8=c(625, 661, 711)))

# SGPstateData[["NH"]][["Achievement"]][["Levels"]] <-
# 	list(
# 		Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
# 		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NH"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Below Proficient", "Approaching Proficient", "Proficient", "Above Proficient"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NH"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NH"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NH"]][["Growth"]][["Cutscores"]] <- list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NH"]][["Assessment_Program_Information"]] <- list(
		Assessment_Name="New Hampshire Statewide Assessment System",
		Assessment_Abbreviation="NH SAS",
#		Assessment_Name="Smarter Balanced Assessment",
#		Assessment_Abbreviation="SBA",
		Organization=list(
		Name="New Hampshire Department of Education",
		Abbreviation="NHDOE",
		URL="www.education.nh.gov",
		Contact="603-271-3494"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016", "2016_2017", "2017_2018"),
#		Scale_Change=list(MATHEMATICS="2014_2015", READING="2014_2015"),
		Scale_Change=list(MATHEMATICS="2017_2018", READING="2017_2018"),
		Test_Season="Spring",
		Test_Vendor="AIR")
#		Test_Vendor="SBAC")
		# Test_Season="Fall",
		# Test_Vendor="Measured Progress")
		# CSEM=NECAP_CSEM)

SGPstateData[["NH"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- list(
#	Assessment_Abbreviation="NECAP",
#	Assessment_Abbreviation.2014_2015="SBA",
	Assessment_Abbreviation="SBA",
	Assessment_Abbreviation.2017_2018="NH SAS",
#	Assessment_Name="New Hampshire NECAP",
#	Assessment_Name.2014_2015="Smarter Balanced Assessment",
	Assessment_Name="Smarter Balanced Assessment",
	Assessment_Name.2017_2018="New Hampshire Statewide Assessment System",
#	Achievement_Levels=list(
#		Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#	Achievement_Levels.2014_2015=list(
#		Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels=list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels.2017_2018=list(
		Labels=c("Below Proficient", "Approaching Proficient", "Proficient", "Above Proficient"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#	Achievement_Level_Labels=list(
#		"Below Proficient"="Substantially Below Proficient",
#		"Part Proficient"="Partially Proficient",
#		"Proficient"="Proficient",
#		"Distinction"="Proficient with Distinction"),
#	Achievement_Level_Labels.2014_2015=list(
#		"Level 1"="Level 1",
#		"Level 2"="Level 2",
#		"Level 3"="Level 3",
#		"Level 4"="Level 4"),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"),
	Achievement_Level_Labels=list(
		"Below Proficient"="Below Proficient",
		"Approaching Proficient"="Approaching Proficient",
		"Proficient"="Proficient",
		"Above Proficient"="Above Proficient"),
#	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
#	Content_Areas_Labels.2014_2015=list(MATHEMATICS="Math", READING="ELA"),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
	Content_Areas_Labels.2017_2018=list(MATHEMATICS="Math", READING="ELA"),
#	Vertical_Scale="No",
#	Vertical_Scale.2014_2015="Yes",
	Vertical_Scale="Yes",
	Vertical_Scale.2017_2018="Yes",
#	Grades_Tested=c(3,4,5,6,7,8,11),
#	Grades_Tested.2014_2015=c(3,4,5,6,7,8),
	Grades_Tested=c(3,4,5,6,7,8),
	Grades_Tested.2017_2018=c(3,4,5,6,7,8),
#	Year="2014_2015")
	Year="2017_2018")


SGPstateData[["NH"]][["Student_Report_Information"]] <- list(
#		Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=paste(2007:2013, 2008:2014, sep="_"), READING=paste(2007:2013, 2008:2014, sep="_")),
#		Transformed_Achievement_Level_Cutscores_gaPlot=list( MATHEMATICS=paste(2007:2013, 2008:2014, sep="_"), READING=paste(2007:2013, 2008:2014, sep="_")),
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Below Proficient"="Below Proficient",
			"Approaching Proficient"="Approaching Proficient",
			"Proficient"="Proficient",
			"Above Proficient"="Above Proficient"))

SGPstateData[["NH"]][["SGP_Configuration"]] <- list(
#		sgp.loss.hoss.adjustment="NH",
		state.multiple.year.summary=5,
		print.other.gp=TRUE,
		max.order.for.percentile=2,
		sgp.target.scale.scores.merge="1_year_lagged_current")

SGPstateData[["NH"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NH_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/NH/NH_Baseline_Matrices.Rdata")
#SGPstateData[["NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NH_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- NH_Baseline_Matrices[["READING.BASELINE"]]


#########################################################
### NEW HAVEN
#########################################################

SGPstateData[["NEW_HAVEN"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(381, 401, 425, 478),
			GRADE_4=c(412, 428, 449, 506),
			GRADE_5=c(434, 448, 466, 524),
			GRADE_6=c(440, 456, 475, 539),
			GRADE_7=c(454, 470, 487, 549),
			GRADE_8=c(466, 481, 500, 561)),
		WRITING=list(
			GRADE_3=c(188, 212, 240, 287),
			GRADE_4=c(185, 209, 237, 281),
			GRADE_5=c(186, 209, 238, 284),
			GRADE_6=c(185, 211, 237, 284),
			GRADE_7=c(192, 213, 236, 270),
			GRADE_8=c(189, 212, 236, 283)),
		MATHEMATICS=list(
			GRADE_3=c(395, 417, 450, 484),
			GRADE_4=c(430, 451, 484, 529),
			GRADE_5=c(451, 476, 506, 556),
			GRADE_6=c(466, 493, 526, 572),
			GRADE_7=c(481, 510, 544, 593),
			GRADE_8=c(497, 523, 558, 607)))

SGPstateData[["NEW_HAVEN"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			boundaries_3=c(233.23, 515.77),
			boundaries_4=c(271.12, 564.88),
			boundaries_5=c(303.06, 602.94),
			boundaries_6=c(332.99, 640.01),
			boundaries_7=c(368.11, 662.89),
			boundaries_8=c(389.12, 682.88),
			knots_3=c(391, 418, 442, 467),
			knots_4=c(429, 455, 477, 503),
			knots_5=c(453, 479, 502, 533),
			knots_6=c(471, 500, 524, 551),
			knots_7=c(486, 511, 534, 563),
			knots_8=c(498, 523, 546, 574),
			loss.hoss_3=c(200, 700),
			loss.hoss_4=c(200, 700),
			loss.hoss_5=c(200, 700),
			loss.hoss_6=c(200, 700),
			loss.hoss_7=c(200, 700),
			loss.hoss_8=c(200, 700)),
		READING=list(
			boundaries_3=c(230.87, 550.13),
			boundaries_4=c(279.27, 557.73),
			boundaries_5=c(302.22, 585.78),
			boundaries_6=c(315.15, 605.85),
			boundaries_7=c(322.08, 619.92),
			boundaries_8=c(328.15, 618.85),
			knots_3=c(346, 373, 395, 425),
			knots_4=c(381, 407, 428, 456),
			knots_5=c(405, 432, 455, 482),
			knots_6=c(423, 449, 473, 502),
			knots_7=c(439, 465, 489, 517),
			knots_8=c(450, 473, 495, 523),
			loss.hoss_3=c(200, 650),
			loss.hoss_4=c(200, 650),
			loss.hoss_5=c(200, 650),
			loss.hoss_6=c(200, 650),
			loss.hoss_7=c(200, 650),
			loss.hoss_8=c(200, 650)),
		WRITING=list(
			boundaries_3=c(97, 403),
			boundaries_4=c(97, 403),
			boundaries_5=c(97, 403),
			boundaries_6=c(97, 403),
			boundaries_7=c(97, 403),
			boundaries_8=c(97, 403),
			knots_3=c(186, 212, 231, 256),
			knots_4=c(192, 215, 233, 254),
			knots_5=c(195, 217, 234, 255),
			knots_6=c(196, 216, 233, 254),
			knots_7=c(192, 211, 227, 244),
			knots_8=c(191, 211, 228, 248),
			loss.hoss_3=c(100, 400),
			loss.hoss_4=c(100, 400),
			loss.hoss_5=c(100, 400),
			loss.hoss_6=c(100, 400),
			loss.hoss_7=c(100, 400),
			loss.hoss_8=c(100, 400)))

SGPstateData[["NEW_HAVEN"]][["Achievement"]][["Levels"]] <-
	list(
	Labels=c("Below Basic", "Basic", "Proficient", "Goal", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient"))

SGPstateData[["NEW_HAVEN"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NEW_HAVEN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NEW_HAVEN"]][["Growth"]][["Cutscores"]] <-
	list(
	Cuts=c(35, 66),
	Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NEW_HAVEN"]][["Assessment_Program_Information"]] <-
	list(
	Assessment_Name="Connecticut Mastery Test",
	Assessment_Abbreviation="CMT",
	Organization=list(
		Name="New Haven Public Schools",
		Abbreviation="NHPS",
		URL="www.nhps.net",
		Contact="203-946-5771"),
	Content_Areas=c("Mathematics", "Reading", "Writing"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Test_Vendor="Measurement Incorporated")

SGPstateData[["NEW_HAVEN"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(WRITING=as.character(2008:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(WRITING=as.character(2008:2014)),
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE, WRITING=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", WRITING="Writing"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), WRITING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Goal"="Goal",
			"Advanced"="Advanced"))


#########################################################
### NEW JERSEY
#########################################################

### NEW JERSEY (Original meta-data including NJASK/PARCC)

load("Knots_Boundaries/NJ_Knots_Boundaries.Rdata")

SGPstateData[["NJ_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <- NJ_Knots_Boundaries

#SGPstateData[["NJ_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		ELA=list(
#			boundaries_3=c(80, 320),
#			boundaries_4=c(80, 320),
#			boundaries_5=c(80, 320),
#			boundaries_6=c(80, 320),
#			boundaries_7=c(80, 320),
#			boundaries_8=c(80, 320),
#			knots_3=c(193, 209, 221, 234),
#			knots_4=c(189, 207, 220, 233),
#			knots_5=c(192, 207, 219, 234),
#			knots_6=c(188, 204, 217, 231),
#			knots_7=c(193, 209, 222, 239),
#			knots_8=c(201, 216, 228, 243),
#			loss.hoss_3=c(100, 300),
#			loss.hoss_4=c(100, 300),
#			loss.hoss_5=c(100, 300),
#			loss.hoss_6=c(100, 300),
#			loss.hoss_7=c(100, 300),
#			loss.hoss_8=c(100, 300)),
#		MATHEMATICS=list(
#			boundaries_3=c(80, 320),
#			boundaries_4=c(80, 320),
#			boundaries_5=c(80, 320),
#			boundaries_6=c(80, 320),
#			boundaries_7=c(80, 320),
#			boundaries_8=c(80, 320),
#			knots_3=c(202, 226, 244, 259),
#			knots_4=c(200, 224, 246, 265),
#			knots_5=c(197, 220, 238, 259),
#			knots_6=c(189, 210, 227, 250),
#			knots_7=c(181, 202, 221, 246),
#			knots_8=c(181, 209, 231, 258),
#			loss.hoss_3=c(100, 300),
#			loss.hoss_4=c(100, 300),
#			loss.hoss_5=c(100, 300),
#			loss.hoss_6=c(100, 300),
#			loss.hoss_7=c(100, 300),
#			loss.hoss_8=c(100, 300)))

SGPstateData[["NJ_ORIGINAL"]][["Achievement"]][["Cutscores"]] <-
	list(
		ELA =list(
			GRADE_3=c(200, 250),
			GRADE_4=c(200, 250),
			GRADE_5=c(200, 250),
			GRADE_6=c(200, 250),
			GRADE_7=c(200, 250),
			GRADE_8=c(200, 250)),
		MATHEMATICS=list(
			GRADE_3=c(200, 250),
			GRADE_4=c(200, 250),
			GRADE_5=c(200, 250),
			GRADE_6=c(200, 250),
			GRADE_7=c(200, 250),
			GRADE_8=c(200, 250)),
		ELA.2015=list(
	        GRADE_3=c(-0.9769, -0.2867, 0.4034, 2.0652),
	        GRADE_4=c(-1.3276, -0.5156, 0.2965, 1.6011),
	        GRADE_5=c(-1.3768, -0.5285, 0.3199, 1.9854),
	        GRADE_6=c(-1.3649, -0.4946, 0.3757, 1.7686),
	        GRADE_7=c(-1.1752, -0.4374, 0.3004, 1.3373),
	        GRADE_8=c(-1.1431, -0.4148, 0.3134, 1.5827),
	        GRADE_9=c(-1.0779, -0.3481, 0.3817, 1.5891),
	        GRADE_10=c(-0.8354, -0.2465, 0.3423, 1.3758),
	        GRADE_11=c(-1.0889, -0.4065, 0.2759, 1.4112)),
	    ELA.2016=list(
	        GRADE_3=c(-0.9648, -0.2840, 0.3968, 2.0360),
	        GRADE_4=c(-1.3004, -0.5079, 0.2846, 1.5578),
	        GRADE_5=c(-1.3411, -0.4924, 0.3563, 2.0224),
	        GRADE_6=c(-1.3656, -0.4827, 0.4002, 1.8133),
	        GRADE_7=c(-1.2488, -0.5117, 0.2254, 1.2614),
	        GRADE_8=c(-1.2730, -0.5402, 0.1925, 1.4696),
	        GRADE_9=c(-1.1635, -0.4329, 0.2977, 1.5065),
	        GRADE_10=c(-0.8909, -0.3112, 0.2684, 1.2858),
	        GRADE_11=c(-1.1017, -0.3859, 0.3298, 1.5206)),
		MATHEMATICS.2015=list(
	        GRADE_3=c(-1.2403, -0.4553, 0.3296, 1.5902),
	        GRADE_4=c(-1.2763, -0.4305, 0.4153, 1.9791),
	        GRADE_5=c(-1.2730, -0.4103, 0.4523, 1.8156),
	        GRADE_6=c(-1.2700, -0.3977, 0.4747, 1.8136),
	        GRADE_7=c(-1.3483, -0.3747, 0.5989, 2.0131),
	        GRADE_8=c(-0.8417, -0.0968, 0.6481, 2.1770)),
	    MATHEMATICS.2016=list(
	        GRADE_3=c(-1.4141, -0.6356, 0.1429, 1.3931),
	        GRADE_4=c(-1.384, -0.5484, 0.2873, 1.8323),
	        GRADE_5=c(-1.4571, -0.5959, 0.2653, 1.6262),
	        GRADE_6=c(-1.3829, -0.4948, 0.3935, 1.7567),
	        GRADE_7=c(-1.4464, -0.4505, 0.5453, 1.9919),
	        GRADE_8=c(-0.8851, -0.1264, 0.6323, 2.1896)),
		ALGEBRA_I=list(
	        GRADE_EOCT=c(-1.1045, -0.2802, 0.5442, 2.3716)),
	    ALGEBRA_I.2016=list(
	        GRADE_EOCT=c(-1.1781, -0.3853, 0.4075, 2.1651)),
	    ALGEBRA_II=list(
	        GRADE_EOCT=c(-0.5384, 0.1635, 0.8654, 2.4823)),
	    ALGEBRA_II.2016 =list(
	        GRADE_EOCT=c(-0.5759, 0.0860, 0.7480, 2.2728)),
	    GEOMETRY=list(
	        GRADE_EOCT=c(-1.2478, -0.2558, 0.7362, 2.0459)),
	    GEOMETRY.2016=list(
	        GRADE_EOCT=c(-1.3013, -0.3389, 0.6235, 1.8940)))

SGPstateData[["NJ_ORIGINAL"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["NJ_ORIGINAL"]][["Achievement"]][["Levels"]] <-
#	list(
#	Labels=c("Partially Proficient", "Proficient", "Advanced Proficient"),
#	Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NJ_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NJ_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NJ_ORIGINAL"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NJ_ORIGINAL"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
	#	Assessment_Name="New Jersey Assessment of Skills and Knowledge",
		Assessment_Abbreviation="PARCC",
	#	Assessment_Abbreviation="NJASK",
		Organization=list(
			Name="New Jersey Department of Education",
			Abbreviation="NJDOE",
			URL="www.state.nj.us/education",
			Contact="877-900-6960"),
		Content_Areas=c("English Language Arts", "Mathematics", "Algebra I", "Geometry", "Algebra II"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Scale_Change=list(ELA="2015", MATHEMATICS="2015", ALGEBRA_I="2015", GEOMETRY="2015", ALGEBRA_II="2015"),
		Test_Season="Spring",
		Test_Vendor="PARCC",
		CSEM="SCALE_SCORE_CSEM")
	#	Test_Vendor="Measurement Incorporated")

SGPstateData[["NJ_ORIGINAL"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="NJASK",
		Assessment_Abbreviation.2015="PARCC",
		Assessment_Name="New Jersey Assessment of Skills and Knowledge",
		Assessment_Name.2015="Partnership for Assessment of Readiness for College and Careers",
		Achievement_Levels=list(
			Labels=c("Partially Proficient", "Proficient", "Advanced Proficient"),
			Proficient=c("Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2015=list(
			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Advanced"="Advanced Proficient"),
		Achievement_Level_Labels.2015=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
		Content_Areas_Labels.2015=list(MATHEMATICS="Math", ELA="ELA", ALGEBRA_I="Algebra I", GEOMETRY="Geometry", ALGEBRA_II="Algebra II"),
		Vertical_Scale="No",
		Vertical_Scale.2015="No",
		Grades_Tested=c(3,4,5,6,7,8),
		Grades_Tested.2015=c(3,4,5,6,7,8,9,10,11,'EOCT'),
		Year="2015")

SGPstateData[["NJ_ORIGINAL"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
												MATHEMATICS=as.character(2006:2018),
												ELA=as.character(2006:2018),
												ALGEBRA_I=as.character(2006:2018),
												GEOMETRY=as.character(2006:2018),
												ALGEBRA_II=as.character(2006:2018)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
												MATHEMATICS=as.character(2006:2018),
												ELA=as.character(2006:2018),
												ALGEBRA_I=as.character(2006:2018),
												GEOMETRY=as.character(2006:2018),
												ALGEBRA_II=as.character(2006:2018)),
		Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE, ALGEBRA_I=FALSE, ALGEBRA_II=FALSE, GEOMETRY=FALSE),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8,9,10,11), ALGEBRA_I="EOCT", GEOMETRY="EOCT", ALGEBRA_II="EOCT"),
		Content_Areas_Domains=list(ELA="ELA", MATHEMATICS="MATHEMATICS", ALGEBRA_I="MATHEMATICS", GEOMETRY="MATHEMATICS", ALGEBRA_II="MATHEMATICS"),
		Achievement_Level_Labels=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"))

#load("Baseline_Coefficient_Matrices/NJ/NJ_Baseline_Matrices.Rdata")
#SGPstateData[["NJ_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- NJ_Baseline_Matrices[["ELA.BASELINE"]]
#SGPstateData[["NJ_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NJ_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["NJ_ORIGINAL"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NJ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

SGPstateData[["NJ_ORIGINAL"]][["SGP_Configuration"]] <- list(sgp.loss.hoss.adjustment="NJ_ORIGINAL",
															print.other.gp=TRUE,
															projcut.digits=3,
															gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, ELA=TRUE))

SGPstateData[["NJ_ORIGINAL"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
	ELA=c("3", "4", "5", "6", "7", "8", "9", "10", "11"),
	MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
	ALGEBRA_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"))
SGPstateData[["NJ_ORIGINAL"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
	ELA=rep("ELA", 9),
	MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	GEOMETRY=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	ALGEBRA_I=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
	ALGEBRA_II=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"))
SGPstateData[["NJ_ORIGINAL"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
	ELA=rep(1L, 8),
	MATHEMATICS=rep(1L, 8),
	GEOMETRY=rep(1L, 8),
	ALGEBRA_I=rep(1L, 8),
	ALGEBRA_II=rep(1L, 8))
SGPstateData[["NJ_ORIGINAL"]][["SGP_Configuration"]][["max.forward.projection.sequence"]] <- list(
	ELA=3,
	MATHEMATICS=3,
	GEOMETRY=3,
	ALGEBRA_I=3,
	ALGEBRA_II=3)

load("SGP_Norm_Group_Preference/NJ_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["NJ_ORIGINAL"]][["SGP_Norm_Group_Preference"]] <- NJ_SGP_Norm_Group_Preference


### NEW JERSEY

load("Knots_Boundaries/PARCC_NJ_Knots_Boundaries.Rdata")
SGPstateData[["NJ"]] <- SGPstateData[['PARCC']]
SGPstateData[["NJ"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_NJ_Knots_Boundaries

SGPstateData[["NJ"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="New Jersey Department of Education",
			Abbreviation="NJDOE",
			URL="www.state.nj.us/education",
			Contact="877-900-6960"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")


#########################################################
### NEW MEXICO
#########################################################

### NEW MEXICO (Original meta-data prior to PARCC transition)

load("Knots_Boundaries/ABQ_Knots_Boundaries.Rdata")
SGPstateData[["NM_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <- ABQ_Knots_Boundaries

SGPstateData[["NM_ORIGINAL"]][["Achievement"]][["Cutscores"]] <-
	list(
		READING=list(
			GRADE_3=c(332,340,356),
			GRADE_4=c(426,440,452),
			GRADE_5=c(528,540,552),
			GRADE_6=c(628,640,652),
			GRADE_7=c(730,740,754),
			GRADE_8=c(831,840,858),
			GRADE_11=c(1129,1140,1151)),
		MATHEMATICS=list(
			GRADE_3=c(328,340,359),
			GRADE_4=c(429,440,453),
			GRADE_5=c(529,540,551),
			GRADE_6=c(630,640,653),
			GRADE_7=c(730,740,753),
			GRADE_8=c(827,840,855),
			GRADE_11=c(1127,1140,1151)))

SGPstateData[["NM_ORIGINAL"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Beginning Step", "Nearing Proficient", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NM_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NM_ORIGINAL"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NM_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NM_ORIGINAL"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="New Mexico Standards Based Assessment",
		Assessment_Abbreviation="NMSBA",
		Organization=list(
			Name="New Mexico Public Education Department",
			Abbreviation="NMPED",
			URL="www.ped.state.nm.us",
			Contact="505-827-7950"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8),
		Test_Season="Spring",
		Test_Vendor="Measured Progress")

SGPstateData[["NM_ORIGINAL"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=as.character(2011:2014), READING=as.character(2011:2014)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=as.character(2011:2014), READING=as.character(2011:2014)),
	Vertical_Scale=list(MATHEMATICS=FALSE, READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", ELA="English Language Arts"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Beginning"="Beginning Step",
		"Nearing"="Nearing Proficient",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))


### NEW MEXICO

load("Knots_Boundaries/PARCC_NM_Knots_Boundaries.Rdata")
SGPstateData[["NM"]] <- SGPstateData[['PARCC']]
SGPstateData[["NM"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_NM_Knots_Boundaries

SGPstateData[["NM"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="New Mexico Public Education Department",
			Abbreviation="NMPED",
			URL="http://ped.state.nm.us",
			Contact="505-827-5800"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")


#########################################################
### NEW YORK
#########################################################

load("CSEM/New_York/New_York_CSEM.Rdata")

SGPstateData[["NY"]][["Achievement"]][["Cutscores"]] <-
	list(
		ELA=list(GRADE_3=c(616, 650, 720),
			GRADE_4=c(612, 650, 716),
			GRADE_5=c(608, 650, 711),
			GRADE_6=c(598, 650, 696),
			GRADE_7=c(600, 650, 705),
			GRADE_8=c(602, 650, 715)),
		MATHEMATICS=list(GRADE_3=c(624, 650, 703),
			GRADE_4=c(622, 650, 702),
			GRADE_5=c(619, 650, 699),
			GRADE_6=c(616, 650, 696),
			GRADE_7=c(611, 650, 693),
			GRADE_8=c(616, 650, 701)),
		ELA.2010=list(GRADE_3=c(643, 662, 694),
			GRADE_4=c(637, 668, 720),
			GRADE_5=c(647, 666, 700),
			GRADE_6=c(644, 662, 694),
			GRADE_7=c(642, 664, 698),
			GRADE_8=c(627, 658, 699)),
		MATHEMATICS.2010=list(GRADE_3=c(661, 684, 707),
			GRADE_4=c(636, 676, 707),
			GRADE_5=c(640, 674, 702),
			GRADE_6=c(640, 674, 699),
			GRADE_7=c(639, 670, 694),
			GRADE_8=c(639, 673, 702)),
		ELA.2011=list(GRADE_3=c(644, 663, 694),
			GRADE_4=c(637, 671, 722),
			GRADE_5=c(648, 668, 700),
			GRADE_6=c(644, 662, 694),
			GRADE_7=c(642, 665, 698),
			GRADE_8=c(628, 658, 699)),
		MATHEMATICS.2011=list(GRADE_3=c(662, 684, 707),
			GRADE_4=c(636, 676, 707),
			GRADE_5=c(640, 676, 707),
			GRADE_6=c(640, 674, 700),
			GRADE_7=c(639, 670, 694),
			GRADE_8=c(639, 674, 704)))

SGPstateData[["NY"]][["Achievement"]][["Knots_Boundaries"]] <-
list(
	ELA=list(
		boundaries_3=c(444.5, 810.5),
		boundaries_4=c(395.5, 809.5),
		boundaries_5=c(465, 825),
		boundaries_6=c(449.5, 815.5),
		boundaries_7=c(438, 822),
		boundaries_8=c(394, 826),
		knots_3=c(642, 659, 675, 694),
		knots_4=c(641, 660, 677, 695),
		knots_5=c(646, 661, 674, 690),
		knots_6=c(642, 656, 666, 682),
		knots_7=c(640, 655, 667, 682),
		knots_8=c(632, 649, 662, 679),
		loss.hoss_3=c(475, 780.5),
		loss.hoss_4=c(430, 775.5),
		loss.hoss_5=c(495, 795.5),
		loss.hoss_6=c(480, 785.5),
		loss.hoss_7=c(470, 790.5),
		loss.hoss_8=c(430, 790.5)),
	MATHEMATICS=list(
		boundaries_3=c(440, 800),
		boundaries_4=c(453.5, 831.5),
		boundaries_5=c(466.5, 808.5),
		boundaries_6=c(472, 808),
		boundaries_7=c(470, 830),
		boundaries_8=c(450.5, 804.5),
		boundaries_8=c(450.5, 804.5),
		knots_3=c(662, 678, 691, 710),
		knots_4=c(655, 675, 692, 712),
		knots_5=c(651, 671, 687, 706),
		knots_6=c(645, 665, 681, 700),
		knots_7=c(643, 663, 678, 696),
		knots_8=c(636, 658, 674, 694),
		loss.hoss_3=c(470, 770.5),
		loss.hoss_4=c(485, 800.5),
		loss.hoss_5=c(495, 780.5),
		loss.hoss_6=c(500, 780.5),
		loss.hoss_7=c(500, 800.5),
		loss.hoss_8=c(480, 775.5)))

SGPstateData[["NY"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Below Standard", "Meets Basic Standard", "Meets Proficiency Standard", "Exceeds Proficiency Standard"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NY"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NY"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(35, 66), Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NY"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NY"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="New York State Assessment Program",
		Assessment_Abbreviation="NYSTP",
		Content_Areas=c("Mathematics", "ELA"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
		Test_Season="Spring",
		Test_Vendor="CTB/McGraw Hill",
		CSEM=New_York_CSEM)

SGPstateData[["NY"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=as.character(2006:2014), ELA=as.character(2006:2014)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=as.character(2006:2014), ELA=as.character(2006:2014)),
		Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list("Below Basic"="Below Standard",
			"Basic"="Meets Basic Standard",
			"Proficient"="Meets Proficiency Standard",
			"Exceeds"="Exceeds Proficiency Standard"))

SGPstateData[["NY"]][["SGP_Configuration"]] <- list(max.order.for.percentile=3, max.order.for.projection=3)

#load("Baseline_Coefficient_Matrices/NY/NY_Baseline_Matrices.Rdata")
#SGPstateData[["NY"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NY_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["NY"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- NY_Baseline_Matrices[["ELA.BASELINE"]]
SGPstateData[["NY"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NY_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))


#########################################################
### OREGON
#########################################################

SGPstateData[["OR"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_3=c(204,211,224),
		GRADE_4=c(210,216,226),
		GRADE_5=c(214,221,230),
		GRADE_6=c(217,226,237),
		GRADE_7=c(222,229,241),
		GRADE_8=c(226,232,242),
		GRADE_11=c(232,236,247)),
	READING.2015=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668),
		GRADE_11=c(2493, 2583, 2682)),
	MATHEMATICS=list(
		GRADE_3=c(205,212,219),
		GRADE_4=c(212,219,227),
		GRADE_5=c(219,225,234),
		GRADE_6=c(222,227,237),
		GRADE_7=c(228,232,242),
		GRADE_8=c(230,234,245),
		GRADE_11=c(232,236,251)),
	MATHEMATICS.2015=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653),
		GRADE_11=c(2543, 2628, 2718)))

SGPstateData[["OR"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Low", "Nearly Meets", "Meets", "Exceeds"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["OR"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["OR"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["OR"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["OR"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="SBAC Oregon",
	Assessment_Abbreviation="SBAC",
#	Assessment_Name="Oregon Assessment of Knowledge and Skills",
#	Assessment_Abbreviation="OAKS",
	Organization=list(
		Name="Oregon Department of Education",
		Abbreviation="ODOE",
		URL="www.ode.state.or.us",
		Contact="503-947-5600"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Scale_Change=list(MATHEMATICS="2015", READING="2015"),
	Test_Season="Spring",
#	Test_Vendor="Oregon Department of Education")
	Test_Vendor="SBAC")

SGPstateData[["OR"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- list(
	Assessment_Abbreviation="OAKS",
	Assessment_Abbreviation.2015="SBAC",
	Assessment_Name="Oregon Assessment of Knowledge and Skills",
	Assessment_Name.2015="SBAC Oregon",
	Achievement_Levels=list(
		Labels=c("Low", "Nearly Meets", "Meets", "Exceeds"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels.2015=list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Level_Labels=list(
		"Low"="Low",
		"Near"="Nearly Meets",
		"Proficient"="Meets",
		"Exceeds"="Exceeds"),
	Achievement_Level_Labels.2015=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Content_Areas_Labels.2015=list(MATHEMATICS="Math", READING="Reading"),
	Vertical_Scale="No",
	Vertical_Scale.2015="Yes",
	Grades_Tested=c(3,4,5,6,7,8,11),
	Grades_Tested.2015=c(3,4,5,6,7,8,11),
	Year="2015"
)

SGPstateData[["OR"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)),
	Achievement_Level_Labels=list(
		"Low"="Low",
		"Near"="Nearly Meets",
		"Proficient"="Meets",
		"Exceeds"="Exceeds"))


#########################################################
### RENAISSANCE LEARNING
#########################################################

RLI_SGP_Config_Function <- source('Custom_SGP_Config/RLI/RLI_Custom_SGP_Config-function.R')
load("Knots_Boundaries/RLI_Knots_Boundaries.Rdata")
SGPstateData[["RLI"]][["Achievement"]][["Knots_Boundaries"]] <- RLI_Knots_Boundaries
load("Cutscores/RLI/RLI_Cutscores_testSGP.rda") ### Cutscores for testSGP('RLI1') & testSGP('RLI2')
load("Cutscores/RLI/RLI_Cutscores_09032018.rda")

### Cutscores embedded through rliCutscoreCreation.R or (if none supplied) utilize those in SGPstateData

SGPstateData[["RLI"]][["Achievement"]][["Cutscores"]] <- RLI_Cutscores

SGPstateData[["RLI"]][["Achievement"]][["Levels"]][['Labels']] <- c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5")

SGPstateData[["RLI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["RLI"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

SGPstateData[["RLI"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["RLI"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Renaissance Learning Incorporated",
		Assessment_Abbreviation="RLI",
		Organization=list(
			Name="Renaissance Learning Incorporated",
			Abbreviation="RLI",
			URL="www.renaissance.com",
			Contact="(800) 338-4204"),
		Content_Areas=c("Mathematics", "Reading", "Early Literacy"),
		Grades_Tested=c('PK','K',1,2,3,4,5,6,7,8,9,10,11,12),
		Assessment_Years=c("2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016", "2016_2017", "2017_2018", "2018_2019"),
		Test_Vendor="Renaissance Learning Incorporated",
		Test_Season="Fall/Winter/Spring")

SGPstateData[["RLI"]][["Student_Report_Information"]] <-
	list(
		Vertical_Scale=list(MATHEMATICS=TRUE, MATHEMATICS_RASCH=TRUE, READING=TRUE, READING_RASCH=TRUE, READING_UNIFIED=TRUE, READING_UNIFIED_RASCH=TRUE, EARLY_LITERACY=TRUE, EARLY_LITERACY_RASCH=TRUE),
		Projection_Fan_Limits=c(5, 95),
		Content_Areas_Labels=list(MATHEMATICS="Math", MATHEMATICS_RASCH="Mathematics", READING="Reading", READING_RASCH="Reading", READING_UNIFIED="Reading", READING_UNIFIED_RASCH="Reading", EARLY_LITERACY="Early Literacy", EARLY_LITERACY_RASCH="Early Literacy"),
		Grades_Reported=list(MATHEMATICS=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")), MATHEMATICS_RASCH=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")),
							 READING=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")), READING_RASCH=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")), READING_UNIFIED=do.call(paste, c(expand.grid(c('K',1,2,3), 1:3), sep=".")), READING_UNIFIED_RASCH=do.call(paste, c(expand.grid(c('K',1,2,3), 1:3), sep=".")),
							 EARLY_LITERACY=do.call(paste, c(expand.grid(c('PK','K',1,2,3), 1:3), sep=".")), EARLY_LITERACY_RASCH=do.call(paste, c(expand.grid(c('PK','K',1,2,3), 1:3), sep="."))),
		Achievement_Level_Labels=list(
			"Unsatisfactory"="Unsatisfactory",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

SGPstateData[["RLI"]][["SGP_Configuration"]] <-
	list(
		print.other.gp=TRUE,
		percentile.cuts=50, ### For within window projections
		SGPt.max.time=TRUE,
#		max.sgp.target.years.forward=9,
#		sgp.projections.max.forward.progression.years=9,
		max.sgp.target.years.forward=10,
		sgp.projections.max.forward.progression.years=10,
		sgp.projections.projection.unit="YEAR",
		sgp.projections.projection.unit.label="TIME",
		return.prior.scale.score.standardized=TRUE,
		return.percentile.trajectory.values=TRUE,
		return.norm.group.scale.scores=TRUE,
		return.norm.group.dates=TRUE,
		return.projection.group.scale.scores=TRUE,
		return.projection.group.dates=TRUE,
		outputSGP.pass.through.variables="OFFICIAL_WINDOW_SCORE",
		sgp.target.types=c("Scale_Score_Targets_Current_CUKU", "Scale_Score_Targets_Current_MUSU"),
		sgp.config.function=RLI_SGP_Config_Function,
		max.n.for.coefficient.matrices=500000,
		sgp.use.my.sgp_object.baseline.coefficient.matrices=TRUE,
		goodness.of.fit.achievement.level.prior=FALSE,
		gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, READING=TRUE),
		projcuts.digits=3,
		percentile.trajectory.values=1:99,
		testSGP.cutscores=RLI_Cutscores_testSGP,
		grade.projection.sequence=list(
			READING_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			READING_RASCH_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			READING_UNIFIED_FWS=paste(rep(as.character(c('K',1:3)), each=3), c(1,2,3), sep="."),
			READING_UNIFIED_RASCH_FWS=paste(rep(as.character(c('K',1:3)), each=3), c(1,2,3), sep="."),
#			READING_SS=paste(1:12, 3, sep="."),
			MATHEMATICS_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			MATHEMATICS_RASCH_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
#			MATHEMATICS_SS=paste(1:12, 3, sep="."),
			EARLY_LITERACY_FWS=paste(rep(as.character(c('PK','K',1:3)), each=3), c(1,2,3), sep="."),
			EARLY_LITERACY_RASCH_FWS=paste(rep(as.character(c('PK','K',1:3)), each=3), c(1,2,3), sep=".")),
		content_area.projection.sequence=list(
			READING_FWS=rep("READING", length(1:12)*3),
			READING_RASCH_FWS=rep("READING_RASCH", length(1:12)*3),
			READING_UNIFIED_FWS=rep("READING_UNIFIED", length(c('K',1:3))*3),
			READING_UNIFIED_RASCH_FWS=rep("READING_UNIFIED_RASCH", length(c('K',1:3))*3),
#			READING_SS=rep("READING", length(1:12)),
			MATHEMATICS_FWS=rep("MATHEMATICS", length(1:12)*3),
			MATHEMATICS_RASCH_FWS=rep("MATHEMATICS_RASCH", length(1:12)*3),
#			MATHEMATICS_SS=rep("MATHEMATICS", length(1:12)),
			EARLY_LITERACY_FWS=rep("EARLY_LITERACY", length(c('PK','K',1:3))*3),
			EARLY_LITERACY_RASCH_FWS=rep("EARLY_LITERACY_RASCH", length(c('PK','K',1:3))*3)),
		year_lags.projection.sequence=list(
			READING_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			READING_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			READING_UNIFIED_FWS=c(rep(c(0.1, 0.1, 0.8), 3), c(0.1, 0.1)),
			READING_UNIFIED_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 3), c(0.1, 0.1)),
#			READING_SS=c(rep(1, 11)),
			MATHEMATICS_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			MATHEMATICS_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
#			MATHEMATICS_SS=c(rep(1, 11)),
			EARLY_LITERACY_FWS=c(rep(c(0.1, 0.1, 0.8), 4), c(0.1, 0.1)),
			EARLY_LITERACY_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 4), c(0.1, 0.1))),
		max.forward.projection.sequence=list(
			READING_FWS=10,
			READING_RASCH_FWS=10,
			READING_UNIFIED_FWS=10,
			READING_UNIFIED_RASCH_FWS=10,
#			READING_SS=12,
			MATHEMATICS_FWS=10,
			MATHEMATICS_RASCH_FWS=10,
#			MATHEMATICS_SS=12,
			EARLY_LITERACY_FWS=10,
			EARLY_LITERACY_RASCH_FWS=10),
		output.column.order=list(
			SGPercentiles=c('ID','SGP_BASELINE_ORDER_1','SGP_BASELINE_ORDER_2','SGP_BASELINE','SCALE_SCORE_PRIOR','SGP_LEVEL_BASELINE',
				'SGP_NORM_GROUP_BASELINE','SCALE_SCORE_PRIOR_STANDARDIZED', 'SGP_NORM_GROUP_BASELINE_SCALE_SCORES', 'SGP_NORM_GROUP_BASELINE_DATES'),
			SGProjection=c('ID','STATE',
				do.call(paste0, expand.grid("LEVEL_", 1:4, "_SGP_TARGET_TIME_", 1:10, "_CURRENT")),
				unlist(lapply(1:99, function(iter) paste0("P", iter, "_PROJ_TIME_", 1:10, "_CURRENT"))),
				'SGP_PROJECTION_GROUP', 'CATCH_UP_KEEP_UP_STATUS_INITIAL_CURRENT','MOVE_UP_STAY_UP_STATUS_INITIAL_CURRENT', 'GROUP',
				'SGP_PROJECTION_GROUP_SCALE_SCORES', 'SGP_PROJECTION_GROUP_DATES'),
			SGProjection_Target_10_TIME=c('ID','SGP_TARGET_BASELINE_10_TIME_CURRENT','SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_1_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_2_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_3_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_4_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_5_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_6_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_7_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_8_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_9_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_10_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_1_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_2_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_3_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_4_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_5_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_6_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_7_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_8_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_9_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_10_CURRENT',
				'SGP_PROJECTION_GROUP','GROUP')))

SGPstateData[["RLI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/RLI_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### RENAISSANCE LEARNING (UNITED KINGDOM)
#########################################################

RLI_UK_SGP_Config_Function <- source('Custom_SGP_Config/RLI_UK/RLI_UK_Custom_SGP_Config-function.R')
load("Knots_Boundaries/RLI_UK_Knots_Boundaries.Rdata")
SGPstateData[["RLI_UK"]][["Achievement"]][["Knots_Boundaries"]] <- RLI_UK_Knots_Boundaries

SGPstateData[["RLI_UK"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["RLI_UK"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

SGPstateData[["RLI_UK"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["RLI_UK"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Renaissance Learning Incorporated",
		Assessment_Abbreviation="RLI_UK",
		Organization=list(
			Name="Renaissance Learning Incorporated",
			Abbreviation="RLI_UK",
			URL="www.renaissance.com",
			Contact="(800) 338-4204"),
		Content_Areas=c("Mathematics", "Reading", "Early Literacy"),
		Grades_Tested=c('K',1,2,3,4,5,6,7,8,9,10,11,12),
		Assessment_Years=c("2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"),
		Test_Vendor="Renaissance Learning Incorporated UK",
		Test_Season="Fall/Winter/Spring")

SGPstateData[["RLI_UK"]][["Student_Report_Information"]] <-
	list(
		Vertical_Scale=list(MATHEMATICS=TRUE, MATHEMATICS_RASCH=TRUE, READING=TRUE, READING_RASCH=TRUE, EARLY_LITERACY=TRUE, EARLY_LITERACY_RASCH=TRUE),
		Projection_Fan_Limits=c(5, 95),
		Content_Areas_Labels=list(MATHEMATICS="Math", MATHEMATICS_RASCH="Mathematics", READING="Reading", READING_RASCH="Reading", EARLY_LITERACY="Early Literacy", EARLY_LITERACY_RASCH="Early Literacy"),
		Grades_Reported=list(MATHEMATICS=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")), MATHEMATICS_RASCH=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")),
							 READING=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")), READING_RASCH=do.call(paste, c(expand.grid(1:12, 1:3), sep=".")),
							 EARLY_LITERACY=do.call(paste, c(expand.grid(c('PK','K',1,2,3), 1:3), sep=".")), EARLY_LITERACY_RASCH=do.call(paste, c(expand.grid(c('PK','K',1,2,3), 1:3), sep="."))),
		Achievement_Level_Labels=list(
			"Unsatisfactory"="Unsatisfactory",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Advanced"="Advanced"))

SGPstateData[["RLI_UK"]][["SGP_Configuration"]] <-
	list(
		print.other.gp=TRUE,
		percentile.cuts=50, ### For within window projections
		SGPt.max.time=TRUE,
#		max.sgp.target.years.forward=9,
#		sgp.projections.max.forward.progression.years=9,
		max.sgp.target.years.forward=10,
		sgp.projections.max.forward.progression.years=10,
		sgp.projections.projection.unit="YEAR",
		sgp.projections.projection.unit.label="TIME",
		return.prior.scale.score.standardized=TRUE,
		return.norm.group.scale.scores=TRUE,
		return.norm.group.dates=TRUE,
		return.projection.group.scale.scores=TRUE,
		return.projection.group.dates=TRUE,
		return.percentile.trajectory.values=TRUE,
		outputSGP.pass.through.variables="OFFICIAL_WINDOW_SCORE",
		sgp.target.types=c("Scale_Score_Targets_Current_CUKU", "Scale_Score_Targets_Current_MUSU"),
		sgp.config.function=RLI_UK_SGP_Config_Function,
		max.n.for.coefficient.matrices=200000,
		sgp.use.my.sgp_object.baseline.coefficient.matrices=TRUE,
		goodness.of.fit.achievement.level.prior=FALSE,
		projcuts.digits=3,
		percentile.trajectory.values=1:99,
		grade.projection.sequence=list(
			READING_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			READING_RASCH_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			MATHEMATICS_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			MATHEMATICS_RASCH_FWS=paste(rep(as.character(1:12), each=3), c(1,2,3), sep="."),
			EARLY_LITERACY_FWS=paste(rep(as.character(c('PK','K',1:3)), each=3), c(1,2,3), sep="."),
			EARLY_LITERACY_RASCH_FWS=paste(rep(as.character(c('PK','K',1:3)), each=3), c(1,2,3), sep=".")),
		content_area.projection.sequence=list(
			READING_FWS=rep("READING", length(1:12)*3),
			READING_RASCH_FWS=rep("READING_RASCH", length(1:12)*3),
			MATHEMATICS_FWS=rep("MATHEMATICS", length(1:12)*3),
			MATHEMATICS_RASCH_FWS=rep("MATHEMATICS_RASCH", length(1:12)*3),
			EARLY_LITERACY_FWS=rep("EARLY_LITERACY", length(c('PK','K',1:3))*3),
			EARLY_LITERACY_RASCH_FWS=rep("EARLY_LITERACY_RASCH", length(c('PK','K',1:3))*3)),
		year_lags.projection.sequence=list(
			READING_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			READING_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			MATHEMATICS_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			MATHEMATICS_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 11), c(0.1, 0.1)),
			EARLY_LITERACY_FWS=c(rep(c(0.1, 0.1, 0.8), 4), c(0.1, 0.1)),
			EARLY_LITERACY_RASCH_FWS=c(rep(c(0.1, 0.1, 0.8), 4), c(0.1, 0.1))),
		max.forward.projection.sequence=list(
			READING_FWS=10,
			READING_RASCH_FWS=10,
			MATHEMATICS_FWS=10,
			MATHEMATICS_RASCH_FWS=10,
			EARLY_LITERACY_FWS=10,
			EARLY_LITERACY_RASCH_FWS=10),
		output.column.order=list(
			SGPercentiles=c('ID','SGP_BASELINE_ORDER_1','SGP_BASELINE_ORDER_2','SGP_BASELINE','SCALE_SCORE_PRIOR','SGP_LEVEL_BASELINE',
				'SGP_NORM_GROUP_BASELINE','SCALE_SCORE_PRIOR_STANDARDIZED', 'SGP_NORM_GROUP_BASELINE_SCALE_SCORES', 'SGP_NORM_GROUP_BASELINE_DATES'),
			SGProjection=c('ID','STATE',
				do.call(paste0, expand.grid("LEVEL_", 1:4, "_SGP_TARGET_TIME_", 1:10, "_CURRENT")),
				unlist(lapply(1:99, function(iter) paste0("P", iter, "_PROJ_TIME_", 1:10, "_CURRENT"))),
				'SGP_PROJECTION_GROUP', 'CATCH_UP_KEEP_UP_STATUS_INITIAL_CURRENT','MOVE_UP_STAY_UP_STATUS_INITIAL_CURRENT', 'GROUP',
				'SGP_PROJECTION_GROUP_SCALE_SCORES', 'SGP_PROJECTION_GROUP_DATES'),
			SGProjection_Target_10_TIME=c('ID','SGP_TARGET_BASELINE_10_TIME_CURRENT','SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_1_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_2_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_3_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_4_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_5_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_6_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_7_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_8_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_9_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_10_TIME_PROJ_YEAR_10_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_1_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_2_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_3_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_4_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_5_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_6_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_7_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_8_CURRENT',
				'SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_9_CURRENT','SCALE_SCORE_SGP_TARGET_BASELINE_MOVE_UP_STAY_UP_10_TIME_PROJ_YEAR_10_CURRENT',
				'SGP_PROJECTION_GROUP','GROUP')))

SGPstateData[["RLI_UK"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/RLI_UK_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


#########################################################
### RHODE ISLAND
#########################################################

### RHODE ISLAND (Original meta-data with RIDE/PARCC)

#load("Knots_Boundaries/RI_Knots_Boundaries.Rdata")
#SGPstateData[["RI_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <- RI_Knots_Boundaries

#SGPstateData[["RI_ORIGINAL"]][["Achievement"]][["Knots_Boundaries"]] <-
#	list(
#		READING=list(
#			knots_3=c(335, 342, 348, 355),
#			knots_4=c(434, 442, 447, 455),
#			knots_5=c(535, 542, 548, 555),
#			knots_6=c(634, 642, 648, 655),
#			knots_7=c(733, 742, 749, 756),
#			knots_8=c(833, 842, 849, 856),
#			boundaries_3=c(292, 388),
#			boundaries_4=c(392, 488),
#			boundaries_5=c(492, 588),
#			boundaries_6=c(592, 688),
#			boundaries_7=c(692, 788),
#			boundaries_8=c(792, 888),
#			loss.hoss_3=c(300, 380),
#			loss.hoss_4=c(400, 480),
#			loss.hoss_5=c(500, 580),
#			loss.hoss_6=c(600, 680),
#			loss.hoss_7=c(700, 780),
#			loss.hoss_8=c(800, 880),
#			loss.hoss_11=c(1100, 1180)),
#		MATHEMATICS=list(
#			knots_3=c(332, 339, 345, 352),
#			knots_4=c(430, 439, 446, 452),
#			knots_5=c(532, 539, 545, 552),
#			knots_6=c(631, 638, 644, 651),
#			knots_7=c(731, 737, 743, 749),
#			knots_8=c(831, 837, 843, 849),
#			boundaries_3=c(292, 388),
#			boundaries_4=c(392, 488),
#			boundaries_5=c(492, 588),
#			boundaries_6=c(592, 688),
#			boundaries_7=c(692, 788),
#			boundaries_8=c(792, 888),
#			loss.hoss_3=c(300, 380),
#			loss.hoss_4=c(400, 480),
#			loss.hoss_5=c(500, 580),
#			loss.hoss_6=c(600, 680),
#			loss.hoss_7=c(700, 780),
#			loss.hoss_8=c(800, 880),
#			loss.hoss_11=c(1100, 1180)))

SGPstateData[["RI_ORIGINAL"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(332, 340, 353),
			GRADE_4=c(431, 440, 455),
			GRADE_5=c(533, 540, 554),
			GRADE_6=c(633, 640, 653),
			GRADE_7=c(734, 740, 752),
			GRADE_8=c(834, 840, 852),
			GRADE_11=c(1134, 1140, 1152)),
		READING=list(
			GRADE_3=c(331, 340, 357),
			GRADE_4=c(431, 440, 456),
			GRADE_5=c(530, 540, 556),
			GRADE_6=c(629, 640, 659),
			GRADE_7=c(729, 740, 760),
			GRADE_8=c(828, 840, 859),
			GRADE_11=c(1130, 1140, 1154)),
		READING.2014_2015 =list(
			GRADE_3=c(700, 725, 750, 810),
			GRADE_4=c(700, 725, 750, 790),
			GRADE_5=c(700, 725, 750, 799),
			GRADE_6=c(700, 725, 750, 790),
			GRADE_7=c(700, 725, 750, 785),
			GRADE_8=c(700, 725, 750, 794),
			GRADE_9=c(700, 725, 750, 791),
			GRADE_10=c(700, 725, 750, 794),
			GRADE_11=c(700, 725, 750, 792)),
		MATHEMATICS.2014_2015 =list(
			GRADE_3=c(700, 725, 750, 790),
			GRADE_4=c(700, 725, 750, 796),
			GRADE_5=c(700, 725, 750, 790),
			GRADE_6=c(700, 725, 750, 788),
			GRADE_7=c(700, 725, 750, 786),
			GRADE_8=c(700, 725, 750, 801)),
		ALGEBRA_I.2014_2015 =list(
			GRADE_8=c(700, 725, 750, 805),
			GRADE_EOCT=c(700, 725, 750, 805)),
		ALGEBRA_II.2014_2015 =list(GRADE_EOCT=c(700, 725, 750, 808)),
		GEOMETRY.2014_2015=list(GRADE_EOCT=c(700, 725, 750, 783)),
		INTEGRATED_MATH_1.2014_2015=list(GRADE_EOCT=c(700, 725, 750, 799)),
		INTEGRATED_MATH_2.2014_2015=list(GRADE_EOCT=c(700, 725, 750, 785)),
		INTEGRATED_MATH_3.2014_2015=list(GRADE_EOCT=c(700, 725, 750, 804)))

SGPstateData[["RI_ORIGINAL"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
		Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["RI_ORIGINAL"]][["Achievement"]][["Levels"]] <-
#	list(
#	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["RI_ORIGINAL"]][["Growth"]][["Levels"]] <- c("Low", "Low Typical", "Typical", "High Typical", "High")

SGPstateData[["RI_ORIGINAL"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(31, 46, 56, 71),
		Labels=c("1st-30th", "31st-45th", "46th-55th", "56th-70th", "71st-99th"))

SGPstateData[["RI_ORIGINAL"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["RI_ORIGINAL"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Rhode Island PARCC",
		Assessment_Abbreviation="RI PARCC",
		Organization=list(
			Name="Rhode Island Department of Education",
			Abbreviation="RIDE",
			URL="www.ride.ri.gov/",
			Contact="401-222-4600"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8),
		Scale_Change=list(MATHEMATICS="2014_2015", ELA="2014_2015"),
		Test_Season="Fall",
		Test_Vendor="PARCC",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["RI_ORIGINAL"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="NECAP",
		Assessment_Abbreviation.2014_2015="RI PARCC",
		Assessment_Name="Rhode Island NECAP",
		Assessment_Name.2014_2015="Partnership for Assessment of Readiness for College and Careers",
		Achievement_Levels=list(
			Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2014_2015=list(
			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Below Proficient"="Substantially Below Proficient",
			"Part Proficient"="Partially Proficient",
			"Proficient"="Proficient",
			"Distinction"="Proficient with Distinction"),
		Achievement_Level_Labels.2014_2015=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
		Content_Areas_Labels.2014_2015=list(MATHEMATICS="Math", READING="ELA"),
		Vertical_Scale="No",
		Vertical_Scale.2014_2015="No",
		Grades_Tested=c(3,4,5,6,7,8),
		Grades_Tested.2014_2015=c(3,4,5,6,7,8),
		Year="2014_2015"
	)

SGPstateData[["RI_ORIGINAL"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
										MATHEMATICS=paste(2014:2017, 2015:2018, sep="_"),
										ELA=paste(2014:2017, 2015:2018, sep="_")),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
										MATHEMATICS=paste(2014:2017, 2015:2018, sep="_"),
										ELA=paste(2014:2017, 2015:2018, sep="_")),
		Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE),
		Projection_Fan_Limits=c(5, 95),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"))

SGPstateData[["RI_ORIGINAL"]][["SGP_Configuration"]] <- list(
													null.output.string="",
													projcuts.gits=3)
#load("Baseline_Coefficient_Matrices/RI/RI_Baseline_Matrices.Rdata")
#SGPstateData[["RI_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- RI_Baseline_Matrices[["READING.BASELINE"]]
#SGPstateData[["RI_ORIGINAL"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- RI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["RI_ORIGINAL"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/RI_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))


### RHODE ISLAND (USED for STATE ANALYSES in 2016)

#load("Knots_Boundaries/PARCC_RI_Knots_Boundaries.Rdata")
#load("Cutscores/PARCC/PARCC_Cutscores_NO_DOT_YEAR.Rdata")
#SGPstateData[["RI"]] <- SGPstateData[['PARCC']]
#SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_RI_Knots_Boundaries
#SGPstateData[["RI"]][["Achievement"]][["Cutscores"]] <- PARCC_Cutscores_NO_DOT_YEAR

#SGPstateData[["RI"]][["Assessment_Program_Information"]] <-
#	list(
#		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
#		Assessment_Abbreviation="PARCC",
#		Organization=list(
#			Name="Rhode Island Department of Education",
#			Abbreviation="RIDE",
#			URL="www.ride.ri.gov/",
#			Contact="401-222-4600"),
#		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I"),
#		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
#		Assessment_Years=c("2014_2015", "2015_2016"),
#		Test_Season="Fall & Spring",
#		Test_Vendor="Pearson",
#		CSEM="SCALE_SCORE_CSEM")

#SGPstateData[["RI"]][["Student_Report_Information"]] <-
#	list(
#		Transformed_Achievement_Level_Cutscores=list(
#													MATHEMATICS=paste(2014:2017, 2015:2018, sep="_"),
#													ELA=paste(2014:2017, 2015:2018, sep="_"),
#													GEOMETRY=paste(2014:2017, 2015:2018, sep="_"),
#													ALGEBRA_I=paste(2014:2017, 2015:2018, sep="_")),
#		Transformed_Achievement_Level_Cutscores_gaPlot=list(
#													MATHEMATICS=paste(2014:2017, 2015:2018, sep="_"),
#													ELA=paste(2014:2017, 2015:2018, sep="_"),
#													GEOMETRY=paste(2014:2017, 2015:2018, sep="_"),
#													ALGEBRA_I=paste(2014:2017, 2015:2018, sep="_")),
#		Vertical_Scale=list(MATHEMATICS=FALSE, ELA=FALSE, GEOMETRY=FALSE, ALGEBRA_I=FALSE),
#		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA", GEOMETRY="Geometry", ALGEBRA_I="Algebra I"),
#		Content_Areas_Domains=list(MATHEMATICS="MATHEMATICS", ELA="ELA", GEOMETRY="MATHEMATICS", ALGEBRA_I="MATHEMATICS"),
#		Grades_Reported=list(MATHEMATICS=c("3","4","5","6","7","8"), ELA=c("3","4","5","6","7","8","9","10"), GEOMETRY="EOCT", ALGEBRA_I="EOCT"),
#		Grades_Reported_Domains=list(MATHEMATICS=c("3","4","5","6","7","8","EOCT"), ELA=c("3","4","5","6","7","8","9","10")),
#		Achievement_Level_Labels=list(
#			"Level 1"="Level 1",
#			"Level 2"="Level 2",
#			"Level 3"="Level 3",
#			"Level 4"="Level 4",
#			"Level 5"="Level 5"))

#SGPstateData[["RI"]][["SGP_Configuration"]] <-
#	list(
#		fix.duplicates="KEEP.ALL",
#		sgp.minimum.default.panel.years=2,
#		percentile.cuts=c(1,35,50,66,99),
#		sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
#		sgp.projections.max.forward.progression.years=FALSE,
#		gaPlot.back.extrapolated.cuts=list(MATHEMATICS=TRUE, ELA=TRUE),
#		# sgPlot.show.content_area.progression=TRUE,
#		sgp.cohort.size=1000,
#		sgp.projections.use.only.complete.matrices=FALSE,
#		null.output.string="",
#		grade.projection.sequence=list(
#			ELA=c("3", "4", "5", "6", "7", "8", "9", "10"),
#			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#			GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#			ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT")),
#		content_area.projection.sequence=list(
#			ELA=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "ELA"),
#			MATHEMATICS=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"),
#			GEOMETRY=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY"),
#			ALGEBRA_I=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "GEOMETRY")),
#		year_lags.projection.sequence=list(
#			ELA=rep(1L, 7),
#			MATHEMATICS=rep(1L, 7),
#			GEOMETRY=rep(1L, 7),
#			ALGEBRA_I=rep(1L, 7)),
#		max.forward.projection.sequence=list(
#			ELA=3,
#			MATHEMATICS=3,
#			GEOMETRY=3,
#			ALGEBRA_I=3))

### RHODE ISLAND (PARCC)

load("Knots_Boundaries/PARCC_RI_Knots_Boundaries.Rdata")
SGPstateData[["RI_PARCC"]] <- SGPstateData[['PARCC']]
SGPstateData[["RI_PARCC"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_RI_Knots_Boundaries

SGPstateData[["RI_PARCC"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="Rhode Island Department of Education",
			Abbreviation="RIDE",
			URL="www.ride.ri.gov/",
			Contact="401-222-4600"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["RI_PARCC"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
		ELA=c("3", "4", "5", "6", "7", "8", "9"),
		ELA_SS=c("3", "4", "5", "6", "7", "8", "9"),
		MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
		MATHEMATICS_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"))
SGPstateData[["RI_PARCC"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
		ELA=rep("ELA", 7), ELA_SS=rep("ELA_SS", 7),
		MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
		MATHEMATICS_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"))
SGPstateData[["RI_PARCC"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
		ELA=rep(1L, 6), ELA_SS=rep(1L, 6),
		MATHEMATICS=rep(1L, 7), MATHEMATICS_SS=rep(1L, 7))


### RHODE ISLAND

load("CSEM/Rhode_Island/RICAS_PARCC_CSEM-Combo.Rdata")
load("Knots_Boundaries/RI_SAT_Knots_Boundaries.Rdata")

SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]] <-
		c(SGPstateData[["RI_PARCC"]][["Achievement"]][["Knots_Boundaries"]][grep("_SS", names(SGPstateData[["RI_PARCC"]][["Achievement"]][["Knots_Boundaries"]]))],
			RI_SAT_Knots_Boundaries)
names(SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]]) <- gsub("_SS", "", names(SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]]))
# SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]] <-
# 		c(SGPstateData[["RI_PARCC"]][["Achievement"]][["Knots_Boundaries"]][-grep("_SS", names(SGPstateData[["RI_PARCC"]][["Achievement"]][["Knots_Boundaries"]]))],
# 			RI_SAT_Knots_Boundaries)

RI_PARCC_Cutscores <- SGPstateData[["RI_PARCC"]][["Achievement"]][["Cutscores"]][grep("_SS", names(SGPstateData[["RI_PARCC"]][["Achievement"]][["Cutscores"]]))]
RI_PARCC_Cutscores <- RI_PARCC_Cutscores[-grep("INTEGRATED_MATH", names(RI_PARCC_Cutscores))]
names(RI_PARCC_Cutscores) <- gsub("_SS", "", names(RI_PARCC_Cutscores))
# RI_PARCC_Cutscores <- SGPstateData[["RI_PARCC"]][["Achievement"]][["Cutscores"]][grep(".2015_2016.2", names(SGPstateData[["RI_PARCC"]][["Achievement"]][["Cutscores"]]))]
# RI_PARCC_Cutscores <- RI_PARCC_Cutscores[-grep("INTEGRATED_MATH", names(RI_PARCC_Cutscores))]
# names(RI_PARCC_Cutscores) <- gsub(".2015_2016.2", "", names(RI_PARCC_Cutscores))

SGPstateData[["RI"]][["Achievement"]][["Cutscores"]] <- c(RI_PARCC_Cutscores, list(
	ELA.2017_2018 =list(
		GRADE_3=c(-1.58103875, 0.011395, 1.60382875), # c(470, 500, 530), # RICAS Scale Score Cuts for all grades/content areas
		GRADE_4=c(-1.56114375, 0.030745, 1.62263375),
		GRADE_5=c(-1.65871875, 0.03758, 1.73387875),
		GRADE_6=c(-1.59094, -0.0106625, 1.569615),
		GRADE_7=c(-1.55992625, 0.010925, 1.58177625),
		GRADE_8=c(-1.4563275, 0.051195, 1.5587175)),
	MATHEMATICS.2017_2018=list(
		GRADE_3=c(-1.37721625, 0.02747, 1.43215625),  # c(470, 500, 530), # RICAS Scale Score Cuts for all grades/content areas
		GRADE_4=c(-1.37875875, 0.054015, 1.48678875),
		GRADE_5=c(-1.55075375, 0.0249325, 1.60061875),
		GRADE_6=c(-1.5180775, -0.00828, 1.5015175),
		GRADE_7=c(-1.41406125, 0.0311575, 1.47637625),
		GRADE_8=c(-1.49566, -0.008435, 1.47879)),
  MATHEMATICS_PSAT_10=list(
		GRADE_EOCT=c(380, 440, 510, 620)),
	MATHEMATICS_PSAT_10.2017_2018=list(
		GRADE_EOCT=c(390, 480, 600)),
	MATHEMATICS_SAT=list(
		GRADE_EOCT=c(390, 480, 550, 680)),
	MATHEMATICS_SAT.2017_2018=list(
		GRADE_EOCT=c(420, 530, 650)),
	ELA_PSAT_10=list(
		GRADE_EOCT=c(370, 420, 500, 610)),
	ELA_PSAT_10.2017_2018=list(
		GRADE_EOCT=c(370, 430, 590)),
	ELA_SAT=list(
		GRADE_EOCT=c(400, 460, 530, 660)),
	ELA_SAT.2017_2018=list(
		GRADE_EOCT=c(420, 480, 630))
	))

SGPstateData[["RI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Not Meeting", "Partially Meeting", "Meeting", "Exceeding"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["RI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["RI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["RI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["RI"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Rhode Island Comprehensive Assessment System",
		Assessment_Abbreviation="RICAS",
		Organization=list(
			Name="Rhode Island Department of Education",
			Abbreviation="RIDE",
			URL="www.ride.ri.gov",
			Contact="401-222-4600"),
		Content_Areas=c("English Language Arts", "Mathematics", "Algebra I"),
		Grades_Tested=c(3,4,5,6,7,8,10),
		Assessment_Years=c("2015_2016", "2015_2016", "2016_2017", "2017_2018"),
		Test_Season="Spring",
		Test_Vendor="Measured Progress/Pearson",
		CSEM=RICAS_PARCC_CSEM)

SGPstateData[["RI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="PARCC",
		Assessment_Abbreviation.2017_2018="RICAS",
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Name.2017_2018="Rhode Island Comprehensive Assessment System",
		Achievement_Levels=list(
			Labels=c("Level 1", "Level 2", "Level 3", "Level 4", "Level 5"),
			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Levels.2017_2018=list(
			Labels=c("Not Meeting", "Partially Meeting", "Meeting", "Exceeding"),
			Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
		Achievement_Level_Labels=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5"),
		Achievement_Level_Labels.2017_2018=list(
			"Not Meeting"="Not Meeting Expectations",
      "Partially Meeting"="Partially Meeting Expectations",
      "Meeting"="Meeting Expectations",
      "Exceeding"="Exceeding Expectations"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II"),
		Content_Areas.2017_2018=c("English Language Arts", "Mathematics", "ELA PSAT 10", "Math PSAT 10", "ELA SAT", "Math SAT"),
		Content_Areas_Labels=list(
				ELA="English Language Arts", MATHEMATICS="Math", GEOMETRY="Geometry", ALGEBRA_I="Algebra I", ALGEBRA_II="Algebra II"),
		Content_Areas_Labels.2017_2018=list(
				ELA="ELA", ELA_PSAT_10="ELA", ELA_SAT="ELA",
				MATHEMATICS="Math", MATHEMATICS_PSAT_10 = "Math", MATHEMATICS_SAT = "Math"),
		Vertical_Scale="No",
		Vertical_Scale.2017_2018="No",
		Grades_Tested=c(3,4,5,6,7,8,9, "EOCT"),
		Grades_Tested.2017_2018=c(3,4,5,6,7,8,9, "EOCT"),
		Year="2017_2018"
	)

SGPstateData[["RI"]][["SGP_Configuration"]] <-
	list(
		return.norm.group.scale.scores = TRUE,
		grade.projection.sequence = list(
			ELA=c("3", "4", "5", "6", "7", "8", "9", "EOCT", "EOCT"),
			ELA_PSAT_10=c("3", "4", "5", "6", "7", "8", "9", "EOCT", "EOCT"),
			ELA_SAT=c("3", "4", "5", "6", "7", "8", "9", "EOCT", "EOCT"),
			MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			GEOMETRY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			MATHEMATICS_PSAT_10=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
			MATHEMATICS_SAT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT")),
		content_area.projection.sequence = list(
			ELA=c(rep("ELA", 7), "ELA_PSAT_10", "ELA_SAT"),
			ELA_PSAT_10=c(rep("ELA", 7), "ELA_PSAT_10", "ELA_SAT"),
			ELA_SAT=c(rep("ELA", 7), "ELA_PSAT_10", "ELA_SAT"),
			MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
			ALGEBRA_I=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
			GEOMETRY=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY", "MATHEMATICS_PSAT_10"),
			MATHEMATICS_PSAT_10=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT"),
			MATHEMATICS_SAT=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "MATHEMATICS_PSAT_10", "MATHEMATICS_SAT")),
		year_lags.projection.sequence = list(
			ELA = rep(1L, 8),
			ELA_PSAT_10=rep(1L, 8),
			ELA_SAT=rep(1L, 8),
			MATHEMATICS=rep(1L, 8),
			ALGEBRA_I=rep(1L, 8),
			GEOMETRY=rep(1L, 8),
			MATHEMATICS_PSAT_10=rep(1L, 8),
			MATHEMATICS_SAT=rep(1L, 8)
		)
	)

SGPstateData[["RI"]][["Student_Report_Information"]] <-
	list(
		Transformed_Achievement_Level_Cutscores=list(
			ELA=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			GEOMETRY=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			ALGEBRA_I=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			ALGEBRA_II=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS_PSAT_10=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS_SAT=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020")),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(
			ELA=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			GEOMETRY=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			ALGEBRA_I=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			ALGEBRA_II=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS_PSAT_10=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020"),
			MATHEMATICS_SAT=c("2015_2016", "2016_2017", "2017_2018", "2018_2019", "2019_2020")),
		Vertical_Scale=list(ELA=FALSE, MATHEMATICS=FALSE, GEOMETRY=FALSE, ALGEBRA_I=FALSE, ALGEBRA_II=FALSE, MATHEMATICS_PSAT_10=FALSE, MATHEMATICS_SAT=FALSE),
		Content_Areas_Labels=list(
			ELA="English Language Arts", ELA_PSAT_10 = "ELA PSAT 10", ELA_SAT = "ELA SAT",
			MATHEMATICS="Math", ALGEBRA_I="Algebra I", GEOMETRY="Geometry", ALGEBRA_II="Algebra II",
			MATHEMATICS_PSAT_10 = "Math PSAT 10", MATHEMATICS_SAT = "Math SAT"),
		Content_Areas_Domains=list(
			ELA="ELA", ELA_PSAT_10="ELA", ELA_SAT="ELA",
			MATHEMATICS="MATHEMATICS", ALGEBRA_I="MATHEMATICS", GEOMETRY="MATHEMATICS", ALGEBRA_II="MATHEMATICS", MATHEMATICS_PSAT_10 = "MATHEMATICS", MATHEMATICS_SAT = "MATHEMATICS"),
		Grades_Reported=list(
			ELA=c("3","4","5","6","7","8","9"),
			ELA_PSAT_10="EOCT", ELA_SAT="EOCT",
			MATHEMATICS=c("3","4","5","6","7","8"),
			MATHEMATICS_PSAT_10="EOCT", MATHEMATICS_SAT="EOCT",
			GEOMETRY="EOCT", ALGEBRA_I="EOCT", ALGEBRA_II="EOCT"),
		Grades_Reported_Domains=list(
			ELA=c("3","4","5","6","7","8","9","EOCT"),
			MATHEMATICS=c("3","4","5","6","7","8","EOCT")),
		Achievement_Level_Labels=list(
			"Level 1"="Level 1",
			"Level 2"="Level 2",
			"Level 3"="Level 3",
			"Level 4"="Level 4",
			"Level 5"="Level 5",
			"Not Meeting"="Not Meeting Expectations",
			"Partially Meeting"="Partially Meeting Expectations",
			"Meeting"="Meeting Expectations",
			"Exceeding"="Exceeding Expectations"))

SGPstateData[["RI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/RICAS_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))

#########################################################
### SOUTH DAKOTA
#########################################################

SGPstateData[["SD"]][["Achievement"]][["Knots_Boundaries"]] <- list(
	ELA.2016=list(
		boundaries_3=c(1920.0, 2892.0),
		boundaries_4=c(1948.5, 2950.5),
		boundaries_5=c(1970.0, 3002.0),
		boundaries_6=c(1993.2, 3022.8),
		boundaries_7=c(1993.8, 3052.2),
		boundaries_8=c(2007.8, 3078.2),
		knots_3=c(2350, 2405, 2451, 2500),
		knots_4=c(2383, 2444, 2491, 2538),
		knots_5=c(2413, 2473, 2522, 2573),
		knots_6=c(2447, 2505, 2550, 2598),
		knots_7=c(2467, 2527, 2577, 2626),
		knots_8=c(2481.4, 2542, 2594, 2646),
		loss.hoss_3=c(2001, 2811),
		loss.hoss_4=c(2032, 2867),
		loss.hoss_5=c(2056, 2916),
		loss.hoss_6=c(2079, 2937),
		loss.hoss_7=c(2082, 2964),
		loss.hoss_8=c(2097, 2989)),
	ELA=list(
		boundaries_3=c(2063.1, 2673.9),
		boundaries_4=c(2077.8, 2716.2),
		boundaries_5=c(2151.0, 2751.0),
		boundaries_6=c(2158.6, 2775.4),
		boundaries_7=c(2209.3, 2793.7),
		boundaries_8=c(2239.9, 2817.1),
		knots_3=c(2349, 2402, 2446, 2493),
		knots_4=c(2378, 2436, 2481, 2530),
		knots_5=c(2414, 2471, 2518, 2568),
		knots_6=c(2440, 2495, 2538, 2587),
		knots_7=c(2463, 2521, 2570, 2620),
		knots_8=c(2477, 2534, 2583, 2634),
		loss.hoss_3=c(2114, 2623),
		loss.hoss_4=c(2131, 2663),
		loss.hoss_5=c(2201, 2701),
		loss.hoss_6=c(2210, 2724),
		loss.hoss_7=c(2258, 2745),
		loss.hoss_8=c(2288, 2769)),
	MATHEMATICS.2016=list(
		boundaries_3=c(2001.9, 2831.1),
		boundaries_4=c(2015.6, 2908.4),
		boundaries_5=c(2015.4, 2970.6),
		boundaries_6=c(2022.2, 2991.8),
		boundaries_7=c(2022.4, 3049.6),
		boundaries_8=c(2025.0, 3081.0),
		knots_3=c(2374, 2421, 2457.6, 2498),
		knots_4=c(2410, 2459, 2497, 2539),
		knots_5=c(2424, 2478, 2521, 2567),
		knots_6=c(2444, 2505, 2550, 2598),
		knots_7=c(2457, 2523, 2568, 2619),
		knots_8=c(2461, 2530, 2587, 2649),
		loss.hoss_3=c(2071, 2762),
		loss.hoss_4=c(2090, 2834),
		loss.hoss_5=c(2095, 2891),
		loss.hoss_6=c(2103, 2911),
		loss.hoss_7=c(2108, 2964),
		loss.hoss_8=c(2113, 2993)),
	MATHEMATICS=list(
		boundaries_3=c(2145.8, 2664.2),
		boundaries_4=c(2158.5, 2704.5),
		boundaries_5=c(2170.9, 2748.1),
		boundaries_6=c(2183.7, 2799.3),
		boundaries_7=c(2197.2, 2830.8),
		boundaries_8=c(2205.3, 2855.7),
		knots_3=c(2370, 2416, 2453, 2493),
		knots_4=c(2405, 2452, 2491, 2531),
		knots_5=c(2424, 2474, 2517, 2563),
		knots_6=c(2437, 2495, 2537, 2583),
		knots_7=c(2453, 2515, 2562, 2613),
		knots_8=c(2456, 2523, 2577, 2637),
		loss.hoss_3=c(2189, 2621),
		loss.hoss_4=c(2204, 2659),
		loss.hoss_5=c(2219, 2700),
		loss.hoss_6=c(2235, 2748),
		loss.hoss_7=c(2250, 2778),
		loss.hoss_8=c(2265, 2802)))

SGPstateData[["SD"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653)),
	MATHEMATICS.2016=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653)),
	ELA=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668)),
	ELA.2016=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668)))
#	list(MATHEMATICS=list(    Assessment transition to SBAC in 2014-2015
#		GRADE_3=c(530, 600, 668),
#		GRADE_4=c(548, 618, 684),
#		GRADE_5=c(582, 637, 699),
#		GRADE_6=c(601, 661, 728),
#		GRADE_7=c(619, 678, 742),
#		GRADE_8=c(625, 687, 754),
#		GRADE_11=c(645, 715, 781)),
#	READING=list(
#		GRADE_3=c(544, 594, 644),
#		GRADE_4=c(539, 598, 644),
#		GRADE_5=c(540, 597, 648),
#		GRADE_6=c(552, 600, 656),
#		GRADE_7=c(553, 600, 651),
#		GRADE_8=c(554, 600, 650),
#		GRADE_11=c(566, 604, 656)))

SGPstateData[["SD"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#	Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["SD"]][["Growth"]][["Levels"]] <- c("Much Below Average", "Below Average", "Typical", "Above Average", "Much Above Average")

SGPstateData[["SD"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["SD"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(20, 40, 61, 81),
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["SD"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Smarter Balanced Assessment",
#	Assessment_Name="South Dakota State Test of Educational Progress",
	Assessment_Abbreviation="SBAC",
#	Assessment_Abbreviation="STEP",
	Organization=list(
		Name="South Dakota Department of Education",
		Abbreviation="SDDOE",
		URL="www.doe.sd.gov",
		Contact="DOE.Accountability@state.sd.us"),
	Content_Areas=c("Mathematics", "ELA"),
#	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8),
#	Grades_Tested=c(3,4,5,6,7,8,11),
	Assessment_Years=c("2015", "2016"),
#	Assessment_Years=c("2009", "2010", "2011", "2012", "2013", "2014"),
	Test_Vendor="AIR",
#	Test_Vendor="Pearson",
	Test_Season="Spring")

SGPstateData[["SD"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=as.character(2009:2014),
									READING=as.character(2009:2014)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=as.character(2009:2014),
									READING=as.character(2009:2014)),
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
#	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"),
	Growth_Level_Labels=list(
		"Much Below"="Much Below Average",
		"Below"="Below Average",
		"Typical"="Typical",
		"Above"="Above Average",
		"Much Above"="Much Above Average"))
#		"Below Basic"="Below Basic",
#		"Basic"="Basic",
#		"Proficient"="Proficient",
#		"Advanced"="Advanced"))

SGPstateData[["SD"]][['SGP_Configuration']] <- list(
				Show_Fan_Growth_Labels=FALSE
)

#########################################################
### UTAH
#########################################################

SGPstateData[["UT"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		ELA.2014=list(
			boundaries_3=c(10, 1080),
			boundaries_4=c(10, 1080),
			boundaries_5=c(10, 1080),
			boundaries_6=c(10, 1080),
			boundaries_7=c(10, 1080),
			boundaries_8=c(10, 1080),
			boundaries_9=c(10, 1080),
			boundaries_10=c(10, 1080),
			boundaries_11=c(10, 1080),
			knots_3=c(263, 307, 343, 383),
			knots_4=c(293, 343, 382, 425),
			knots_5=c(330, 379, 417, 457),
			knots_6=c(357, 404, 442, 484),
			knots_7=c(366, 415, 456, 500),
			knots_8=c(375, 430, 476, 521),
			knots_9=c(385, 446, 492, 541),
			knots_10=c(394, 459, 507, 558),
			knots_11=c(398, 462, 514, 567),
			loss.hoss_3=c(100, 999),
			loss.hoss_4=c(100, 999),
			loss.hoss_5=c(100, 999),
			loss.hoss_6=c(100, 999),
			loss.hoss_7=c(100, 999),
			loss.hoss_8=c(100, 999),
			loss.hoss_9=c(100, 999),
			loss.hoss_10=c(100, 999),
			loss.hoss_11=c(100, 999)),
		ELA=list(
			boundaries_3=c(123.1, 205.9),
			boundaries_4=c(123.1, 205.9),
			boundaries_5=c(123.1, 205.9),
			boundaries_6=c(123.1, 205.9),
			boundaries_7=c(123.1, 205.9),
			boundaries_8=c(123.1, 205.9),
			boundaries_9=c(123.1, 205.9),
			boundaries_10=c(123.1, 205.9),
			boundaries_11=c(123.1, 205.9),
			knots_3=c(159, 164, 169, 174),
			knots_4=c(159, 164, 170, 175),
			knots_5=c(159, 164, 169, 174),
			knots_6=c(159, 165, 170, 175),
			knots_7=c(160, 167, 172, 178),
			knots_8=c(161, 167, 172, 177),
			knots_9=c(161, 167, 172, 177),
			knots_10=c(161, 167, 171, 176),
			knots_11=c(161, 167, 171, 176),
			loss.hoss_3=c(130, 199),
			loss.hoss_4=c(130, 199),
			loss.hoss_5=c(130, 199),
			loss.hoss_6=c(130, 199),
			loss.hoss_7=c(130, 199),
			loss.hoss_8=c(130, 199),
			loss.hoss_9=c(130, 199),
			loss.hoss_10=c(130, 199),
			loss.hoss_11=c(130, 199)),

		MATHEMATICS.2014=list(
			boundaries_3=c(75, 975),
			boundaries_4=c(75, 975),
			boundaries_5=c(75, 975),
			boundaries_6=c(75, 975),
			boundaries_7=c(75, 975),
			boundaries_8=c(75, 975),
			knots_3=c(285, 306, 323, 341),
			knots_4=c(312, 338, 358, 380),
			knots_5=c(338, 368, 391, 416),
			knots_6=c(367, 401, 428, 457),
			knots_7=c(392, 427, 456, 487),
			knots_8=c(422, 464, 498, 536),
			#knots_8=c(420, 462, 496, 533),
			loss.hoss_3=c(150, 900),
			loss.hoss_4=c(150, 900),
			loss.hoss_5=c(150, 900),
			loss.hoss_6=c(150, 900),
			loss.hoss_7=c(150, 900),
			loss.hoss_8=c(150, 900)),
		MATHEMATICS=list(
			boundaries_3=c(123.1, 205.9),
			boundaries_4=c(123.1, 205.9),
			boundaries_5=c(123.1, 205.9),
			boundaries_6=c(123.1, 205.9),
			boundaries_7=c(123.1, 205.9),
			boundaries_8=c(123.1, 205.9),
			knots_3=c(157, 164, 169, 175),
			knots_4=c(158, 164, 170, 176),
			knots_5=c(157, 164, 169, 175),
			knots_6=c(157, 164, 169, 175),
			knots_7=c(160, 165, 170, 175),
			knots_8=c(157, 163, 168, 173),
			loss.hoss_3=c(130, 199),
			loss.hoss_4=c(130, 207),
			loss.hoss_5=c(130, 199),
			loss.hoss_6=c(130, 199),
			loss.hoss_7=c(130, 199),
			loss.hoss_8=c(130, 199)),

		SCIENCE.2014=list(
			boundaries_4=c(65, 1080),
			boundaries_5=c(65, 1080),
			boundaries_6=c(65, 1080),
			boundaries_7=c(65, 1080),
			boundaries_8=c(65, 1080),
			knots_4=c(811, 829, 843, 858),
			knots_5=c(817, 832, 845, 858),
			knots_6=c(806, 828, 846, 867),
			knots_7=c(810, 828, 842, 858),
			knots_8=c(813, 830, 845, 861),
			loss.hoss_4=c(150, 999),
			loss.hoss_5=c(150, 999),
			loss.hoss_6=c(150, 999),
			loss.hoss_7=c(150, 999),
			loss.hoss_8=c(150, 999)),
		SCIENCE=list(
			boundaries_4=c(123.1, 205.9),
			boundaries_5=c(123.1, 205.9),
			boundaries_6=c(123.1, 205.9),
			boundaries_7=c(123.1, 205.9),
			boundaries_8=c(123.1, 205.9),
			knots_4=c(154, 160, 166, 171),
			knots_5=c(156, 162, 167, 172),
			knots_6=c(156, 162, 168, 173),
			knots_7=c(156, 162, 168, 173),
			knots_8=c(155, 162, 167, 173),
			loss.hoss_4=c(130, 199),
			loss.hoss_5=c(130, 199),
			loss.hoss_6=c(130, 199),
			loss.hoss_7=c(130, 199),
			loss.hoss_8=c(130, 199)),

		PRE_ALGEBRA=list(
			knots_EOCT=c(156, 163, 168, 174),
			boundaries_EOCT=c(123, 206),
			loss.hoss_EOCT=c(130, 199)),

		ALGEBRA_I=list(
			knots_EOCT=c(153, 160, 165, 171),
			boundaries_EOCT=c(117, 207),
			loss.hoss_EOCT=c(125, 199)),

		ALGEBRA_II=list(loss.hoss_EOCT=c(130, 199)),

		GEOMETRY=list(loss.hoss_EOCT=c(130, 199)),

		SEC_MATH_I.2014=list(
			knots_EOCT=c(431, 486, 528, 571),
			boundaries_EOCT=c(75, 975),
			loss.hoss_EOCT=c(150, 900)),

		SEC_MATH_II.2014=list(
			knots_EOCT=c(462, 518, 565, 619),
			boundaries_EOCT=c(75, 975),
			loss.hoss_EOCT=c(150, 900)),

		SEC_MATH_III.2014=list(
			knots_EOCT=c(502, 565, 614, 666),
			boundaries_EOCT=c(75, 975),
			loss.hoss_EOCT=c(150, 900)),

		EARTH_SCIENCE.2014=list(
			knots_EOCT=c(805, 826, 843, 862),
			boundaries_EOCT=c(615, 1030),
			loss.hoss_EOCT=c(650, 999)),
		EARTH_SCIENCE=list(
			knots_EOCT=c(155, 161, 166, 172),
			boundaries_EOCT=c(123, 206),
			loss.hoss_EOCT=c(130, 199)),

		BIOLOGY.2014=list(
			knots_EOCT=c(806, 826, 840, 857),
			boundaries_EOCT=c(615, 1030),
			loss.hoss_EOCT=c(650, 999)),
		BIOLOGY=list(
			knots_EOCT=c(156, 162, 167, 173),
			boundaries_EOCT=c(123, 206),
			loss.hoss_EOCT=c(130, 199)),

		CHEMISTRY.2014=list(
			knots_EOCT=c(804, 829, 847, 869),
			boundaries_EOCT=c(615, 1030),
			loss.hoss_EOCT=c(650, 999)),
		CHEMISTRY=list(
			knots_EOCT=c(151, 158, 163, 168),
			boundaries_EOCT=c(123, 206),
			loss.hoss_EOCT=c(130, 199)),

		PHYSICS.2014=list(
			knots_EOCT=c(804, 827, 847, 869),
			boundaries_EOCT=c(615, 1030),
			loss.hoss_EOCT=c(650, 999)),
		PHYSICS=list(
			knots_EOCT=c(155, 161, 166, 172),
			boundaries_EOCT=c(123, 206),
			loss.hoss_EOCT=c(130, 199)))

SGPstateData[["UT"]][["Achievement"]][["Cutscores"]] <-
	list(
	ELA.2014=list(
		GRADE_3=c(334, 406),
		GRADE_4=c(378, 442),
		GRADE_5=c(410, 465),
		GRADE_6=c(434, 493),
		GRADE_7=c(450, 514),
		GRADE_8=c(471, 533),
		GRADE_9=c(487, 559),
		GRADE_10=c(498, 574),
		GRADE_11=c(513, 591)),
	ELA=list(
		GRADE_3=c(160, 168),
		GRADE_4=c(160, 168),
		GRADE_5=c(160, 168),
		GRADE_6=c(160, 168),
		GRADE_7=c(160, 170),
		GRADE_8=c(160, 168),
		GRADE_9=c(160, 170),
		GRADE_10=c(160, 169),
		GRADE_11=c(160, 168)),

	MATHEMATICS.2014=list(
		GRADE_3=c(317, 337),
		GRADE_4=c(349, 376),
		GRADE_5=c(384, 416),
		GRADE_6=c(432, 464),
		GRADE_7=c(450, 499),
		GRADE_8=c(499, 554)),
	MATHEMATICS=list(
		GRADE_3=c(160, 168),
		GRADE_4=c(160, 167),
		GRADE_5=c(160, 166),
		GRADE_6=c(160, 166),
		GRADE_7=c(160, 169),
		GRADE_8=c(160, 168)),

	SCIENCE.2014=list(
		GRADE_4=c(840, 856),
		GRADE_5=c(840, 856),
		GRADE_6=c(840, 864),
		GRADE_7=c(840, 854),
		GRADE_8=c(840, 854)),
	SCIENCE=list(
		GRADE_4=c(160, 167),
		GRADE_5=c(160, 168),
		GRADE_6=c(160, 167),
		GRADE_7=c(160, 167),
		GRADE_8=c(160, 167)),

	PRE_ALGEBRA=list(
		GRADE_EOCT=c(160, 168)),
	ALGEBRA_I=list(
		GRADE_EOCT=c(160, 168)),
	ALGEBRA_II=list(
		GRADE_EOCT=c(160, 168)),
	GEOMETRY=list(
		GRADE_EOCT=c(160, 168)),
	SEC_MATH_I.2014=list(
		GRADE_EOCT=c(535, 591)),
	SEC_MATH_II.2014=list(
		GRADE_EOCT=c(584, 648)),
	SEC_MATH_III.2014=list(
		GRADE_EOCT=c(611, 680)),

	EARTH_SCIENCE.2014=list(
		GRADE_EOCT=c(840, 866)),
	EARTH_SCIENCE=list(
		GRADE_EOCT=c(160, 167)),

	BIOLOGY.2014=list(
		GRADE_EOCT=c(840, 858)),
	BIOLOGY=list(
		GRADE_EOCT=c(160, 167)),

	CHEMISTRY.2014=list(
		GRADE_EOCT=c(840, 865)),
	CHEMISTRY=list(
		GRADE_EOCT=c(160, 166)),

	PHYSICS.2014=list(
		GRADE_EOCT=c(840, 878)),
	PHYSICS=list(
		GRADE_EOCT=c(160, 169)))


SGPstateData[["UT"]][["Achievement"]][["Levels"]] <-
	list(
		Labels=c("BP", "P", "A"),
		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["UT"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High") #  Based on 'official' school growth levels (60th p)

SGPstateData[["UT"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts=c(40, 60),
		Labels=c("1st - 39th", "40th - 60th", "61st - 99th")) #  Changed to 60th percentile cut per conversation with Elena and Chris D. 10/01/12

SGPstateData[["UT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["UT"]][["SGP_Configuration"]] <- list(
	sgp.cohort.size=3000,
	sgp.less.than.sgp.cohort.size.return="<3000",
	max.order.for.percentile=5,
	max.order.for.projection=4, # All available SAGE per R.R. 8/13/18
	sgPlot.use.alternate.student.id="SSID")

SGPstateData[["UT"]][["SGP_Configuration"]][["grade.projection.sequence"]] <-
	list(
		ELA = as.character(3:10),
		MATHEMATICS= c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
		SEC_MATH_I = c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
		SEC_MATH_II= c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),
		SEC_MATH_III=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"),

# 		PRE_ALGEBRA=c("3", "4", "5", "6", "7", "EOCT", "EOCT", "EOCT", "EOCT"),
# 		ALGEBRA_I= c("EOCT", "EOCT", "EOCT", "EOCT"), # No rep('MATHEMATICS', 4), for 2013.  There are almost no kids in the data
# 		GEOMETRY = c("EOCT", "EOCT", "EOCT", "EOCT"),
# 		ALGEBRA_II=c("6", "7", "EOCT", "EOCT", "EOCT", "EOCT"),

		SCIENCE = c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT", "EOCT"),
		EARTH_SCIENCE=c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT", "EOCT"),
		BIOLOGY = c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT", "EOCT"),
		CHEMISTRY=c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT", "EOCT"),
		PHYSICS = c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT", "EOCT"),

		SCIENCE_BIO = c("4", "5", "6", "7", "8", "EOCT"),
		CHEM_BIO =c("EOCT", "EOCT"),
		PHYS_BIO =c("EOCT", "EOCT"),
		PHYS_CHEM =c("EOCT", "EOCT"),
		BIO_PHYS = c("4", "5", "6", "7", "8", "EOCT", "EOCT", "EOCT"))

SGPstateData[["UT"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <-
	list(
		ELA = rep("ELA", 8),
		MATHEMATICS= c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "SEC_MATH_I", "SEC_MATH_II", "SEC_MATH_III"),
		SEC_MATH_I = c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "SEC_MATH_I", "SEC_MATH_II", "SEC_MATH_III"),
		SEC_MATH_II= c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "SEC_MATH_I", "SEC_MATH_II", "SEC_MATH_III"),
		SEC_MATH_III=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "SEC_MATH_I", "SEC_MATH_II", "SEC_MATH_III"),

# 		PRE_ALGEBRA=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "PRE_ALGEBRA", "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
# 		ALGEBRA_I= c("PRE_ALGEBRA", "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
# 		GEOMETRY = c("PRE_ALGEBRA", "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),
# 		ALGEBRA_II=c("MATHEMATICS", "MATHEMATICS", "PRE_ALGEBRA", "ALGEBRA_I", "GEOMETRY", "ALGEBRA_II"),

		SCIENCE = c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'CHEMISTRY', 'PHYSICS'),
		EARTH_SCIENCE=c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'CHEMISTRY', 'PHYSICS'),
		BIOLOGY = c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'CHEMISTRY', 'PHYSICS'),
		CHEMISTRY=c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'CHEMISTRY', 'PHYSICS'),
		PHYSICS = c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'CHEMISTRY', 'PHYSICS'),

		SCIENCE_BIO = c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'BIOLOGY'),
		BIO_PHYS = c('SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'SCIENCE', 'EARTH_SCIENCE', 'BIOLOGY', 'PHYSICS'),
		CHEM_BIO =c('CHEMISTRY', 'BIOLOGY'),
		PHYS_BIO =c('PHYSICS', 'BIOLOGY'),
		PHYS_CHEM =c('PHYSICS', 'CHEMISTRY'))


SGPstateData[["UT"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <-
	list(
		ELA=rep(1L, 7),
		MATHEMATICS= rep(1L, 8), # 8 is one fewer than the length of content_area.projection.sequence and grade.projection.sequence
		SEC_MATH_I = rep(1L, 8),
		SEC_MATH_II= rep(1L, 8),
		SEC_MATH_III=rep(1L, 8),
# 		PRE_ALGEBRA=rep(1L, 8),
# 		ALGEBRA_I= rep(1L, 3),
# 		GEOMETRY = rep(1L, 3),
# 		ALGEBRA_II=rep(1L, 5),

		SCIENCE = rep(1L, 8),
		EARTH_SCIENCE =rep(1L, 8),
		BIOLOGY = rep(1L, 8),
		CHEMISTRY=rep(1L, 8),
		PHYSICS = rep(1L, 8),

		SCIENCE_BIO = rep(1L, 5),
		CHEM_BIO = 1L,
		PHYS_BIO = 1L,
		PHYS_CHEM= 1L,
		BIO_PHYS = rep(1L, 7))

SGPstateData[["UT"]][['SGP_Progression_Preference']] <- data.table(
	SGP_PROJECTION_GROUP = c("EARTH_SCIENCE", "SCIENCE_BIO",    "BIOLOGY", "BIO_PHYS",    "CHEMISTRY", "CHEM_BIO",    "PHYSICS", "PHYS_BIO", "PHYS_CHEM"),
	PREFERENCE = c(1,2, 1,2, 1,2, 1,2,3), key = "SGP_PROJECTION_GROUP")


SGPstateData[["UT"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Student Assessment of Growth and Excellence",
		Assessment_Abbreviation="SAGE",
		Organization=list(
		Name="Utah State Office of Education",
		Abbreviation="USOE",
		URL="www.schools.utah.gov",
		Contact="(801) 538-7811"),
		Content_Areas=c("ELA", "MATHEMATICS", "SEC_MATH_I", "SEC_MATH_II", "SEC_MATH_III", "SCIENCE", "EARTH_SCIENCE", "BIOLOGY", "CHEMISTRY", "PHYSICS"),
		Scale_Change=list(ELA="2014", MATHEMATICS="2014", SCIENCE="2014", EARTH_SCIENCE="2014", BIOLOGY="2014", CHEMISTRY="2014", PHYSICS="2014", SEC_MATH_I="2014", SEC_MATH_II="2014", SEC_MATH_III="2014"), # Add SEC_MATH_* so that it forces projections with the correct # of priors.
		Grades_Tested=c(3,4,5,6,7,8,11),
		Test_Season="Spring",
		Assessment_Years=c("2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"), # 2005-2007 removed in 2013
		Test_Vendor="AIR")

# SGPstateData[["UT"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
# 	list(
# 		# Year="2014",  # This controls when/if Target scale scores are equated.
# 		Assessment_Abbreviation="CRT",
# 		Assessment_Abbreviation.2014="SAGE",
# 		Assessment_Name="Criterion Referenced Tests",
# 		Assessment_Name.2014_2015="Student Assessment of Growth and Excellence",
# 		Achievement_Levels=list(
# 			Labels=c("BP", "P", "A"),
# 			Proficient=c("Not Proficient", "Proficient", "Proficient")),
# 		Achievement_Levels.2014=list(
# 			Labels=c("BP", "P", "A"),
# 			Proficient=c("Not Proficient", "Proficient", "Proficient")),
# 		Achievement_Level_Labels=list(
# 			"Below Proficient"="BP",
# 			"Proficient"="P",
# 			"Advanced"="A"),
# 		Achievement_Level_Labels.2014=list(
# 			"Below Proficient"="BP",
# 			"Proficient"="P",
# 			"Advanced"="A"),
# 		Content_Areas_Labels=list(ELA = "ELA",
# 			MATHEMATICS = "Math", PRE_ALGEBRA = "Pre-Algebra", ALGEBRA_I = "Algebra I", GEOMETRY = "Geometry", ALGEBRA_II = "Algebra II",
# 			SCIENCE ="Science", EARTH_SCIENCE = "Earth Science", BIOLOGY = "Biology", CHEMISTRY = "Chemistry", PHYSICS = "Physics"),
# 		Content_Areas_Labels.2014=list(ELA = "ELA",
# 			MATHEMATICS = "Math", SEC_MATH_I = "Secondary Math I", SEC_MATH_II = "Secondary Math II", SEC_MATH_III = "Secondary Math III",
# 			SCIENCE ="Science", EARTH_SCIENCE = "Earth Science", BIOLOGY = "Biology", CHEMISTRY = "Chemistry", PHYSICS = "Physics"),
# 		Content_Areas_Domains=list(ELA="ELA",
# 			MATHEMATICS="MATHEMATICS", PRE_ALGEBRA="MATHEMATICS", ALGEBRA_I= "MATHEMATICS", GEOMETRY = "MATHEMATICS", ALGEBRA_II="MATHEMATICS",
# 			SCIENCE="SCIENCE", EARTH_SCIENCE = "SCIENCE", BIOLOGY = "SCIENCE", CHEMISTRY="SCIENCE", PHYSICS = "SCIENCE"),
# 		Content_Areas_Domains.2014=list(ELA="ELA",
# 			MATHEMATICS="MATHEMATICS", SEC_MATH_I = "MATHEMATICS", SEC_MATH_II = "MATHEMATICS", SEC_MATH_III = "MATHEMATICS",
# 			SCIENCE="SCIENCE", EARTH_SCIENCE = "SCIENCE", BIOLOGY = "SCIENCE", CHEMISTRY="SCIENCE", PHYSICS = "SCIENCE"),
# 		Vertical_Scale="No",
# 		Vertical_Scale.2014="No",
# 		Grades_Tested=c(3,4,5,6,7,8,11),
# 		Grades_Tested.2014=c(3,4,5,6,7,8,11),
# 		Transformed_Achievement_Level_Cutscores=list(
# 			ELA=c(130, 160, 170, 200), MATHEMATICS=c(130, 160, 170, 200), SCIENCE=c(130, 160, 170, 200),
# 			PRE_ALGEBRA=c(130, 160, 170, 200), ALGEBRA_I=c(130, 160, 170, 200), GEOMETRY=c(130, 160, 170, 200), ALGEBRA_II=c(130, 160, 170, 200),
# 			EARTH_SCIENCE=c(130, 160, 170, 200), BIOLOGY=c(130, 160, 170, 200), CHEMISTRY=c(130, 160, 170, 200), PHYSICS=c(130, 160, 170, 200)),
# 		Transformed_Achievement_Level_Cutscores.2014=list(
# 			ELA=c(130, 160, 170, 200), MATHEMATICS=c(130, 160, 170, 200), SCIENCE=c(130, 160, 170, 200),
# 			SEC_MATH_I =c(130, 160, 170, 200), SEC_MATH_II =c(130, 160, 170, 200), SEC_MATH_III=c(130, 160, 170, 200),
# 			EARTH_SCIENCE=c(130, 160, 170, 200), BIOLOGY=c(130, 160, 170, 200), CHEMISTRY=c(130, 160, 170, 200), PHYSICS=c(130, 160, 170, 200)),
# 		Grades_Reported=list(
# 			ELA=as.character(3:11), MATHEMATICS= as.character(3:7), SCIENCE= as.character(4:8),
# 			PRE_ALGEBRA="EOCT", ALGEBRA_I= "EOCT", GEOMETRY = "EOCT", ALGEBRA_II="EOCT",
# 			EARTH_SCIENCE = "EOCT", BIOLOGY = "EOCT", CHEMISTRY="EOCT", PHYSICS = "EOCT"),
# 		Grades_Reported.2014=list(
# 			ELA=as.character(3:11), MATHEMATICS= as.character(3:8), SCIENCE= as.character(4:8),
# 			SEC_MATH_I = "EOCT", SEC_MATH_II = "EOCT", SEC_MATH_III = "EOCT",
# 			EARTH_SCIENCE = "EOCT", BIOLOGY = "EOCT", CHEMISTRY="EOCT", PHYSICS = "EOCT"),
# 		Grades_Reported_Domains=list(ELA=as.character(3:11), MATHEMATICS=c(3:7, "EOCT"), SCIENCE= c(4:8, "EOCT")),
# 		Grades_Reported_Domains.2014=list(ELA=as.character(3:11), MATHEMATICS=c(3:8, "EOCT"), SCIENCE= c(4:8, "EOCT"))
# 	)

# require(grid)

SGPstateData[["UT"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
									MATHEMATICS=as.character(2008:2013), ### NOTE non-vertical up to 2013
									ELA=as.character(2008:2013), ### NOTE non-vertical up to 2013
									SCIENCE=as.character(2008:2020),
									EARTH_SCIENCE=as.character(2008:2020),
									BIOLOGY=as.character(2008:2020),
									CHEMISTRY=as.character(2008:2020),
									PHYSICS=as.character(2008:2020)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
									MATHEMATICS=as.character(2008:2013), ### NOTE non-vertical up to 2013
									ELA=as.character(2008:2013), ### NOTE non-vertical up to 2013
									SCIENCE=as.character(2008:2020),
									EARTH_SCIENCE=as.character(2008:2020),
									BIOLOGY=as.character(2008:2020),
									CHEMISTRY=as.character(2008:2020),
									PHYSICS=as.character(2008:2020)),
	Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE, SCIENCE=FALSE, EARTH_SCIENCE=FALSE, BIOLOGY=FALSE, CHEMISTRY=FALSE, PHYSICS=FALSE),
	Content_Areas_Labels=list(ELA = "ELA",
		MATHEMATICS = "Math", SEC_MATH_I = "Secondary I", SEC_MATH_II = "Secondary II", SEC_MATH_III = "Secondary III",
		# PRE_ALGEBRA = "Pre-Algebra", ALGEBRA_I = "Algebra I", GEOMETRY = "Geometry", ALGEBRA_II = "Algebra II",
		SCIENCE ="Science", EARTH_SCIENCE = "Earth Science", BIOLOGY = "Biology", CHEMISTRY = "Chemistry", PHYSICS = "Physics"),
	Content_Areas_Domains=list(ELA="ELA",  ## Each Domain should be in CANONICAL PROGRESSION ORDER
		MATHEMATICS="MATHEMATICS", SEC_MATH_I = "MATHEMATICS", SEC_MATH_II = "MATHEMATICS", SEC_MATH_III = "MATHEMATICS",
		# PRE_ALGEBRA="MATHEMATICS", ALGEBRA_I= "MATHEMATICS", GEOMETRY = "MATHEMATICS", ALGEBRA_II="MATHEMATICS",
		SCIENCE="SCIENCE", EARTH_SCIENCE = "SCIENCE", BIOLOGY = "SCIENCE", CHEMISTRY="SCIENCE", PHYSICS = "SCIENCE"),

	Grades_Reported=list(ELA=as.character(3:11),
		MATHEMATICS= as.character(3:8), SEC_MATH_I = "EOCT", SEC_MATH_II = "EOCT", SEC_MATH_III = "EOCT",
		# PRE_ALGEBRA="EOCT", ALGEBRA_I= "EOCT", GEOMETRY = "EOCT", ALGEBRA_II="EOCT",
		SCIENCE= as.character(4:8), EARTH_SCIENCE = "EOCT", BIOLOGY = "EOCT", CHEMISTRY="EOCT", PHYSICS = "EOCT"),
	Grades_Reported_Domains=list(ELA=as.character(3:11), MATHEMATICS=c(3:8, "EOCT"), SCIENCE= c(4:8, "EOCT")),
	Earliest_Year_Reported=list(ELA='2014', MATHEMATICS='2014', SEC_MATH_I = "2014", SEC_MATH_II = "2014", SEC_MATH_III = "2014",
				SCIENCE='2014', EARTH_SCIENCE = "2014", BIOLOGY = "2014", CHEMISTRY="2014", PHYSICS = "2014"),
	Achievement_Level_Labels=list(
		"Below Proficient"="BP",
		"Proficient"="P",
		"Advanced"="A"),
	Include_Front_Page_in_School_Catalog=FALSE,
	sgPlot.year.span = 3, # Number of years to represent in Chart.  Default is 5.  Here 3 = 2 test years and 1 future year (growth proj fan)
	Two_Page_Layout=list(
		Four_Charts=list(
			report.vp = viewport(layout = grid.layout(7, 3, widths = unit(c(0.125, 8.3, 0.075), rep("inches", 3)),
													 heights = unit(c(0.4, 0.75, 4, 0.5, 4, 0.85, 0.5), rep("inches", 7)))),
			page.content_areas = list(1:2, 3:4),
			content_area_1.vp = viewport(layout.pos.row=3, layout.pos.col=2),
			content_area_2.vp = viewport(layout.pos.row=5, layout.pos.col=2),
			content_area_3.vp = viewport(layout.pos.row=3, layout.pos.col=2),
			content_area_4.vp = viewport(layout.pos.row=5, layout.pos.col=2),
			top.border.vp = viewport(layout.pos.row=1, layout.pos.col=1:3),
			bottom.border.vp = viewport(layout.pos.row=7, layout.pos.col=1:3)
			# left.legend.vp <- viewport(layout.pos.row=2:6, layout.pos.col=1) # No left legend for UT, but it is an option.
		),
		Five_Charts=list(
			report.vp = viewport(layout = grid.layout(9, 3, widths = unit(c(0.125, 8.3, 0.075), rep("inches", 3)),
													 heights = unit(c(0.35, 0.1, 3.256, 0.14, 3.256, 0.14, 3.256, 0.1, 0.4), rep("inches", 9)))),
			page.content_areas = list(1:3, 4:5),
			content_area_1.vp = viewport(layout.pos.row=3, layout.pos.col=2),  # 1st Page
			content_area_2.vp = viewport(layout.pos.row=5, layout.pos.col=2),
			content_area_3.vp = viewport(layout.pos.row=7, layout.pos.col=2),
			content_area_4.vp = viewport(layout.pos.row=3, layout.pos.col=2),  # 2nd Page
			content_area_5.vp = viewport(layout.pos.row=5, layout.pos.col=2),
			top.border.vp = viewport(layout.pos.row=1, layout.pos.col=1:3),
			bottom.border.vp = viewport(layout.pos.row=9, layout.pos.col=1:3)
			# left.legend.vp <- viewport(layout.pos.row=2:6, layout.pos.col=1) # No left legend for UT, but it is an option.
		)
	))

SGPstateData[["UT"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/UT_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))
load("SGP_Norm_Group_Preference/UT_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["UT"]][["SGP_Norm_Group_Preference"]] <- UT_SGP_Norm_Group_Preference


#########################################################
### VERMONT
#########################################################

load("Knots_Boundaries/VT_Knots_Boundaries.Rdata")
SGPstateData[["VT"]][["Achievement"]][["Knots_Boundaries"]] <- VT_Knots_Boundaries

#SGPstateData[["VT"]][["Achievement"]][["Cutscores"]] <-
#	list(
#		MATHEMATICS=list(
#			GRADE_3=c(32, 40, 53),
#			GRADE_4=c(31, 40, 55),
#			GRADE_5=c(33, 40, 54),
#			GRADE_6=c(33, 40, 53),
#			GRADE_7=c(34, 40, 52),
#			GRADE_8=c(34, 40, 52),
#			GRADE_11=c(34, 40, 52)),
#		READING=list(
#			GRADE_3=c(31, 40, 57),
#			GRADE_4=c(31, 40, 56),
#			GRADE_5=c(30, 40, 56),
#			GRADE_6=c(29, 40, 59),
#			GRADE_7=c(29, 40, 60),
#			GRADE_8=c(28, 40, 59),
#			GRADE_11=c(30, 40, 54)))

SGPstateData[["VT"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(2381, 2436, 2501),
			GRADE_4=c(2411, 2485, 2549),
			GRADE_5=c(2455, 2528, 2579),
			GRADE_6=c(2473, 2552, 2610),
			GRADE_7=c(2484, 2567, 2635),
			GRADE_8=c(2504, 2586, 2653),
			GRADE_9=c(2517, 2601, 2676)),
		READING=list(
			GRADE_3=c(2367, 2432, 2490),
			GRADE_4=c(2416, 2473, 2533),
			GRADE_5=c(2442, 2502, 2582),
			GRADE_6=c(2457, 2531, 2618),
			GRADE_7=c(2479, 2552, 2649),
			GRADE_8=c(2487, 2567, 2668),
			GRADE_9=c(2489, 2571, 2672)))

SGPstateData[["VT"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient With Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["VT"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["VT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["VT"]][["Growth"]][["Cutscores"]] <- list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["VT"]][["Assessment_Program_Information"]] <- list(
		Assessment_Name="Smarter Balanced Assessment",
		Assessment_Abbreviation="SBA",
		Organization=list(
		Name="Vermont Agency of Education",
		Abbreviation="VTAOE",
		URL="http://education.vermont.gov/",
		Contact="802-479-1305"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8,9),
		Assessment_Years=c("2015", "2016", "2017", "2018"),
		Test_Season="Spring",
		Test_Vendor="AIR")

SGPstateData[["VT"]][["Student_Report_Information"]] <- list(
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9), READING=c(3,4,5,6,7,8,9)),
		Achievement_Level_Labels=list(
			"Substantially Below Proficient"="Below Proficient",
			"Partially Proficient"="Part Proficient",
			"Proficient"="Proficient",
			"Proficient With Distinction"="Distinction"))

SGPstateData[["VT"]][["SGP_Configuration"]] <- list(
		print.other.gp=TRUE,
		max.order.for.percentile=2)


#########################################################
### VIRGINIA
#########################################################

SGPstateData[["VA"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(
		MATHEMATICS=list(
			knots_3=c(431, 474, 519, 567),
			knots_4=c(411, 461, 504, 557),
			knots_5=c(426, 481, 533, 598),
			knots_6=c(355, 408, 457, 518),
			knots_7=c(341, 394, 440, 492),
			knots_8=c(405, 462, 509, 568),
			boundaries_3=c(19.2, 652.8),
			boundaries_4=c(24.7, 652.3),
			boundaries_5=c(-55.6, 659.6),
			boundaries_6=c(-42.4, 658.4),
			boundaries_7=c(-53.4, 659.4),
			boundaries_8=c(-45.7, 658.7),
			loss.hoss_3=c(72, 600),
			loss.hoss_4=c(77, 600),
			loss.hoss_5=c(4, 600),
			loss.hoss_6=c(16, 600),
			loss.hoss_7=c(6, 600),
			loss.hoss_8=c(13, 600)),
		ENGLISH_READING=list(
			knots_3=c(408, 454, 490, 540),
			knots_4=c(423, 470, 507, 556),
			knots_5=c(424, 465, 497, 551),
			knots_6=c(415, 457, 495, 534),
			knots_7=c(414, 461, 497, 543),
			knots_8=c(413, 455, 491, 536),
			boundaries_3=c(41.2, 650.8),
			boundaries_4=c(61.0, 649.0),
			boundaries_5=c(79.7, 647.3),
			boundaries_6=c(51.1, 649.9),
			boundaries_7=c(22.5, 652.5),
			boundaries_8=c(39.0, 651.0),
			loss.hoss_3=c(92, 600),
			loss.hoss_4=c(110, 600),
			loss.hoss_5=c(127, 600),
			loss.hoss_6=c(101, 600),
			loss.hoss_7=c(75, 600),
			loss.hoss_8=c(90, 600)),
		ALGEBRA_I=list(
			knots_3=c(431, 474, 519, 567),
			knots_4=c(411, 461, 504, 557),
			knots_5=c(426, 481, 533, 598),
			knots_6=c(355, 408, 457, 518),
			knots_7=c(341, 394, 440, 492),
			knots_8=c(405, 462, 509, 568),
			knots_EOC=c(408, 454, 490, 540),
			boundaries_3=c(19.2, 652.8),
			boundaries_4=c(24.7, 652.3),
			boundaries_5=c(-55.6, 659.6),
			boundaries_6=c(-42.4, 658.4),
			boundaries_7=c(-53.4, 659.4),
			boundaries_8=c(-45.7, 658.7),
			boundaries_EOC=c(171, 639),
			loss.hoss_3=c(72, 600),
			loss.hoss_4=c(77, 600),
			loss.hoss_5=c(4, 600),
			loss.hoss_6=c(16, 600),
			loss.hoss_7=c(6, 600),
			loss.hoss_8=c(13, 600),
			loss.hoss_EOC=c(210, 600)))

SGPstateData[["VA"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(312, 400, 500),
			GRADE_4=c(305, 400, 500),
			GRADE_5=c(311, 400, 500),
			GRADE_6=c(317, 400, 500),
			GRADE_7=c(314, 400, 500),
			GRADE_8=c(297, 400, 500),
			GRADE_EOC=c(300, 400, 500)),
		ENGLISH_READING=list(
			GRADE_3=c(311, 400, 500),
			GRADE_4=c(322, 400, 500),
			GRADE_5=c(339, 400, 500),
			GRADE_6=c(324, 400, 500),
			GRADE_7=c(323, 400, 500),
			GRADE_8=c(322, 400, 500),
			GRADE_EOC=c(300, 400, 500)),
		ALGEBRA_I=list(
			GRADE_EOC=c(300, 400, 500)),
		GEOMETRY=list(
			GRADE_EOC=c(300, 400, 500)),
		ALGEBRA_II=list(
			GRADE_EOC=c(300, 400, 500)))

SGPstateData[["VA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Failed", "Below Basic", "Basic", "Proficient", "Advanced", "Invalid Case"),
	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["VA"]][["Growth"]][["Levels"]] <- c("Low", "Moderate", "High")

SGPstateData[["VA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["VA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["VA"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Virginia Standards of Learning",
	Assessment_Abbreviation="SOL",
	Organization=list(
			Name="Virginia Department of Education",
			Abbreviation="VDOE",
			URL="www.doe.virginia.gov/",
			Contact="804-225-2102"),
	Content_Areas=c("Mathematics", "English-Reading"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Assessment_Years=c("2005_2006", "2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013"),
	Test_Vendor="Pearson")

SGPstateData[["VA"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(
								MATHEMATICS=paste(2005:2012, 2006:2013, sep="_"),
								ENGLISH_READING=paste(2005:2012, 2006:2013, sep="_")),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(
								MATHEMATICS=paste(2005:2012, 2006:2013, sep="_"),
								ENGLISH_READING=paste(2005:2012, 2006:2013, sep="_")),
	Vertical_Scale=list(MATHEMATICS=FALSE, ENGLISH_READING=FALSE),
	Content_Areas_Labels=list(MATHEMATICS="Math", ENGLISH_READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ENGLISH_READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Failed"="Failed",
		"Below Basic"="Below Basic",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

SGPstateData[["VA"]][["SGP_Configuration"]] <- list(sgp.config.drop.nonsequential.grade.progression.variables=FALSE)
SGPstateData[["VA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/VA_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))


#########################################################
### WASHINGTON
#########################################################

load("CSEM/Washington/Washington_CSEM.Rdata")
SGPstateData[["WA"]][["Achievement"]][["Knots_Boundaries"]] <- list(
	READING=list(
		knots_3=c(388, 406, 420, 434),
		knots_4=c(392, 405, 415, 428),
		knots_5=c(391, 407, 418, 433),
		knots_6=c(390, 403, 413, 425),
		knots_7=c(386, 400, 410, 422),
		knots_8=c(389, 404, 415, 428),
		knots_10=c(401, 418, 433, 451),
		boundaries_3=c(252.5, 522.5),
		boundaries_4=c(255, 495),
		boundaries_5=c(255, 495),
		boundaries_6=c(255, 495),
		boundaries_7=c(255, 495),
		boundaries_8=c(225, 525),
		boundaries_10=c(195, 555),
		loss.hoss_3=c(275, 500),
		loss.hoss_4=c(275, 475),
		loss.hoss_5=c(275, 475),
		loss.hoss_6=c(275, 475),
		loss.hoss_7=c(275, 475),
		loss.hoss_8=c(250, 500),
		loss.hoss_10=c(225, 525)),
	READING.2014_2015=list(
		boundaries_3=c(2063.1, 2673.9),
		boundaries_4=c(2077.8, 2716.2),
		boundaries_5=c(2151.0, 2751.0),
		boundaries_6=c(2158.6, 2775.4),
		boundaries_7=c(2209.3, 2793.7),
		boundaries_8=c(2239.9, 2817.1),
		boundaries_9=c(2249.4, 2844.6),
		boundaries_10=c(2249.9, 2844.6),
		boundaries_11=c(2249.4, 2844.6),
		knots_3=c(2345, 2399, 2447, 2501),
		knots_4=c(2377, 2440, 2493, 2545),
		knots_5=c(2421, 2484, 2535, 2587),
		knots_6=c(2437, 2497, 2547, 2600),
		knots_7=c(2441, 2506, 2561, 2619),
		knots_8=c(2470, 2531, 2584, 2640),
		knots_9=c(2470, 2531, 2584, 2640),
		knots_10=c(2470, 2531, 2584, 2640),
		knots_11=c(2484, 2559, 2620, 2681),
		loss.hoss_3=c(2114, 2623),
		loss.hoss_4=c(2131, 2663),
		loss.hoss_5=c(2201, 2701),
		loss.hoss_6=c(2210, 2724),
		loss.hoss_7=c(2258, 2745),
		loss.hoss_8=c(2288, 2769),
		loss.hoss_9=c(2288, 2795),
		loss.hoss_10=c(2288, 2795),
		loss.hoss_11=c(2299, 2795)),
	READING.2015_2016=list(
		boundaries_3=c(1920.0, 2892.0),
		boundaries_4=c(1948.5, 2950.5),
		boundaries_5=c(1970.0, 3002.0),
		boundaries_6=c(1993.2, 3022.8),
		boundaries_7=c(1993.8, 3052.2),
		boundaries_8=c(2007.8, 3078.2),
		boundaries_9=c(2009.0, 3125.0),
		boundaries_10=c(2009.0, 3125.0),
		boundaries_11=c(2009.0, 3125.0),
		knots_3=c(2345, 2399, 2447, 2501),
		knots_4=c(2377, 2440, 2493, 2545),
		knots_5=c(2421, 2484, 2535, 2587),
		knots_6=c(2437, 2497, 2547, 2600),
		knots_7=c(2441, 2506, 2561, 2619),
		knots_8=c(2470, 2531, 2584, 2640),
		knots_9=c(2470, 2531, 2584, 2640),
		knots_10=c(2470, 2531, 2584, 2640),
		knots_11=c(2484, 2559, 2620, 2681),
		loss.hoss_3=c(2001, 2811),
		loss.hoss_4=c(2032, 2867),
		loss.hoss_5=c(2056, 2916),
		loss.hoss_6=c(2079, 2937),
		loss.hoss_7=c(2082, 2964),
		loss.hoss_8=c(2097, 2989),
		loss.hoss_9=c(2102, 3032),
		loss.hoss_10=c(2102, 3032),
		loss.hoss_11=c(2102, 3032)),
	WRITING=list(
		knots_4=c(7, 9, 10, 11),
		knots_7=c(8, 9, 10, 11),
		knots_10=c(18, 20, 21, 23),
		boundaries_4=c(-1.2, 13.2),
		boundaries_7=c(-1.2, 13.2),
		boundaries_10=c(-2.4, 26.4),
		loss.hoss_4=c(0, 12),
		loss.hoss_7=c(0, 12),
		loss.hoss_10=c(0, 24)),
	MATHEMATICS=list(
		knots_3=c(379, 401, 419, 440),
		knots_4=c(367, 392, 414, 441),
		knots_5=c(375, 396, 417, 440),
		knots_6=c(367, 391, 410, 431),
		knots_7=c(362, 389, 412, 439),
		knots_8=c(364, 389, 409, 437),
		knots_10=c(361, 385, 406, 429),
		boundaries_3=c(135, 615),
		boundaries_4=c(162.5, 612.5),
		boundaries_5=c(162.5, 612.5),
		boundaries_6=c(162.5, 612.5),
		boundaries_7=c(80, 620),
		boundaries_8=c(162.5, 612.5),
		boundaries_10=c(162.5, 612.5),
		loss.hoss_3=c(175, 575),
		loss.hoss_4=c(200, 575),
		loss.hoss_5=c(200, 575),
		loss.hoss_6=c(200, 575),
		loss.hoss_7=c(125, 575),
		loss.hoss_8=c(200, 575),
		loss.hoss_10=c(200, 575)),
	MATHEMATICS.2014_2015=list(
		boundaries_3=c(2145.8, 2664.2),
		boundaries_4=c(2158.5, 2704.5),
		boundaries_5=c(2170.9, 2748.1),
		boundaries_6=c(2183.7, 2799.3),
		boundaries_7=c(2197.2, 2830.8),
		boundaries_8=c(2205.3, 2855.7),
		boundaries_9=c(2211.3, 2920.2),
		boundaries_10=c(2211.3, 2920.2),
		boundaries_11=c(2221.8, 2920.2),
		knots_3=c(2369, 2415, 2454, 2498),
		knots_4=c(2407, 2456, 2496, 2541),
		knots_5=c(2429, 2485, 2533, 2582),
		knots_6=c(2435, 2499, 2547, 2602),
		knots_7=c(2437, 2505, 2560, 2618),
		knots_8=c(2446, 2521, 2581, 2645),
		knots_9=c(2446, 2521, 2581, 2645),
		knots_10=c(2446, 2521, 2581, 2645),
		knots_11=c(2459, 2533, 2594, 2662),
		loss.hoss_3=c(2189, 2621),
		loss.hoss_4=c(2204, 2659),
		loss.hoss_5=c(2219, 2700),
		loss.hoss_6=c(2235, 2748),
		loss.hoss_7=c(2250, 2778),
		loss.hoss_8=c(2265, 2802),
		loss.hoss_9=c(2280, 2862),
		loss.hoss_10=c(2280, 2862),
		loss.hoss_11=c(2280, 2862)),
	MATHEMATICS.2015_2016=list(
		boundaries_3=c(2001.9, 2831.1),
		boundaries_4=c(2015.6, 2908.4),
		boundaries_5=c(2015.4, 2970.6),
		boundaries_6=c(2022.2, 2991.8),
		boundaries_7=c(2022.4, 3049.6),
		boundaries_8=c(2025.0, 3081.0),
		boundaries_9=c(2021.3, 3181.7),
		boundaries_10=c(2021.3, 3181.7),
		boundaries_11=c(2021.3, 3181.7),
		knots_3=c(2369, 2415, 2454, 2498),
		knots_4=c(2407, 2456, 2496, 2541),
		knots_5=c(2429, 2485, 2533, 2582),
		knots_6=c(2435, 2499, 2547, 2602),
		knots_7=c(2437, 2505, 2560, 2618),
		knots_8=c(2446, 2521, 2581, 2645),
		knots_9=c(2446, 2521, 2581, 2645),
		knots_10=c(2446, 2521, 2581, 2645),
		knots_11=c(2459, 2533, 2594, 2662),
		loss.hoss_3=c(2071, 2762),
		loss.hoss_4=c(2090, 2834),
		loss.hoss_5=c(2095, 2891),
		loss.hoss_6=c(2103, 2911),
		loss.hoss_7=c(2108, 2964),
		loss.hoss_8=c(2113, 2993),
		loss.hoss_9=c(2118, 3085),
		loss.hoss_10=c(2118, 3085),
		loss.hoss_11=c(2118, 3085)),
	SCIENCE=list(
		knots_5=c(369, 385, 400, 413),
		knots_8=c(371, 390, 406, 423),
		knots_10=c(351, 380, 402, 423),
		boundaries_5=c(165, 585),
		boundaries_8=c(192.5, 582.5),
		boundaries_10=c(130, 670),
		loss.hoss_5=c(200, 550),
		loss.hoss_8=c(225, 550),
		loss.hoss_10=c(175, 625)),
	EOC_MATHEMATICS_1=list(
		knots_7=c(375, 400, 424, 456),
		knots_8=c(375, 400, 424, 456),
		knots_9=c(375, 400, 424, 456),
		knots_EOCT=c(375, 400, 424, 456),
		boundaries_8=c(152.5, 722.5),
		boundaries_7=c(152.5, 722.5),
		boundaries_9=c(152.5, 722.5),
		boundaries_EOCT=c(152.5, 722.5),
		loss.hoss_9=c(200, 675),
		loss.hoss_7=c(200, 675),
		loss.hoss_8=c(200, 675),
		loss.hoss_EOCT=c(200, 675)),
	EOC_MATHEMATICS_2=list(
		knots_EOCT=c(387, 411, 436, 459),
		boundaries_EOCT=c(160, 640),
		loss.hoss_EOCT=c(200, 600)),
	EOC_BIOLOGY=list(
		knots_EOCT=c(387, 402, 414, 427),
		boundaries_EOCT=c(250, 550),
		loss.hoss_EOCT=c(275, 525)))

SGPstateData[["WA"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(375, 400, 436),
		GRADE_4=c(375, 400, 447),
		GRADE_5=c(375, 400, 440),
		GRADE_6=c(375, 400, 442),
		GRADE_7=c(375, 400, 444),
		GRADE_8=c(375, 400, 437),
	   GRADE_10=c(375, 400, 434)),
	MATHEMATICS.2014_2015=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653),
		GRADE_9=c(2515, 2599, 2676),
		GRADE_10=c(2529, 2614, 2697),
		GRADE_11=c(2543, 2628, 2718)),
	SCIENCE=list(
		GRADE_5=c(375, 400, 432),
		GRADE_8=c(375, 400, 431),
		GRADE_10=c(375, 400, 458)),
	READING=list(
		GRADE_3=c(375, 400, 426),
		GRADE_4=c(375, 400, 424),
		GRADE_5=c(375, 400, 422),
		GRADE_6=c(375, 400, 425),
		GRADE_7=c(375, 400, 418),
		GRADE_8=c(375, 400, 419),
		GRADE_10=c(375, 400, 427)),
	READING.2014_2015=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668),
		GRADE_9=c(2488, 2571, 2670),
		GRADE_10=c(2491, 2577, 2677),
		GRADE_11=c(2493, 2583, 2682)),
	WRITING=list(
		GRADE_4=c(7, 9, 11),
		GRADE_7=c(7, 9, 11),
		GRADE_10=c(13, 17, 21)),
#EOC Courses
	EOC_MATHEMATICS_1=list(
		GRADE_7=c(375, 400, 443),
		GRADE_8=c(375, 400, 443),
		GRADE_9=c(375, 400, 443),
		GRADE_10=c(375, 400, 443),
		GRADE_EOCT=c(375, 400, 443)),
	EOC_MATHEMATICS_2=list(
		GRADE_8=c(375, 400, 436),
		GRADE_9=c(375, 400, 436),
		GRADE_10=c(375, 400, 436),
		GRADE_EOCT=c(375, 400, 436)),
	EOC_BIOLOGY=list(
		GRADE_EOCT=c(375, 400, 458)),
	EOC_MATH_MAKEUP_1=list(
		GRADE_10=c(375, 400, 443)))

SGPstateData[["WA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1: Below Basic", "L2: Basic", "L3: Proficient", "L4: Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["WA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(34, 67),
	Labels=c("1st - 33rd", "34th - 66th", "67th - 99th"))

SGPstateData[["WA"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Smarter Balanced Assessment",
	Assessment_Abbreviation="SBA",
#	Assessment_Name="Washington Comprehensive Assessment Program",
#	Assessment_Abbreviation="MSP/HSPE",
	Organization=list(
		Name="State of Washington Office of Superintendent of Public Instruction",
	Abbreviation="OSPI",
		URL="www.k12.wa.us",
		Contact="(360) 725-6000"),
#	Content_Areas=c("Mathematics", "Reading", "Science"),
	Content_Areas=c("Mathematics", "Reading"),
	# # The assessment changed from WASL to MSP/HSPE (WCAP), but the scale basically stayed the same...
	Scale_Change=list(MATHEMATICS="2014_2015", READING="2014_2015"),
	# Scale_Change=list(MATHEMATICS=c("2009_2010", "2010_2011"),
					  # SCIENCE="2009_2010",
					  # READING="2009_2010",
					  # WRITING="2009_2010"),
#	Grades_Tested=c(3,4,5,6,7,8,9,10),
	Grades_Tested=c(3,4,5,6,7,8),
	Assessment_Years=c("2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"),
	Test_Season="Spring",
	Test_Vendor="SBAC",
	CSEM=Washington_CSEM)

SGPstateData[["WA"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- list(
	Assessment_Abbreviation="MSP/HSPE",
	Assessment_Abbreviation.2014_2015="SBA",
	Assessment_Name="Washington Comprehensive Assessment Program",
	Assessment_Name.2014_2015="Smarter Balanced Assessment",
	Achievement_Levels=list(
		Labels=c("L1: Below Basic", "L2: Basic", "L3: Proficient", "L4: Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels.2014_2015=list(
		Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Level_Labels=list(
		"L1: Below Basic"="Below Basic",
		"L2: Basic"="Basic",
		"L3: Proficient"="Proficient",
		"L4: Advanced"="Advanced"),
	Achievement_Level_Labels.2014_2015=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"),
	Content_Areas_Labels =list(READING = "Reading", MATHEMATICS = "Math", EOC_MATHEMATICS_1 = "EOC Math 1", EOC_MATHEMATICS_2 = "EOC Math 2"),
	Content_Areas_Labels.2014_2015=list(MATHEMATICS="Math", READING="Reading"),
	Vertical_Scale="No",
	Vertical_Scale.2014_2015="Yes",
	Grades_Tested=c(3,4,5,6,7,8,9,10,11),
	Grades_Tested.2014_2015=c(3,4,5,6,7,8),
	Year="2014_2015")

SGPstateData[["WA"]][["Student_Report_Information"]] <- list(
	#	Transformed_Achievement_Level_Cutscores=list(READING=c(100,200,300,400,500),
	#		MATHEMATICS=c(100,200,300,400,500), EOC_MATHEMATICS_1 =c(100,200,300,400,500), EOC_MATHEMATICS_2 =c(100,200,300,400,500)),
	#	Transformed_Achievement_Level_Cutscores_gaPlot=list(READING=c(100,200,300,400,500),
	#		MATHEMATICS=c(100,200,300,400,500), EOC_MATHEMATICS_1 =c(100,200,300,400,500), EOC_MATHEMATICS_2 =c(100,200,300,400,500)),
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Content_Areas_Labels =list(READING="ELA", MATHEMATICS="Math"),
	#	Content_Areas_Labels =list(READING = "Reading", MATHEMATICS = "Math", EOC_MATHEMATICS_1 = "EOC Math 1", EOC_MATHEMATICS_2 = "EOC Math 2"),
	#	Content_Areas_Domains=list( ## Each Domain should be in CANONICAL PROGRESSION ORDER
	#		READING = "READING", MATHEMATICS = "MATHEMATICS", EOC_MATHEMATICS_1="MATHEMATICS", EOC_MATHEMATICS_2="MATHEMATICS"),
	Grades_Reported=list(READING=c(3,4,5,6,7,8), MATHEMATICS=c(3,4,5,6,7,8)),
	#	Grades_Reported=list(READING=c(3,4,5,6,7,8,10), MATHEMATICS=c(3,4,5,6,7,8), EOC_MATHEMATICS_1=c(7,8,9,10), EOC_MATHEMATICS_2=c(8,9,10)),
	Achievement_Level_Labels=list(
		"Level 1"="Level 1",
		"Level 2"="Level 2",
		"Level 3"="Level 3",
		"Level 4"="Level 4"))
	#		"L1: Below Basic"="Below Basic",
	#		"L2: Basic"="Basic",
	#		"L3: Proficient"="Proficient",
	#		"L4: Advanced"="Advanced"))

SGPstateData[['WA']][['SGP_Configuration']] <- list(
	max.sgp.target.years.forward=2,
	gPlot.sgp.targets.timeframe=2,
	sgPlot.use.student.school.name=TRUE,
	sgp.loss.hoss.adjustment="WA")

#### Configurations for 2013_2014 and prior
#SGPstateData[["WA"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
#	READING = as.character(c(3:8,10)),
#	MATHEMATICS = as.character(3:10),
#	EOC_MATHEMATICS_1 = as.character(3:10),
#	EOC_MATHEMATICS_2 = as.character(3:10))

#SGPstateData[["WA"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
#	READING = rep("READING", 7),
#	MATHEMATICS = c(rep("MATHEMATICS", 6), "EOC_MATHEMATICS_1", "EOC_MATHEMATICS_2"),
#	EOC_MATHEMATICS_1 = c(rep("MATHEMATICS", 6), "EOC_MATHEMATICS_1", "EOC_MATHEMATICS_2"),
#	EOC_MATHEMATICS_2 = c(rep("MATHEMATICS", 6), "EOC_MATHEMATICS_1", "EOC_MATHEMATICS_2"))

#SGPstateData[["WA"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
#	READING=c(rep(1L, 5), 2L),
#	MATHEMATICS=rep(1L, 7),
#	EOC_MATHEMATICS_1=rep(1L, 7),
#	EOC_MATHEMATICS_2= rep(1L, 7))

#load("Baseline_Coefficient_Matrices/WA/WA_Baseline_Matrices.Rdata")
#SGPstateData[["WA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WA_Baseline_Matrices
#SGPstateData[["WA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("SGP_Norm_Group_Preference/WA_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["WA"]][["SGP_Norm_Group_Preference"]] <- WA_SGP_Norm_Group_Preference


#########################################################
### WASHINGTON DC
#########################################################

load("Knots_Boundaries/PARCC_DC_Knots_Boundaries.Rdata")
SGPstateData[["DC"]] <- SGPstateData[['PARCC']]
SGPstateData[["DC"]][["Achievement"]][["Knots_Boundaries"]] <- PARCC_DC_Knots_Boundaries

SGPstateData[["DC"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Partnership for Assessment of Readiness for College and Careers",
		Assessment_Abbreviation="PARCC",
		Organization=list(
			Name="Office of the State Superintendent of Education",
			Abbreviation="OSSE",
			URL="http://osse.dc.gov",
			Contact="202-727-6436"),
		Content_Areas=c("English Language Arts", "Mathematics", "Geometry", "Algebra I", "Algebra II", "Integrated Math 1", "Integrated Math 2", "Integrated Math 3"),
		Grades_Tested=c(3,4,5,6,7,8,9,10,11),
		Assessment_Years=c("2014_2015.1", "2014_2015.2", "2015_2016.1", "2015_2016.2", "2016_2017.1", "2016_2017.2"),
		Test_Season="Fall & Spring",
		Test_Vendor="Pearson",
		CSEM="SCALE_SCORE_CSEM")

SGPstateData[["DC"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
		ELA=c("3", "4", "5", "6", "7", "8", "9", "10"),
		ELA_SS=c("3", "4", "5", "6", "7", "8", "9", "10"),
		MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
		MATHEMATICS_SS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"))
SGPstateData[["DC"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
		ELA=rep("ELA", 8), ELA_SS=rep("ELA_SS", 8),
		MATHEMATICS=c(rep("MATHEMATICS", 6), "ALGEBRA_I", "GEOMETRY"),
		MATHEMATICS_SS=c(rep("MATHEMATICS_SS", 6), "ALGEBRA_I_SS", "GEOMETRY_SS"))
SGPstateData[["DC"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
		ELA=rep(1L, 7), ELA_SS=rep(1L, 7),
		MATHEMATICS=rep(1L, 7), MATHEMATICS_SS=rep(1L, 7))

#########################################################
### WEST VIRGINIA
#########################################################

load("Knots_Boundaries/WV_Knots_Boundaries_2018.Rdata")

SGPstateData[["WV"]][["Achievement"]][["Knots_Boundaries"]] <- c(
	WV_Knots_Boundaries_2018,
	list(
#	READING.2015_2016=list(
	READING.2016=list(
		boundaries_3=c(1920.0, 2892.0),
		boundaries_4=c(1948.5, 2950.5),
		boundaries_5=c(1970.0, 3002.0),
		boundaries_6=c(1993.2, 3022.8),
		boundaries_7=c(1993.8, 3052.2),
		boundaries_8=c(2007.8, 3078.2),
		boundaries_9=c(2009.0, 3125.0),
		boundaries_10=c(2009.0, 3125.0),
		boundaries_11=c(2009.0, 3125.0),
		knots_3=c(2345, 2399, 2447, 2501),
		knots_4=c(2377, 2440, 2493, 2545),
		knots_5=c(2421, 2484, 2535, 2587),
		knots_6=c(2437, 2497, 2547, 2600),
		knots_7=c(2441, 2506, 2561, 2619),
		knots_8=c(2470, 2531, 2584, 2640),
		knots_9=c(2470, 2531, 2584, 2640),
		knots_10=c(2470, 2531, 2584, 2640),
		knots_11=c(2484, 2559, 2620, 2681),
		loss.hoss_3=c(2001, 2811),
		loss.hoss_4=c(2032, 2867),
		loss.hoss_5=c(2056, 2916),
		loss.hoss_6=c(2079, 2937),
		loss.hoss_7=c(2082, 2964),
		loss.hoss_8=c(2097, 2989),
		loss.hoss_9=c(2102, 3032),
		loss.hoss_10=c(2102, 3032),
		loss.hoss_11=c(2102, 3032)),
#	READING.2014_2015=list(
	READING.2015=list(
		boundaries_3=c(2063.1, 2673.9),
		boundaries_4=c(2077.8, 2716.2),
		boundaries_5=c(2151.0, 2751.0),
		boundaries_6=c(2158.6, 2775.4),
		boundaries_7=c(2209.3, 2793.7),
		boundaries_8=c(2239.9, 2817.1),
		boundaries_9=c(2249.4, 2844.6),
		boundaries_10=c(2249.9, 2844.6),
		boundaries_11=c(2249.4, 2844.6),
		knots_3=c(2345, 2399, 2447, 2501),
		knots_4=c(2377, 2440, 2493, 2545),
		knots_5=c(2421, 2484, 2535, 2587),
		knots_6=c(2437, 2497, 2547, 2600),
		knots_7=c(2441, 2506, 2561, 2619),
		knots_8=c(2470, 2531, 2584, 2640),
		knots_9=c(2470, 2531, 2584, 2640),
		knots_10=c(2470, 2531, 2584, 2640),
		knots_11=c(2484, 2559, 2620, 2681),
		loss.hoss_3=c(2114, 2623),
		loss.hoss_4=c(2131, 2663),
		loss.hoss_5=c(2201, 2701),
		loss.hoss_6=c(2210, 2724),
		loss.hoss_7=c(2258, 2745),
		loss.hoss_8=c(2288, 2769),
		loss.hoss_9=c(2288, 2795),
		loss.hoss_10=c(2288, 2795),
		loss.hoss_11=c(2299, 2795)),
	READING=list(
		knots_3=c(397, 421, 439, 461),
		knots_4=c(410, 435, 454, 474),
		knots_5=c(417, 443, 463, 485),
		knots_6=c(429, 455, 475, 496),
		knots_7=c(437, 462, 483, 505),
		knots_8=c(437, 463, 485, 507),
		knots_9=c(422, 459, 487, 514),
		knots_10=c(434, 470, 496, 526),
		knots_11=c(435, 470, 498, 526),
		boundaries_3=c(82.8, 649.2),
		boundaries_4=c(77.8, 740.2),
		boundaries_5=c(79.5, 769.5),
		boundaries_6=c(77.7, 789.3),
		boundaries_7=c(84.7, 748.3),
		boundaries_8=c(92.7, 720.3),
		boundaries_9=c(96.2, 717.8),
		boundaries_10=c(76.6, 837.4),
		boundaries_11=c(86.1, 888.9),
		loss.hoss_3=c(130, 602),
		loss.hoss_4=c(133, 685),
		loss.hoss_5=c(137, 712),
		loss.hoss_6=c(137, 730),
		loss.hoss_7=c(140, 693),
		loss.hoss_8=c(145, 668),
		loss.hoss_9=c(148, 666),
		loss.hoss_10=c(140, 774),
		loss.hoss_11=c(153, 822)),
#	MATHEMATICS.2015_2016=list(
	MATHEMATICS.2016=list(
		boundaries_3=c(2001.9, 2831.1),
		boundaries_4=c(2015.6, 2908.4),
		boundaries_5=c(2015.4, 2970.6),
		boundaries_6=c(2022.2, 2991.8),
		boundaries_7=c(2022.4, 3049.6),
		boundaries_8=c(2025.0, 3081.0),
		boundaries_9=c(2021.3, 3181.7),
		boundaries_10=c(2021.3, 3181.7),
		boundaries_11=c(2021.3, 3181.7),
		knots_3=c(2369, 2415, 2454, 2498),
		knots_4=c(2407, 2456, 2496, 2541),
		knots_5=c(2429, 2485, 2533, 2582),
		knots_6=c(2435, 2499, 2547, 2602),
		knots_7=c(2437, 2505, 2560, 2618),
		knots_8=c(2446, 2521, 2581, 2645),
		knots_9=c(2446, 2521, 2581, 2645),
		knots_10=c(2446, 2521, 2581, 2645),
		knots_11=c(2459, 2533, 2594, 2662),
		loss.hoss_3=c(2071, 2762),
		loss.hoss_4=c(2090, 2834),
		loss.hoss_5=c(2095, 2891),
		loss.hoss_6=c(2103, 2911),
		loss.hoss_7=c(2108, 2964),
		loss.hoss_8=c(2113, 2993),
		loss.hoss_9=c(2118, 3085),
		loss.hoss_10=c(2118, 3085),
		loss.hoss_11=c(2118, 3085)),
#	MATHEMATICS.2014_2015=list(
	MATHEMATICS.2015=list(
		boundaries_3=c(2145.8, 2664.2),
		boundaries_4=c(2158.5, 2704.5),
		boundaries_5=c(2170.9, 2748.1),
		boundaries_6=c(2183.7, 2799.3),
		boundaries_7=c(2197.2, 2830.8),
		boundaries_8=c(2205.3, 2855.7),
		boundaries_9=c(2211.3, 2920.2),
		boundaries_10=c(2211.3, 2920.2),
		boundaries_11=c(2221.8, 2920.2),
		knots_3=c(2369, 2415, 2454, 2498),
		knots_4=c(2407, 2456, 2496, 2541),
		knots_5=c(2429, 2485, 2533, 2582),
		knots_6=c(2435, 2499, 2547, 2602),
		knots_7=c(2437, 2505, 2560, 2618),
		knots_8=c(2446, 2521, 2581, 2645),
		knots_9=c(2446, 2521, 2581, 2645),
		knots_10=c(2446, 2521, 2581, 2645),
		knots_11=c(2459, 2533, 2594, 2662),
		loss.hoss_3=c(2189, 2621),
		loss.hoss_4=c(2204, 2659),
		loss.hoss_5=c(2219, 2700),
		loss.hoss_6=c(2235, 2748),
		loss.hoss_7=c(2250, 2778),
		loss.hoss_8=c(2265, 2802),
		loss.hoss_9=c(2280, 2862),
		loss.hoss_10=c(2280, 2862),
		loss.hoss_11=c(2280, 2862)),
	MATHEMATICS=list(
		knots_3=c(542, 565, 581, 599),
		knots_4=c(551, 577, 595, 618),
		knots_5=c(568, 595, 614, 638),
		knots_6=c(582, 609, 630, 653),
		knots_7=c(595, 622, 644, 669),
		knots_8=c(585, 622, 644, 669),
		knots_9=c(604, 642, 664, 673),
		knots_10=c(608, 645, 666, 687),
		knots_11=c(636, 661, 680, 699),
		boundaries_3=c(345.5, 819.5),
		boundaries_4=c(361.3, 861.7),
		boundaries_5=c(390, 870),
		boundaries_6=c(440.7, 876.3),
		boundaries_7=c(448.7, 908.3),
		boundaries_8=c(447.7, 919.3),
		boundaries_9=c(474.3, 938.7),
		boundaries_10=c(437.5, 911.5),
		boundaries_11=c(472.8, 955.2),
		loss.hoss_3=c(385, 780),
		loss.hoss_4=c(403, 820),
		loss.hoss_5=c(430, 830),
		loss.hoss_6=c(477, 840),
		loss.hoss_7=c(487, 870),
		loss.hoss_8=c(487, 880),
		loss.hoss_9=c(513, 900),
		loss.hoss_10=c(477, 872),
		loss.hoss_11=c(513, 915))))

SGPstateData[["WV"]][["Achievement"]][["Cutscores"]] <- list(
	MATHEMATICS=list(
		GRADE_3=c(458, 557, 587, 623),
		GRADE_4=c(463, 570, 609, 636),
		GRADE_5=c(502, 591, 637, 655),
		GRADE_6=c(554, 609, 652, 678),
		GRADE_7=c(556, 624, 675, 699),
		GRADE_8=c(576, 624, 675, 699),
		GRADE_9=c(599, 642, 695, 730),
		GRADE_10=c(605, 650, 702, 732),
		GRADE_11=c(622, 660, 711, 734)),
#	MATHEMATICS.2009_2010=list(
	MATHEMATICS.2010=list(
		GRADE_3=c(547, 581, 601, 623),
		GRADE_4=c(556, 592, 622, 646),
		GRADE_5=c(577, 611, 637, 667),
		GRADE_6=c(597, 626, 652, 682),
		GRADE_7=c(618, 641, 669, 698),
		GRADE_8=c(622, 651, 673, 699),
		GRADE_9=c(642, 668, 686, 707),
		GRADE_10=c(645, 670, 690, 714),
		GRADE_11=c(661, 680, 702, 723)),
#	MATHEMATICS.2014_2015=list(
	MATHEMATICS.2015=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653),
		GRADE_9=c(2515, 2599, 2676),
		GRADE_10=c(2529, 2614, 2697),
		GRADE_11=c(2543, 2628, 2718)),
	MATHEMATICS.2018=list(
		GRADE_3=c(401, 426, 448),
		GRADE_4=c(422, 456, 478),
		GRADE_5=c(449, 487, 513),
		GRADE_6=c(474, 518, 550),
		GRADE_7=c(503, 548, 583),
		GRADE_8=c(529, 587, 617)),
	READING=list(
		GRADE_3=c(353, 413, 466, 502),
		GRADE_4=c(356, 427, 467, 512),
		GRADE_5=c(359, 434, 473, 513),
		GRADE_6=c(361, 445, 481, 518),
		GRADE_7=c(363, 455, 499, 548),
		GRADE_8=c(365, 460, 518, 575),
		GRADE_9=c(366, 474, 522, 575),
		GRADE_10=c(368, 482, 527, 576),
		GRADE_11=c(370, 478, 531, 576)),
#	READING.2009_2010=list(
	READING.2010=list(
		GRADE_3=c(418, 436, 461, 487),
		GRADE_4=c(427, 452, 475, 502),
		GRADE_5=c(435, 460, 485, 512),
		GRADE_6=c(442, 470, 496, 522),
		GRADE_7=c(447, 479, 505, 529),
		GRADE_8=c(448, 481, 508, 539),
		GRADE_9=c(449, 484, 517, 550),
		GRADE_10=c(453, 492, 527, 560),
		GRADE_11=c(454, 501, 528, 563)),
#	READING.2014_2015=list(
	READING.2015=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668),
		GRADE_9=c(2488, 2571, 2670),
		GRADE_10=c(2491, 2577, 2677),
		GRADE_11=c(2493, 2583, 2682)),
	READING.2018=list(
		GRADE_3=c(550, 586, 616),
		GRADE_4=c(563, 599, 629),
		GRADE_5=c(588, 622, 655),
		GRADE_6=c(597, 639, 680),
		GRADE_7=c(602, 644, 685),
		GRADE_8=c(613, 656, 698)))

#SGPstateData[["WV"]][["Achievement"]][["College_Readiness_Cutscores"]] <- list(
#	MATHEMATICS=list(
#		GRADE_11=710),
#	READING=list(
#		GRADE_11=505))

SGPstateData[["WV"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("1", "2", "3", "4"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["WV"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
#	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))
#SGPstateData[["WV"]][["Achievement"]][["Levels"]] <- list(
#		Labels=c("Novice", "Partial Mastery", "Mastery", "Above Mastery", "Distinguished"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient"))

SGPstateData[["WV"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WV"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WV"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WV"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="West Virginia General Summative Assessment",
	Assessment_Abbreviation="WVGSA",
	Organization=list(
		Name="West Virginia Department of Education",
	Abbreviation="WVDE",
		URL="wvde.state.wv.us",
		Contact="304-558-2546 "),
#	Scale_Change=list(MATHEMATICS="2014_2015", READING="2014_2015"),
	Scale_Change=list(MATHEMATICS="2018", READING="2018"),
	Content_Areas=c("Reading", "Mathematics"),
#	Grades_Tested=c(3,4,5,6,7,8,9,10,11),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
#	Test_Vendor="SBAC/AIR")
	Test_Vendor="AIR")

SGPstateData[["WV"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- list(
#	Assessment_Abbreviation="WESTEST 2",
	Assessment_Abbreviation="WVGSA",
#	Assessment_Abbreviation.2014_2015="WVGSA",
	Assessment_Abbreviation.2018="WVGSA",
#	Assessment_Name="West Virginia Educational Standards Tests",
	Assessment_Name="West Virginia General Summative Assessment",
#	Assessment_Name.2014_2015="West Virginia General Summative Assessment",
	Assessment_Name.2018="West Virginia General Summative Assessment",
#	Achievement_Levels=list(
#		Labels=c("Novice", "Partial Mastery", "Mastery", "Above Mastery", "Distinguished"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient")),
	Achievement_Levels=list(
		Labels=c("1", "2", "3", "4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#	Achievement_Levels.2014_2015=list(
#		Labels=c("Level 1", "Level 2", "Level 3", "Level 4"),
#		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels.2018=list(
		Labels=c("1", "2", "3", "4"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
#	Achievement_Level_Labels=list(
#		"Novice"="Novice",
#		"Partial Mastery"="Partial Mastery",
#		"Mastery"="Mastery",
#		"Above Mastery"="Above Mastery",
#		"Distinguished"="Distinguished"),
	Achievement_Level_Labels=list(
		"1"="Level 1",
		"2"="Level 2",
		"3"="Level 3",
		"4"="Level 4"),
#	Achievement_Level_Labels.2014_2015=list(
#		"Level 1"="Level 1",
#		"Level 2"="Level 2",
#		"Level 3"="Level 3",
#		"Level 4"="Level 4"),
	Achievement_Level_Labels.2018=list(
		"1"="Level 1",
		"2"="Level 2",
		"3"="Level 3",
		"4"="Level 4"),
#	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
#	Content_Areas_Labels.2014_2015=list(MATHEMATICS="Math", READING="ELA"),
	Content_Areas_Labels.2018=list(MATHEMATICS="Math", READING="ELA"),
#	Vertical_Scale="No",
	Vertical_Scale="Yes",
#	Vertical_Scale.2014_2015="Yes",
	Vertical_Scale.2018="Yes",
#	Grades_Tested=c(3,4,5,6,7,8,9,10,11),
	Grades_Tested=c(3,4,5,6,7,8),
#	Grades_Tested.2014_2015=c(3,4,5,6,7,8,9,10,11),
	Grades_Tested.2018=c(3,4,5,6,7,8),
#	Year="2014_2015"
	Year="2018"
)

SGPstateData[["WV"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="ELA"),
#	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10,11), READING=c(3,4,5,6,7,8,9,10,11)), ### 2017 and prior
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"1"="Level 1",
		"2"="Level 2",
		"3"="Level 3",
		"4"="Level 4"))
#	Achievement_Level_Labels=list(
#		"Level 1"="Level 1",
#		"Level 2"="Level 2",
#		"Level 3"="Level 3",
#		"Level 4"="Level 4"))
#	Achievement_Level_Labels=list( For 2013_2014 and prior
#		"Novice"="Novice",
#		"Partial Mastery"="Partial Mastery",
#		"Mastery"="Mastery",
#		"Above Mastery"="Above Mastery",
#		"Distinguished"="Distinguished"))

SGPstateData[["WV"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WV_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
#load("Baseline_Coefficient_Matrices/WV/WV_Baseline_Matrices.Rdata")
#SGPstateData[["WV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- WV_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["WV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- WV_Baseline_Matrices[["READING.BASELINE"]]

SGPstateData[["WV"]][["SGP_Configuration"]] <- list(
	return.norm.group.scale.scores=TRUE,
	print.other.gp=TRUE,
	sgp.minimum.default.panel.years=2,
	max.order.for.percentile=2,
	max.order.for.projection=2)


#########################################################
### WISCONSIN
#########################################################

load("Knots_Boundaries/WI_Knots_Boundaries.Rdata")
SGPstateData[["WI"]][["Achievement"]][["Knots_Boundaries"]] <- WI_Knots_Boundaries

#SGPstateData[["WI"]][["Achievement"]][["Knots_Boundaries"]] <- list(
#	READING=list(
#		knots_3=c(431, 452, 469, 487),
#		knots_4=c(444, 470, 491, 513),
#		knots_5=c(450, 477, 498, 520),
#		knots_6=c(467, 496, 518, 542),
#		knots_7=c(479, 507, 529, 553),
#		knots_8=c(491, 519, 542, 566),
#		knots_10=c(494, 531, 559, 588),
#		boundaries_3=c(266.3, 643.7),
#		boundaries_4=c(276.3, 653.7),
#		boundaries_5=c(286, 694),
#		boundaries_6=c(295.7, 734.3),
#		boundaries_7=c(305.3, 784.7),
#		boundaries_8=c(325.4, 794.6),
#		boundaries_10=c(345.3, 824.7),
#		loss.hoss_3=c(270, 640),
#		loss.hoss_4=c(280, 650),
#		loss.hoss_5=c(290, 690),
#		loss.hoss_6=c(300, 730),
#		loss.hoss_7=c(310, 780),
#		loss.hoss_8=c(330, 790),
#		loss.hoss_10=c(350, 820)),
#	MATHEMATICS=list(knots_3=c(399, 425, 446, 470),
#		knots_4=c(434, 460, 480, 503),
#		knots_5=c(457, 483, 504, 528),
#		knots_6=c(479, 505, 525, 548),
#		knots_7=c(501, 526, 546, 569),
#		knots_8=c(507, 535, 558, 583),
#		knots_10=c(526, 555, 576, 600),
#		boundaries_3=c(215.9, 634.1),
#		boundaries_4=c(235.9, 654.1),
#		boundaries_5=c(265.9, 684.1),
#		boundaries_6=c(306.1, 703.9),
#		boundaries_7=c(326.2, 713.8),
#		boundaries_8=c(346.2, 733.8),
#		boundaries_10=c(406.6, 753.4),
#		loss.hoss_3=c(220, 630),
#		loss.hoss_4=c(240, 650),
#		loss.hoss_5=c(270, 680),
#		loss.hoss_6=c(310, 700),
#		loss.hoss_7=c(330, 710),
#		loss.hoss_8=c(350, 730),
#		loss.hoss_10=c(410, 750)))

SGPstateData[["WI"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_3=c(445, 475, 507),
		GRADE_4=c(462, 498, 536),
		GRADE_5=c(464, 503, 546),
		GRADE_6=c(479, 525, 573),
		GRADE_7=c(486, 535, 590),
		GRADE_8=c(493, 548, 613),
		GRADE_10=c(496, 566, 644)),
	READING.2015=list(
		GRADE_3=c(2367, 2432, 2490),
		GRADE_4=c(2416, 2473, 2533),
		GRADE_5=c(2442, 2502, 2582),
		GRADE_6=c(2457, 2531, 2618),
		GRADE_7=c(2479, 2552, 2649),
		GRADE_8=c(2487, 2567, 2668),
		GRADE_11=c(2493, 2583, 2682)),
	READING.2016=list(
		GRADE_3=c(522, 570, 624),
		GRADE_4=c(546, 592, 650),
		GRADE_5=c(564, 610, 670),
		GRADE_6=c(572, 622, 671),
		GRADE_7=c(585, 638, 697),
		GRADE_8=c(592, 652, 708)),
	MATHEMATICS=list(
		GRADE_3=c(388, 438, 492),
		GRADE_4=c(425, 474, 526),
		GRADE_5=c(449, 501, 553),
		GRADE_6=c(475, 524, 573),
		GRADE_7=c(500, 544, 591),
		GRADE_8=c(510, 558, 605),
		GRADE_10=c(528, 574, 618)),
	MATHEMATICS.2015=list(
		GRADE_3=c(2381, 2436, 2501),
		GRADE_4=c(2411, 2485, 2549),
		GRADE_5=c(2455, 2528, 2579),
		GRADE_6=c(2473, 2552, 2610),
		GRADE_7=c(2484, 2567, 2635),
		GRADE_8=c(2504, 2586, 2653),
		GRADE_11=c(2543, 2628, 2718)),
	MATHEMATICS.2016=list(
		GRADE_3=c(517, 560, 611),
		GRADE_4=c(536, 588, 633),
		GRADE_5=c(574, 611, 658),
		GRADE_6=c(582, 626, 688),
		GRADE_7=c(606, 647, 712),
		GRADE_8=c(620, 667, 718)))

SGPstateData[["WI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["WI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 65),
	Labels=c("1st - 34th", "35th - 64th", "65th - 99th"))

SGPstateData[["WI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WI"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="Wisconsin Forward Exam",
	Assessment_Abbreviation="WFE",
#	Assessment_Name="Wisconsin Badger Exam",
#	Assessment_Abbreviation="WBE",
#	Assessment_Name="Wisconsin Knowledge and Concepts Examinations",
#	Assessment_Abbreviation="WKCE",
	Organization=list(
		Name="Wisconsin Department of Public Instruction",
		Abbreviation="WDOE",
		URL="dpi.state.wi.us",
		Contact="800-441-4563"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,10),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016"),
	Scale_Change=list(MATHEMATICS="2015", READING="2015"),
#	Test_Season="Fall", 2014 and prior
	Test_Season="Spring",
#	Test_Vendor="CTB/McGraw Hill",
	Test_Vendor="DRC",
	CSEM="SCALE_SCORE_CSEM")
#	CSEM=Wisconsin_CSEM)

SGPstateData[["WI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <- list(
	Assessment_Abbreviation="WKCE",
	Assessment_Abbreviation.2015="WBE",
	Assessment_Name="Wisconsin Knowledge and Concepts Examinations",
	Assessment_Name.2015="Wisconsin Badger Exam",
	Achievement_Levels=list(
		Labels=c("Minimal Performance", "Basic", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Levels.2015=list(
		Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient")),
	Achievement_Level_Labels=list(
		"Minimal"="Minimal Performance",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"),
	Achievement_Level_Labels.2015=list(
		"Below Basic"="Below",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Content_Areas_Labels.2015=list(MATHEMATICS="Math", READING="Reading"),
	Vertical_Scale="No",
	Vertical_Scale.2015="Yes",
	Grades_Tested=c(3,4,5,6,7,8,10),
	Grades_Tested.2015=c(3,4,5,6,7,8),
	Year="2015"
)

SGPstateData[["WI"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Below Basic"="Below",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

SGPstateData[["WI"]][["SGP_Configuration"]] <-
	list(
		print.other.gp=TRUE,
		percentile.cuts=c(1, 35, 65, 99),
		calculate.confidence.intervals=list(confidence.quantiles=c(0.025, 0.975)))

#load("Baseline_Coefficient_Matrices/WI/WI_Baseline_Matrices.Rdata")
#SGPstateData[["WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- WI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
#SGPstateData[["WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- WI_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["WI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WI_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


########################################################
### UNITED STATES VIRGIN ISLANDS (VI)
#########################################################

load("Knots_Boundaries/VI_Knots_Boundaries.Rdata")
SGPstateData[["VI"]][["Achievement"]][["Knots_Boundaries"]] <- VI_Knots_Boundaries

SGPstateData[["VI"]][["Achievement"]][["Cutscores"]] <-
	list(
		MATHEMATICS=list(
			GRADE_3=c(2381, 2436, 2501),
			GRADE_4=c(2411, 2485, 2549),
			GRADE_5=c(2455, 2528, 2579),
			GRADE_6=c(2473, 2552, 2610),
			GRADE_7=c(2484, 2567, 2635),
			GRADE_8=c(2504, 2586, 2653)),
		ELA=list(
			GRADE_3=c(2367, 2432, 2490),
			GRADE_4=c(2416, 2473, 2533),
			GRADE_5=c(2442, 2502, 2582),
			GRADE_6=c(2457, 2531, 2618),
			GRADE_7=c(2479, 2552, 2649),
			GRADE_8=c(2487, 2567, 2668)))

SGPstateData[["VI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("Not Met Standard", "Nearly Met Standard", "Met Standard", "Exceeded Standard"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["VI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["VI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["VI"]][["Growth"]][["Cutscores"]] <- list(
		Cuts=c(35, 66),
		Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["VI"]][["Assessment_Program_Information"]] <- list(
		Assessment_Name="Smarter Balanced Assessment",
		Assessment_Abbreviation="SBA",
		Organization=list(
		Name="Virgin Islands Department of Education",
		Abbreviation="VIDOE",
		URL="www.vide.vi",
		Contact="340-774-0100"),
		Content_Areas=c("Mathematics", "ELA"),
		Grades_Tested=c(3,4,5,6,7,8),
		Assessment_Years=c("2015", "2016"),
		Test_Season="Spring",
		Test_Vendor="SBAC")

SGPstateData[["VI"]][["Student_Report_Information"]] <- list(
		Vertical_Scale=list(MATHEMATICS=TRUE, ELA=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
		Achievement_Level_Labels=list(
			"Not Met Standard"="Not Met Standard",
			"Nearly Met Standard"="Nearly Met Standard",
			"Met Standard"="Met Standard",
			"Exceeded Standard"="Exceeded Standard"))

SGPstateData[["VI"]][["SGP_Configuration"]] <- list(
		sgp.minimum.default.panel.years=2,
		print.other.gp=TRUE,
		sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"))



##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA)
##########################################################################################

load("Knots_Boundaries/WIDA_Knots_Boundaries.Rdata")
SGPstateData[["WIDA"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(237, 263, 288, 307, 329),
		GRADE_1=c(249, 277, 303, 321, 344),
		GRADE_2=c(261, 290, 316, 335, 357),
		GRADE_3=c(272, 303, 328, 347, 369),
		GRADE_4=c(283, 314, 340, 359, 380),
		GRADE_5=c(293, 324, 350, 369, 390),
		GRADE_6=c(302, 334, 359, 379, 399),
		GRADE_7=c(311, 342, 368, 386, 407),
		GRADE_8=c(319, 350, 375, 394, 414),
		GRADE_9=c(327, 357, 382, 400, 419),
		GRADE_10=c(333, 363, 387, 405, 424),
		GRADE_11=c(340, 368, 391, 409, 427),
		GRADE_12=c(346, 372, 395, 413, 430)),
	READING.2017=list(
		GRADE_0=c(229, 261, 293, 325, 350),
		GRADE_1=c(242, 274, 315, 344, 368),
		GRADE_2=c(254, 289, 329, 359, 383),
		GRADE_3=c(265, 300, 340, 371, 396),
		GRADE_4=c(279, 309, 350, 382, 406),
		GRADE_5=c(286, 317, 358, 390, 415),
		GRADE_6=c(291, 324, 365, 399, 423),
		GRADE_7=c(298, 331, 372, 406, 431),
		GRADE_8=c(304, 337, 378, 412, 438),
		GRADE_9=c(311, 344, 385, 418, 446),
		GRADE_10=c(318, 350, 391, 424, 453),
		GRADE_11=c(325, 356, 397, 429, 459),
		GRADE_12=c(331, 362, 402, 434, 466)))

SGPstateData[["WIDA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1", "L2", "L3", "L4", "L5", "L6"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient"))

SGPstateData[["WIDA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WIDA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
	Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="L1",
		"Emerging"="L2",
		"Developing"="L3",
		"Expanding"="L4",
		"Bridging"="L5",
		"Reaching"="L6"))

SGPstateData[["WIDA"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	sgp.minimum.default.panel.years=2,
	max.sgp.target.years.forward=5,
	sgp.projections.max.forward.progression.years=7,
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#load("Baseline_Coefficient_Matrices/WIDA/WIDA_Baseline_Matrices.Rdata")
#SGPstateData[["WIDA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
load("Baseline_Coefficient_Matrices/WIDA/WIDA_Cohort_Referenced_Matrices_2017.Rdata")
SGPstateData[["WIDA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT Colorado (ACCESS)
##########################################################################################

load("Knots_Boundaries/WIDA_CO_Knots_Boundaries.Rdata")
SGPstateData[["WIDA_CO"]][["Achievement"]][["Knots_Boundaries"]][["READING"]] <- SGPstateData[["CELA"]][["Achievement"]][["Knots_Boundaries"]][["CELA"]]
SGPstateData[["WIDA_CO"]][["Achievement"]][["Knots_Boundaries"]][["READING.2013"]] <- SGPstateData[["WIDA"]][["Achievement"]][["Knots_Boundaries"]][["READING"]]
SGPstateData[["WIDA_CO"]][["Achievement"]][["Knots_Boundaries"]][["READING.2016"]] <- SGPstateData[["WIDA"]][["Achievement"]][["Knots_Boundaries"]][["READING.2016"]]
SGPstateData[["WIDA_CO"]][["Achievement"]][["Knots_Boundaries"]][["LITERACY"]] <- WIDA_CO_Knots_Boundaries[['LITERACY']]

SGPstateData[["WIDA_CO"]][["Achievement"]][["Cutscores"]] <- list(
	LITERACY=list(
		GRADE_0=c(238, 265, 295, 328, 350),
		GRADE_1=c(251, 281, 321, 349, 370),
		GRADE_2=c(263, 293, 334, 363, 383),
		GRADE_3=c(272, 303, 344, 373, 394),
		GRADE_4=c(287, 312, 353, 383, 404),
		GRADE_5=c(292, 319, 360, 390, 412),
		GRADE_6=c(296, 326, 367, 398, 420),
		GRADE_7=c(301, 333, 374, 404, 428),
		GRADE_8=c(308, 339, 379, 410, 436),
		GRADE_9=c(315, 346, 385, 416, 444),
		GRADE_10=c(321, 352, 391, 421, 451),
		GRADE_11=c(328, 359, 397, 426, 459),
		GRADE_12=c(335, 365, 403, 431, 467)),
	READING=list(
		GRADE_0=c(382, 426, 451, 515),
		GRADE_1=c(411, 435, 469, 522),
		GRADE_2=c(431, 465, 491, 546),
		GRADE_3=c(445, 478, 509, 562),
		GRADE_4=c(458, 490, 526, 578),
		GRADE_5=c(460, 493, 533, 584),
		GRADE_6=c(463, 496, 539, 590),
		GRADE_7=c(465, 499, 546, 596),
		GRADE_8=c(469, 503, 549, 598),
		GRADE_9=c(473, 507, 551, 600),
		GRADE_10=c(477, 510, 553, 603),
		GRADE_11=c(481, 514, 556, 605),
		GRADE_12=c(485, 518, 559, 607)),
	READING.2013=SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]][["READING"]],
	READING.2017=SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]][["READING.2017"]])

SGPstateData[["WIDA_CO"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1", "L2", "L3", "L4", "L5", "L6", "NO SCORE"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient","Proficient",NA))

SGPstateData[["WIDA_CO"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_CO"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_CO"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WIDA_CO"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="WIDA ACCESS",
	Assessment_Abbreviation="ACCESS",
	Organization=list(
		Name="Colorado Department of Education",
		Abbreviation="CDE",
		URL="www.schoolview.org",
		Contact="303-866-6763"),
	Scale_Change=list(READING="2013"),
	Assessment_Years=c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
	Content_Areas=c("READING", "LITERACY"),
	Grades_Tested= c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
	Test_Season="Spring")

SGPstateData[["WIDA_CO"]][["Student_Report_Information"]] <- list(
	sgPlot.year.span = 3,
	Grades_Reported=list(READING=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), LITERACY=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
	Vertical_Scale=list(READING=TRUE, LITERACY=TRUE),
	Content_Areas_Labels=list(READING="Overall", LITERACY="Overall"),
	Earliest_Year_Reported=list(READING = '2013', LITERACY = '2016'),
	Achievement_Level_Labels=list(
		"Entering"="L1",
		"Emerging"="L2",
		"Developing"="L3",
		"Expanding"="L4",
		"Bridging"="L5",
		"Reaching"="L6"))

SGPstateData[["WIDA_CO"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WIDA_CO_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

SGPstateData[["WIDA_CO"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=3,
	sgp.minimum.default.panel.years=2,
	arrow.legend.color=c("#FD5050", "#FDBF1A", "#07B806"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_CO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_CO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017

##  Custom ISR Meta Data
source('Custom_ISR/WIDA_CO/WIDA_CO_Custom_ISR-text.R')
WIDA_CO_Custom_ISR_Function <- source('Custom_ISR/WIDA_CO/WIDA_CO_Custom_ISR-function.R')

# require(png)
CDE.img <- readPNG("Custom_ISR/WIDA_CO/CDE.png")

# require(grid)
SGPstateData[["WIDA_CO"]][["Custom_Student_Report"]] <- list(
	report.width=8.5,
	report.height= 11,

	Custom_ISR_Function = WIDA_CO_Custom_ISR_Function,
	Report_Text_ENGLISH = Report_Text_ENGLISH,
	Report_Text_SPANISH = Report_Text_SPANISH,
	Report_Logo = CDE.img,
	Grid_Objects = list(
		report.vp = viewport(layout = grid.layout(13, 9, widths = unit(c(0.55, 0.1, 1.1, 1.5, 1.5, 0.35, 3.05, 0.25, 0.1), rep("inches", 9)),
			heights = unit(c(0.1, 0.3, 0.3, 0.4, 0.05, 0.15, 5.0, 0.05, 0.1, 0.25, 0.1, 3.7, 0.5), rep("inches", 13)))),

		top.school.name.vp = viewport(layout.pos.row=2, layout.pos.col=2:5),
		top.student.name.vp = viewport(layout.pos.row=3, layout.pos.col=2:4),
		top.student.id.vp = viewport(layout.pos.row=3, layout.pos.col=5),
		top.border.cde.vp = viewport(layout.pos.row=1:3, layout.pos.col=7:8),
		report_title.vp = viewport(layout.pos.row=4, layout.pos.col=3:7),
		color_block_1.vp = viewport(layout.pos.row=5, layout.pos.col=3:7),
		report_text.vp = viewport(layout.pos.row=7, layout.pos.col=3:7),
		color_block_2.vp = viewport(layout.pos.row=8, layout.pos.col=3:7),
		report.student.name.vp = viewport(layout.pos.row=10, layout.pos.col=2:5),

		content_area_1.vp = viewport(layout.pos.row=12, layout.pos.col=3:7), #4:7 with left.legend (could delete 3rd column too)

		left.border.vp = viewport(layout.pos.row=1:13, layout.pos.col=1),
		bottom.border.vp = viewport(layout.pos.row=13, layout.pos.col=2:7)
	)
)

#  Spanish ISR Version Info:

SGPstateData[["WIDA_CO_SPANISH"]] <- SGPstateData[["WIDA_CO"]]
SGPstateData[["WIDA_CO_SPANISH"]][["Growth"]][["Levels"]] <- c("Bajo", "T\u{ED}pico", "Alto")
SGPstateData[["WIDA_CO_SPANISH"]][["SGP_Configuration"]]  <- SGPstateData[["WIDA_CO"]][["SGP_Configuration"]]

SGPstateData[["WIDA_CO_SPANISH"]][["Student_Report_Information"]] <- list(
	sgPlot.year.span = 3,
	Grades_Reported=list(READING=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING = "Calificaci\u{F3}n General"),
	Earliest_Year_Reported=list(READING = '2013'),
	Achievement_Level_Labels=list(
		"Inicial"="L1",
		"En Transici\u{F3}n"="L2",
		"Desarrollado"="L3",
		"Elevado"="L4",
		"Apto"="L5",
		"Avanzado"="L6"))


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) DENVER PUBLIC SCHOOLS (DPS)
##########################################################################################

SGPstateData[["WIDA_DPS"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_DPS"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(237, 263, 288, 307, 329),
		GRADE_1=c(249, 277, 303, 321, 344),
		GRADE_2=c(261, 290, 316, 335, 357),
		GRADE_3=c(272, 303, 328, 347, 369),
		GRADE_4=c(283, 314, 340, 359, 380),
		GRADE_5=c(293, 324, 350, 369, 390),
		GRADE_6=c(302, 334, 359, 379, 399),
		GRADE_7=c(311, 342, 368, 386, 407),
		GRADE_8=c(319, 350, 375, 394, 414),
		GRADE_9=c(327, 357, 382, 400, 419),
		GRADE_10=c(333, 363, 387, 405, 424),
		GRADE_11=c(340, 368, 391, 409, 427),
		GRADE_12=c(346, 372, 395, 413, 430)),
	READING.2017=list(
		GRADE_0=c(229, 261, 293, 325, 350),
		GRADE_1=c(242, 274, 315, 344, 368),
		GRADE_2=c(254, 289, 329, 359, 383),
		GRADE_3=c(265, 300, 340, 371, 396),
		GRADE_4=c(279, 309, 350, 382, 406),
		GRADE_5=c(286, 317, 358, 390, 415),
		GRADE_6=c(291, 324, 365, 399, 423),
		GRADE_7=c(298, 331, 372, 406, 431),
		GRADE_8=c(304, 337, 378, 412, 438),
		GRADE_9=c(311, 344, 385, 418, 446),
		GRADE_10=c(318, 350, 391, 424, 453),
		GRADE_11=c(325, 356, 397, 429, 459),
		GRADE_12=c(331, 362, 402, 434, 466)))

SGPstateData[["WIDA_DPS"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1", "L2", "L3", "L4", "L5", "L6"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient"))

SGPstateData[["WIDA_DPS"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WIDA_DPS"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_DPS"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WIDA_DPS"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
	Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA_DPS"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="L1",
		"Emerging"="L2",
		"Developing"="L3",
		"Expanding"="L4",
		"Bridging"="L5",
		"Reaching"="L6"))

SGPstateData[["WIDA_DPS"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=5,
	sgp.minimum.default.panel.years=2,
	sgp.projections.max.forward.progression.years=7,
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#load("Baseline_Coefficient_Matrices/WIDA/WIDA_Baseline_Matrices.Rdata")
#SGPstateData[["WIDA_DPS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_DPS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) GEORGIA
##########################################################################################

SGPstateData[["WIDA_GA"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_GA"]][["Achievement"]][["Cutscores"]] <- SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]]

SGPstateData[["WIDA_GA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient",NA))

SGPstateData[["WIDA_GA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_GA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_GA"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

SGPstateData[["WIDA_GA"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
		Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA_GA"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="WIDA Level 1",
		"Emerging"="WIDA Level 2",
		"Developing"="WIDA Level 3",
		"Expanding"="WIDA Level 4",
		"Bridging"="WIDA Level 5",
		"Reaching"="WIDA Level 6"))

SGPstateData[["WIDA_GA"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=5,
	sgp.minimum.default.panel.years=2,
	sgp.projections.max.forward.progression.years=7,
	return.norm.group.scale.scores=TRUE,
	print.other.gp=TRUE,
	print.sgp.order=TRUE,
	projcuts.digits=0,
	percentile.cuts=c(1,35,50,65,99),
	lagged.percentile.trajectory.values=c(1,35,50,65,99),
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('WIDA Level', 1:4)",
	sgPlot.sgp.targets=c("sgp.projections.baseline", "sgp.projections.lagged.baseline"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_GA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_GA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) INDIANA
##########################################################################################

SGPstateData[["WIDA_IN"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_IN"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(229, 261, 293, 300, 309, 325, 350),
		GRADE_1=c(242, 274, 315, 321, 330, 344, 368),
		GRADE_2=c(254, 289, 329, 335, 344, 359, 383),
		GRADE_3=c(265, 300, 340, 347, 356, 371, 396),
		GRADE_4=c(279, 309, 350, 357, 366, 382, 406),
		GRADE_5=c(286, 317, 358, 365, 374, 390, 415),
		GRADE_6=c(291, 324, 365, 372, 382, 399, 423),
		GRADE_7=c(298, 331, 372, 379, 389, 406, 431),
		GRADE_8=c(304, 337, 378, 385, 395, 412, 438),
		GRADE_9=c(311, 344, 385, 392, 402, 418, 446),
		GRADE_10=c(318, 350, 391, 398, 408, 424, 453),
		GRADE_11=c(325, 356, 397, 404, 413, 429, 459),
		GRADE_12=c(331, 362, 402, 409, 418, 434, 466)))

SGPstateData[["WIDA_IN"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 4.2", "WIDA Level 4.5", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient","Proficient",NA))

SGPstateData[["WIDA_IN"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_IN"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_IN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WIDA_IN"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
		Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA_IN"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="WIDA Level 1",
		"Emerging"="WIDA Level 2",
		"Developing"="WIDA Level 3",
		"Expanding"="WIDA Level 4",
		"Bridging 4.2"="WIDA Level 4.2",
		"Bridging 4.5"="WIDA Level 4.5",
		"Bridging 5.0"="WIDA Level 5",
		"Reaching"="WIDA Level 6"))

SGPstateData[["WIDA_IN"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=1:6,
	sgp.minimum.default.panel.years=2,
	sgp.projections.max.forward.progression.years=7,
	return.norm.group.scale.scores=TRUE,
	print.other.gp=TRUE,
	print.sgp.order=TRUE,
	projcuts.digits=0,
	percentile.cuts=c(1,35,50,65,99),
	lagged.percentile.trajectory.values=c(1,35,50,65,99),
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('WIDA Level', 1:4)",
	sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"),
	sgp.target.scale.scores.merge="1_year_lagged_current")

#SGPstateData[["WIDA_IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) MASSACHUSETTS
##########################################################################################

load("Knots_Boundaries/WIDA_MA_Knots_Boundaries.Rdata")
SGPstateData[["WIDA_MA"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_MA_Knots_Boundaries

SGPstateData[["WIDA_MA"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(453, 466, 485, 500),
		GRADE_1=c(453, 466, 485, 500),
		GRADE_2=c(453, 466, 485, 500),
		GRADE_3=c(432, 452, 474, 500),
		GRADE_4=c(432, 452, 474, 500),
		GRADE_5=c(436, 456, 479, 500),
		GRADE_6=c(436, 456, 479, 500),
		GRADE_7=c(443, 464, 486, 500),
		GRADE_8=c(443, 464, 486, 500),
		GRADE_9=c(450, 464, 489, 500),
		GRADE_10=c(450, 464, 489, 500),
		GRADE_11=c(450, 464, 489, 500),
		GRADE_12=c(450, 464, 489, 500)),
	READING.2013=SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]][["READING"]],
	READING.2016=list(
		GRADE_0=c(229, 261, 293, 325, 350),
		GRADE_1=c(242, 274, 315, 344, 368),
		GRADE_2=c(254, 289, 329, 359, 383),
		GRADE_3=c(265, 300, 340, 371, 396),
		GRADE_4=c(279, 309, 350, 382, 406),
		GRADE_5=c(286, 317, 358, 390, 415),
		GRADE_6=c(291, 324, 365, 399, 423),
		GRADE_7=c(298, 331, 372, 406, 431),
		GRADE_8=c(304, 337, 378, 412, 438),
		GRADE_9=c(311, 344, 385, 418, 446),
		GRADE_10=c(318, 350, 391, 424, 453),
		GRADE_11=c(325, 356, 397, 429, 459),
		GRADE_12=c(331, 362, 402, 434, 466)),
	READING.2017=list(
		GRADE_0=c(229, 261, 293, 300, 325, 350),
		GRADE_1=c(242, 274, 315, 321, 344, 368),
		GRADE_2=c(254, 289, 329, 335, 359, 383),
		GRADE_3=c(265, 300, 340, 347, 371, 396),
		GRADE_4=c(279, 309, 350, 357, 382, 406),
		GRADE_5=c(286, 317, 358, 365, 390, 415),
		GRADE_6=c(291, 324, 365, 372, 399, 423),
		GRADE_7=c(298, 331, 372, 379, 406, 431),
		GRADE_8=c(304, 337, 378, 385, 412, 438),
		GRADE_9=c(311, 344, 385, 392, 418, 446),
		GRADE_10=c(318, 350, 391, 398, 424, 453),
		GRADE_11=c(325, 356, 397, 404, 429, 459),
		GRADE_12=c(331, 362, 402, 409, 434, 466)))


SGPstateData[["WIDA_MA"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 4.2", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient", NA))

SGPstateData[["WIDA_MA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_MA"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_MA"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA_MA"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="WIDA",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="Massachusetts Department of Elementary and Secondary Education",
		Abbreviation="ESE",
		URL="http://www.doe.mass.edu/",
		Contact="781-338-3000"),
	Scale_Change=list(READING="2016"),
	Assessment_Years=c("2011", "2012", "2013", "2014", "2015", "2016", "2017"),
	Content_Areas="READING",
	Grades_Tested= c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
	Test_Season="Spring")

SGPstateData[["WIDA_MA"]][["Student_Report_Information"]] <- list(
	Grades_Reported=list(READING=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING = "Overall"),
	Achievement_Level_Labels=list(
		"WIDA L1"="WIDA Level 1",
		"WIDA L2"="WIDA Level 2",
		"WIDA L3"="WIDA Level 3",
		"WIDA L4"="WIDA Level 4",
		"WIDA L4.2"="WIDA Level 4.2",
		"WIDA L5"="WIDA Level 5",
		"WIDA L6"="WIDA Level 6"))

SGPstateData[["WIDA_MA"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="ACCESS",
		Assessment_Abbreviation.2017="ACCESS 2.0",
		Assessment_Name="ACCESS",
		Assessment_Name.2017="ACCESS 2.0",
		Achievement_Levels=list(
			Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
		Achievement_Levels.2017=list(
			Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 4.2", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
			Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient", "Proficient", "Proficient","Proficient",NA)),
		Achievement_Level_Labels=list(
			"WIDA L1"="WIDA Level 1",
			"WIDA L2"="WIDA Level 2",
			"WIDA L3"="WIDA Level 3",
			"WIDA L4"="WIDA Level 4",
			"WIDA L5"="WIDA Level 5",
			"WIDA L6"="WIDA Level 6"),
		Achievement_Level_Labels.2017=list(
			"WIDA L1"="WIDA Level 1",
			"WIDA L2"="WIDA Level 2",
			"WIDA L3"="WIDA Level 3",
			"WIDA L4"="WIDA Level 4",
			"WIDA L4.2"="WIDA Level 4.2",
			"WIDA L5"="WIDA Level 5",
			"WIDA L6"="WIDA Level 6"),
		Content_Areas_Labels=list(READING="Reading"),
		Content_Areas_Labels.2017=list(READING="Reading"),
		Vertical_Scale="Yes",
		Vertical_Scale.2017="Yes",
		Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
		Grades_Tested.2017=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
		Year="2017",
		Preequated_by_Contractor=TRUE#,
#		Baseline_Projections_in_Transition_Year=TRUE
		)

SGPstateData[["WIDA_MA"]][["SGP_Configuration"]] <- list(
		max.order.for.percentile=2,
		max.order.for.projection=2,
		max.sgp.target.years.forward=1:5,
		sgp.projections.max.forward.progression.years=7,
		sgp.minimum.default.panel.years=2,
		percentile.cuts=c(1,35,50,66,99),
		sgp.target.scale.scores.merge="1_year_lagged_current",
		sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('Level', 1:4)",
		sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
		sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_MA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_MA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) MICHIGAN
##########################################################################################

SGPstateData[["WIDA_MI"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_MI"]][["Achievement"]][["Cutscores"]] <- list(
                    READING=list(
                                        GRADE_0=c(229, 261, 293, 300, 309, 325, 350),
                                        GRADE_1=c(242, 274, 315, 321, 330, 344, 368),
                                        GRADE_2=c(254, 289, 329, 335, 344, 359, 383),
                                        GRADE_3=c(265, 300, 340, 347, 356, 371, 396),
                                        GRADE_4=c(279, 309, 350, 357, 366, 382, 406),
                                        GRADE_5=c(286, 317, 358, 365, 374, 390, 415),
                                        GRADE_6=c(291, 324, 365, 372, 382, 399, 423),
                                        GRADE_7=c(298, 331, 372, 379, 389, 406, 431),
                                        GRADE_8=c(304, 337, 378, 385, 395, 412, 438),
                                        GRADE_9=c(311, 344, 385, 392, 402, 418, 446),
                                        GRADE_10=c(318, 350, 391, 398, 408, 424, 453),
                                        GRADE_11=c(325, 356, 397, 404, 413, 429, 459),
                                        GRADE_12=c(331, 362, 402, 409, 418, 434, 466)))

SGPstateData[["WIDA_MI"]][["Achievement"]][["Levels"]] <- list(
                    Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 4.2", "WIDA Level 4.5", "WIDA Level 5", "WIDA Level 6"),
                    Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient"))

#SGPstateData[["WIDA_MI"]][["Achievement"]][["Cutscores"]] <- list(
#	READING=list(
#		GRADE_0=c(493, 517, 531, 552),
#		GRADE_1=c(519, 542, 575, 595),
#		GRADE_2=c(527, 556, 595, 617),
#		GRADE_3=c(531, 572, 620, 639),
#		GRADE_4=c(536, 579, 626, 647),
#		GRADE_5=c(545, 585, 633, 653),
#		GRADE_6=c(554, 598, 635, 657),
#		GRADE_7=c(557, 607, 641, 662),
#		GRADE_8=c(564, 609, 648, 671),
#		GRADE_9=c(586, 620, 658, 681),
#		GRADE_10=c(588, 622, 662, 681),
#		GRADE_11=c(590, 632, 665, 685),
#		GRADE_12=c(593, 639, 673, 693)),
#	READING.2014=SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]][["READING"]],
#	READING.2017=SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]][["READING.2017"]])

#SGPstateData[["WIDA_MI"]][["Achievement"]][["Levels"]] <- list(
#	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
#	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient",NA))

SGPstateData[["WIDA_MI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_MI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_MI"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA_MI"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="Michigan Department of Education",
		Abbreviation="MDE",
		URL="www.michigan.gov/mde",
		Contact="517-373-3324"),
	Scale_Change=list(READING="2014"),
	Assessment_Years=c("2012", "2013", "2014", "2015", "2016", "2017"),
	Content_Areas="READING",
	Grades_Tested= c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
	Test_Season="Spring",
	CSEM="CSEM")

SGPstateData[["WIDA_MI"]][["Student_Report_Information"]] <- list(
	Grades_Reported=list(READING=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)),
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING = "Overall"),
	Achievement_Level_Labels=list(
		"WIDA L1"="WIDA Level 1",
		"WIDA L2"="WIDA Level 2",
		"WIDA L3"="WIDA Level 3",
		"WIDA L4"="WIDA Level 4",
		"WIDA L5"="WIDA Level 5",
		"WIDA L6"="WIDA Level 6"))

#SGPstateData[["WIDA_MI"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
#	list(
#		Assessment_Abbreviation="MI-ELPA",
#		Assessment_Abbreviation.2014="WIDA",
#		Assessment_Name="Michigan English Language Proficiency Exam",
#		Assessment_Name.2014="World Class Instructional Design and Assessment",
#		Achievement_Levels=list(
#			Labels=c("MI-ELPA Level 1", "MI-ELPA Level 2", "MI-ELPA Level 3", "MI-ELPA Level 4", "MI-ELPA Level 5", "NO SCORE"),
#			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
#		Achievement_Levels.2014=list(
#			Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
#			Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
#		Achievement_Level_Labels=list(
#			"MI-ELPA L1"="MI-ELPA Level 1",
#			"MI-ELPA L2"="MI-ELPA Level 2",
#			"MI-ELPA L3"="MI-ELPA Level 3",
#			"MI-ELPA L4"="MI-ELPA Level 4",
#			"MI-ELPA L5"="MI-ELPA Level 5"),
#		Achievement_Level_Labels.2014=list(
#			"WIDA L1"="WIDA Level 1",
#			"WIDA L2"="WIDA Level 2",
#			"WIDA L3"="WIDA Level 3",
#			"WIDA L4"="WIDA Level 4",
#			"WIDA L5"="WIDA Level 5",
#			"WIDA L6"="WIDA Level 6"),
#		Content_Areas_Labels=list(READING="Reading"),
#		Content_Areas_Labels.2014=list(READING="Reading"),
#		Vertical_Scale="Yes",
#		Vertical_Scale.2014="Yes",
#		Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
#		Grades_Tested.2014=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
#		Year="2014",
#		Baseline_Projections_in_Transition_Year=TRUE
#		)

SGPstateData[["WIDA_MI"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=1:7,
	sgp.target.scale.scores.merge="1_year_lagged_current",
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('WIDA Level', 1:4)",
	sgp.projections.max.forward.progression.years=7,
	sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_MI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_MI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) NEVADA
##########################################################################################

load("Knots_Boundaries/WIDA_NV_Knots_Boundaries.Rdata")
SGPstateData[["WIDA_NV"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_NV_Knots_Boundaries

SGPstateData[["WIDA_NV"]][["Achievement"]][["Cutscores"]] <- SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]]
SGPstateData[["WIDA_NV"]][["Achievement"]][["Cutscores"]][['READING.2017']] <- list(
					GRADE_0=c(229, 261, 293, 309, 325, 350),
					GRADE_1=c(242, 274, 315, 330, 344, 368),
					GRADE_2=c(254, 289, 329, 344, 359, 383),
					GRADE_3=c(265, 300, 340, 356, 371, 396),
					GRADE_4=c(279, 309, 350, 366, 382, 406),
					GRADE_5=c(286, 317, 358, 374, 390, 415),
					GRADE_6=c(291, 324, 365, 382, 399, 423),
					GRADE_7=c(298, 331, 372, 389, 406, 431),
					GRADE_8=c(304, 337, 378, 395, 412, 438),
					GRADE_9=c(311, 344, 385, 402, 418, 446),
					GRADE_10=c(318, 350, 391, 408, 424, 453),
					GRADE_11=c(325, 356, 397, 413, 429, 459),
					GRADE_12=c(331, 362, 402, 418, 434, 466))

SGPstateData[["WIDA_NV"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1", "L2", "L3", "L4", "L4.5", "L5", "L6"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient","Proficient"))

SGPstateData[["WIDA_NV"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WIDA_NV"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_NV"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA_NV"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA_NV",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
		Abbreviation="WIDA_NV",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2013", "2014", "2015", "2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA_NV")

SGPstateData[["WIDA_NV"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="L1",
		"Emerging"="L2",
		"Developing"="L3",
		"Expanding"="L4",
		"Expanding+"="L4.5",
		"Bridging"="L5",
		"Reaching"="L6"))

SGPstateData[["WIDA_NV"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=5,
	sgp.projections.max.forward.progression.years=7,
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% c('L1', 'L2', 'L3', 'L4')",
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) NEW HAMPSHIRE
##########################################################################################

SGPstateData[["WIDA_NH"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_NH"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(229, 261, 293, 300, 309, 325, 350),
		GRADE_1=c(242, 274, 315, 321, 330, 344, 368),
		GRADE_2=c(254, 289, 329, 335, 344, 359, 383),
		GRADE_3=c(265, 300, 340, 347, 356, 371, 396),
		GRADE_4=c(279, 309, 350, 357, 366, 382, 406),
		GRADE_5=c(286, 317, 358, 365, 374, 390, 415),
		GRADE_6=c(291, 324, 365, 372, 382, 399, 423),
		GRADE_7=c(298, 331, 372, 379, 389, 406, 431),
		GRADE_8=c(304, 337, 378, 385, 395, 412, 438),
		GRADE_9=c(311, 344, 385, 392, 402, 418, 446),
		GRADE_10=c(318, 350, 391, 398, 408, 424, 453),
		GRADE_11=c(325, 356, 397, 404, 413, 429, 459),
		GRADE_12=c(331, 362, 402, 409, 418, 434, 466)))

SGPstateData[["WIDA_NH"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 4.2", "WIDA Level 4.5", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
	Proficient=c("Not Proficient", "Not Proficient", "Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient","Proficient", NA))

SGPstateData[["WIDA_NH"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_NH"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

SGPstateData[["WIDA_NH"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA_NH"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
		Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2017", "2018"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA_NH"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="WIDA Level 1",
		"Emerging"="WIDA Level 2",
		"Developing"="WIDA Level 3",
		"Expanding"="WIDA Level 4",
		"Bridging 4.2"="WIDA Level 4.2",
		"Bridging 4.5"="WIDA Level 4.5",
		"Bridging 5.0"="WIDA Level 5",
		"Reaching"="WIDA Level 6"))

SGPstateData[["WIDA_NH"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=1:6,
	sgp.minimum.default.panel.years=2,
	sgp.projections.max.forward.progression.years=7,
	return.norm.group.scale.scores=TRUE,
	print.other.gp=TRUE,
	print.sgp.order=TRUE,
	projcuts.digits=0,
	percentile.cuts=c(1,35,50,65,99),
	goodness.of.fit.minimum.n=10,
	lagged.percentile.trajectory.values=c(1,35,50,65,99),
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('WIDA Level', 1:4)",
	sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"),
	sgp.target.scale.scores.merge="1_year_lagged_current")

#SGPstateData[["WIDA_NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) RHODE ISLAND
##########################################################################################

SGPstateData[["WIDA_RI"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_RI"]][["Achievement"]][["Cutscores"]] <- SGPstateData[["WIDA"]][["Achievement"]][["Cutscores"]]

SGPstateData[["WIDA_RI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("WIDA Level 1", "WIDA Level 2", "WIDA Level 3", "WIDA Level 4", "WIDA Level 5", "WIDA Level 6", "NO SCORE"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient",NA))

SGPstateData[["WIDA_RI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_RI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st-34th","35th-65th","66th-99th"))

#SGPstateData[["WIDA_RI"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"
SGPstateData[["WIDA_RI"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

SGPstateData[["WIDA_RI"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
		Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2011", "2012", "2013", "2014", "2015", "2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA")

SGPstateData[["WIDA_RI"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="WIDA Level 1",
		"Emerging"="WIDA Level 2",
		"Developing"="WIDA Level 3",
		"Expanding"="WIDA Level 4",
    	"Bridging"="WIDA Level 5",
    	"Reaching"="WIDA Level 6"))

SGPstateData[["WIDA_RI"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	max.sgp.target.years.forward=5,
	sgp.minimum.default.panel.years=2,
	sgp.projections.max.forward.progression.years=7,
	return.norm.group.scale.scores=TRUE,
	print.other.gp=TRUE,
	print.sgp.order=TRUE,
	projcuts.digits=0,
	sgPlot.fan.condition="head(Achievement_Levels, 1) %in% paste('WIDA Level', 1:4)",
	sgPlot.sgp.targets=c("sgp.projections.baseline", "sgp.projections.lagged.baseline"),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#SGPstateData[["WIDA_RI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
SGPstateData[["WIDA_RI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


##########################################################################################
### WORLD CLASS INSTRUCTIONAL DESIGN and ASSESSMENT (WIDA) WISCONSIN
##########################################################################################

load("Knots_Boundaries/WIDA_Knots_Boundaries.Rdata")
SGPstateData[["WIDA_WI"]][["Achievement"]][["Knots_Boundaries"]] <- WIDA_Knots_Boundaries

SGPstateData[["WIDA_WI"]][["Achievement"]][["Cutscores"]] <- list(
	READING=list(
		GRADE_0=c(237, 263, 288, 307, 329),
		GRADE_1=c(249, 277, 303, 321, 344),
		GRADE_2=c(261, 290, 316, 335, 357),
		GRADE_3=c(272, 303, 328, 347, 369),
		GRADE_4=c(283, 314, 340, 359, 380),
		GRADE_5=c(293, 324, 350, 369, 390),
		GRADE_6=c(302, 334, 359, 379, 399),
		GRADE_7=c(311, 342, 368, 386, 407),
		GRADE_8=c(319, 350, 375, 394, 414),
		GRADE_9=c(327, 357, 382, 400, 419),
		GRADE_10=c(333, 363, 387, 405, 424),
		GRADE_11=c(340, 368, 391, 409, 427),
		GRADE_12=c(346, 372, 395, 413, 430)),
	READING.2017=list(
		GRADE_0=c(229, 261, 293, 325, 350),
		GRADE_1=c(242, 274, 315, 344, 368),
		GRADE_2=c(254, 289, 329, 359, 383),
		GRADE_3=c(265, 300, 340, 371, 396),
		GRADE_4=c(279, 309, 350, 382, 406),
		GRADE_5=c(286, 317, 358, 390, 415),
		GRADE_6=c(291, 324, 365, 399, 423),
		GRADE_7=c(298, 331, 372, 406, 431),
		GRADE_8=c(304, 337, 378, 412, 438),
		GRADE_9=c(311, 344, 385, 418, 446),
		GRADE_10=c(318, 350, 391, 424, 453),
		GRADE_11=c(325, 356, 397, 429, 459),
		GRADE_12=c(331, 362, 402, 434, 466)))

SGPstateData[["WIDA_WI"]][["Achievement"]][["Levels"]] <- list(
	Labels=c("L1", "L2", "L3", "L4", "L5", "L6"),
	Proficient=c("Not Proficient","Not Proficient","Not Proficient","Not Proficient","Proficient","Proficient"))

SGPstateData[["WIDA_WI"]][["Growth"]][["Cutscores"]] <- list(
	Cuts=c(35, 66),
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WIDA_WI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WIDA_WI"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["WIDA_WI"]][["Assessment_Program_Information"]] <- list(
	Assessment_Name="World Class Instructional Design and Assessment",
	Assessment_Abbreviation="WIDA",
	Organization=list(
		Name="World Class Instructional Design and Assessment",
	Abbreviation="WIDA",
		URL="http://www.wida.us/",
		Contact="1-866-276-7735"),
	Content_Areas="Reading",
	Grades_Tested=c(0,1,2,3,4,5,6,7,8,9,10,11,12),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"),
	Test_Season="Spring",
	Test_Vendor="WIDA",
	CSEM="SCALE_SCORE_CSEM")

SGPstateData[["WIDA_WI"]][["Student_Report_Information"]] <- list(
	Vertical_Scale=list(READING=TRUE),
	Content_Areas_Labels=list(READING="Reading"),
	Grades_Reported=list(READING=c(0,1,2,3,4,5,6,7,8,9,10,11,12)),
	Achievement_Level_Labels=list(
		"Entering"="L1",
		"Emerging"="L2",
		"Developing"="L3",
		"Expanding"="L4",
		"Bridging"="L5",
		"Reaching"="L6"))

SGPstateData[["WIDA_WI"]][["SGP_Configuration"]] <- list(
	max.order.for.percentile=2,
	max.order.for.projection=2,
	sgp.minimum.default.panel.years=2,
	max.sgp.target.years.forward=5,
	sgp.projections.max.forward.progression.years=7,
	percentile.cuts=c(1,35,50,65,99),
	print.other.gp=TRUE,
	calculate.confidence.intervals=list(confidence.quantiles=c(0.025, 0.975)),
	sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_Current_CUKU"))

#load("Baseline_Coefficient_Matrices/WIDA/WIDA_Baseline_Matrices.Rdata")
#SGPstateData[["WIDA_WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Baseline_Matrices
load("Baseline_Coefficient_Matrices/WIDA/WIDA_Cohort_Referenced_Matrices_2017.Rdata")
SGPstateData[["WIDA_WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- WIDA_Cohort_Referenced_Matrices_2017


#########################################################
### WYOMING
#########################################################

SGPstateData[["WY"]][["Achievement"]][["Knots_Boundaries"]] <-
  list(
	MATHEMATICS=list(
		boundaries_3 = c(260.1, 894.9),
		boundaries_4 = c(285.3, 917.7),
		boundaries_5 = c(318.8, 957.2),
		boundaries_6 = c(352.8, 967.2),
		boundaries_7 = c(367.4, 998.6),
		boundaries_8 = c(391.9, 1017.1),
		knots_3 = c(608, 642, 667, 698),
		knots_4 = c(618, 649, 675, 707),
		knots_5 = c(637, 667, 697, 730),
		knots_6 = c(661, 692, 720, 753),
		knots_7 = c(674, 704, 732, 765),
		knots_8 = c(686, 715, 742, 774),
		loss.hoss_3 = c(313, 842),
		loss.hoss_4 = c(338, 865),
		loss.hoss_5 = c(372, 904),
		loss.hoss_6 = c(404, 916),
		loss.hoss_7 = c(420, 946),
		loss.hoss_8 = c(444, 965)),
	READING=list(
		boundaries_3 = c(249, 861),
		boundaries_4 = c(307.8, 922.2),
		boundaries_5 = c(292.8, 931.2),
		boundaries_6 = c(316.9, 966.1),
		boundaries_7 = c(312.9, 962.1),
		boundaries_8 = c(356, 992),
		knots_3 = c(551, 584, 611, 639),
		knots_4 = c(627, 659, 683, 710),
		knots_5 = c(622, 653, 678, 706),
		knots_6 = c(641, 674, 697, 724),
		knots_7 = c(645, 674, 697, 722),
		knots_8 = c(660, 690, 714, 740),
		loss.hoss_3 = c(300, 810),
		loss.hoss_4 = c(359, 871),
		loss.hoss_5 = c(346, 878),
		loss.hoss_6 = c(371, 912),
		loss.hoss_7 = c(367, 908),
		loss.hoss_8 = c(409, 939)),
	MATHEMATICS.2013_2014=list(
		boundaries_3 = c(332.8, 839.2),
		boundaries_4 = c(398.1, 876.9),
		boundaries_5 = c(495.3, 887.7),
		boundaries_6 = c(513.8, 912.2),
		boundaries_7 = c(516.8, 951.2),
		boundaries_8 = c(518.7, 954.3),
		knots_3 = c(559, 586, 608, 640),
		knots_4 = c(596, 620, 641, 668),
		knots_5 = c(616, 642, 669, 700),
		knots_6 = c(636, 660, 687, 718),
		knots_7 = c(653, 675, 697, 726),
		knots_8 = c(667, 692, 716, 746),
		loss.hoss_3 = c(375, 797),
		loss.hoss_4 = c(438, 837),
		loss.hoss_5 = c(528, 855),
		loss.hoss_6 = c(547, 879),
		loss.hoss_7 = c(553, 915),
		loss.hoss_8 = c(555, 918)),
	READING.2013_2014 = list(
		boundaries_3 = c(365.5, 803.5),
		boundaries_4 = c(409.7, 821.3),
		boundaries_5 = c(438.6, 827.4),
		boundaries_6 = c(453.8, 852.2),
		boundaries_7 = c(440.6, 865.4),
		boundaries_8 = c(467.3, 859.7),
		knots_3 = c(557, 590, 615, 641),
		knots_4 = c(579, 606, 632, 652),
		knots_5 = c(590, 616, 641, 668),
		knots_6 = c(593, 622, 650, 675),
		knots_7 = c(609, 638, 662, 687),
		loss.hoss_3 = c(402, 767),
		knots_8 = c(623, 652, 677, 702),
		loss.hoss_4 = c(444, 787),
		loss.hoss_5 = c(471, 795),
		loss.hoss_6 = c(487, 819),
		loss.hoss_7 = c(476, 830),
		loss.hoss_8 = c(500, 827)))

SGPstateData[["WY"]][["Achievement"]][["Cutscores"]] <-
  list(
  	MATHEMATICS=list(
		GRADE_3 = c(558, 600, 680),
		GRADE_4 = c(584, 620, 698),
		GRADE_5 = c(607, 645, 721),
		GRADE_6 = c(632, 663, 741),
		GRADE_7 = c(653, 687, 758),
		GRADE_8 = c(676, 706, 777)),
	READING=list(
		GRADE_3 = c(520, 584, 661),
		GRADE_4 = c(570, 634, 700),
		GRADE_5 = c(587, 639, 707),
		GRADE_6 = c(594, 650, 718),
		GRADE_7 = c(610, 668, 746),
		GRADE_8 = c(624, 676, 749)),

	MATHEMATICS.2013_2014=list(
		GRADE_3 = c(550, 599, 660),
		GRADE_4 = c(584, 637, 697),
		GRADE_5 = c(609, 652, 727),
		GRADE_6 = c(629, 677, 743),
		GRADE_7 = c(653, 697, 753),
		GRADE_8 = c(664, 707, 763)),
	READING.2013_2014=list(
		GRADE_3 = c(553, 590, 641),
		GRADE_4 = c(566, 606, 660),
		GRADE_5 = c(578, 620, 668),
		GRADE_6 = c(589, 630, 681),
		GRADE_7 = c(606, 642, 693),
		GRADE_8 = c(616, 656, 711)))

SGPstateData[["WY"]][["Achievement"]][["Levels"]] <-
	list(
		Labels = c("Below basic", "Basic", "Proficient", "Advanced", "No Score"),
		Proficient = c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["WY"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WY"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WY"]][["Growth"]][["Cutscores"]] <-
	list(
		Cuts = c(35, 66),
		Labels = c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WY"]][["Assessment_Program_Information"]] <-
	list(
		Assessment_Name="Wyoming PAWS",
		Assessment_Abbreviation="PAWS",
		Organization=list(
			Name="Wyoming Department of Education",
			Abbreviation="WY",
			URL="http://edu.wyoming.gov/educators/assessment/paws/",
			Contact="deb.lindsey@wyo.gov"),
		Content_Areas=c("Mathematics", "Reading"),
		Grades_Tested=c(3,4,5,6,7,8),
		Scale_Change=list(MATHEMATICS="2013_2014", READING="2013_2014"),
		Assessment_Years=c("2007_2008","2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013", "2013_2014", "2014_2015", "2015_2016"))

SGPstateData[["WY"]][["Student_Report_Information"]] <-
	list(
		Vertical_Scale=list(MATHEMATICS=TRUE, READING=TRUE),
		Content_Areas_Labels=list(MATHEMATICS="Mathematics", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
#		Earliest_Year_Reported=list(MATHEMATICS="2013_2014", READING="2013_2014"),
		Achievement_Level_Labels=list(
			"Below basic" = "Below",
			"Basic" = "Basic",
			"Proficient" = "Proficient",
			"Advanced" = "Advanced"))

SGPstateData[["WY"]][["Assessment_Program_Information"]][["Assessment_Transition"]] <-
	list(
		Assessment_Abbreviation="PAWS Pre",
		Assessment_Abbreviation.2013_2014="PAWS",
		Assessment_Name="Public Assessment of Wyoming Students (pre- 2013-14 Standards)",
		Assessment_Name.2013_2014="Public Assessment of Wyoming Students (2013-14 Standards)",
		Achievement_Levels=list(
		Labels=c("Below Basic", "Basic", "Proficient", "Advanced", "No Score"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
		Achievement_Levels.2013_2014=list(
		Labels=c("Below Basic", "Basic", "Proficient", "Advanced", "No Score"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA)),
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"),
		Achievement_Level_Labels.2013_2014=list(
			"Below Basic"="Below Basic",
			"Basic"="Basic",
			"Proficient"="Proficient",
			"Advanced"="Advanced"),
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Content_Areas_Labels.2013_2014=list(MATHEMATICS="Math", READING="Reading"),
		Vertical_Scale="Yes",
		Vertical_Scale.2013_2014="Yes",
		Year="2013_2014"
		)


######################################################
###
###    Create 'digest' stamp and save the result
###
######################################################

SGPstateData[["digest"]] <- NULL
SGPstateData[["digest"]] <- digest::digest(SGPstateData)

save(SGPstateData, file="SGPstateData.rda", compress="xz")
