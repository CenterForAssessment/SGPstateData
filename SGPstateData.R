###################################################################################################
####
#### File to produce SGPstateData containing state cutscores and other assessment program information
####
#### NOTE: All variables used for merges are in ALL CAPS. Otherwise camel case
#### NOTE: Cutscores are the LOWER BOUND of the performance level
####
###################################################################################################

SGPstateData <- new.env()

### Load NECAP CSEM data

load("CSEM/NECAP/NECAP_CSEM.Rdata")


### ALBUQUERQUE

load("Knots_Boundaries/ABQ_Knots_Boundaries.Rdata")
SGPstateData[["ABQ"]][["Achievement"]][["Knots_Boundaries"]] <- ABQ_Knots_Boundaries

SGPstateData[["ABQ"]][["Achievement"]][["Cutscores"]] <- list(
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
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Beginning"="Beginning Step", 
		"Nearing"="Nearing Proficient", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))

SGPstateData[["ABQ"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/ABQ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### ARCHDIOCESE OF BALTIMORE

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


### ARKANSAS

load("Knots_Boundaries/AR_Knots_Boundaries.Rdata")
SGPstateData[["AR"]][["Achievement"]][["Knots_Boundaries"]] <- AR_Knots_Boundaries

SGPstateData[["AR"]][["Achievement"]][["Cutscores"]] <- list(
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
								GRADE_8=c(507,700,914)))

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
		Test_Vendor="Riverside Publishing")

SGPstateData[["AR"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), LITERACY=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), LITERACY=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", LITERACY="Lit"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), LITERACY=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic",
		"Basic"="Basic",
		"Proficient"="Proficient",
		"Advanced"="Advanced"))

load("Baseline_Coefficient_Matrices/AR_Baseline_Matrices.Rdata")
SGPstateData[["AR"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- AR_Baseline_Matrices

### ARIZONA

SGPstateData[["AZ"]][["Achievement"]][["Knots_Boundaries"]] <-
        list(MATHEMATICS=list(
                boundaries_2=c(328.35, 738.65),
                boundaries_3=c(177.5, 672.5),
                boundaries_4=c(207.75, 697.25),
                boundaries_5=c(232.75, 722.25),
                boundaries_6=c(247.25, 747.75),
                boundaries_7=c(267.5, 762.5),
                boundaries_8=c(275, 825),
                boundaries_9=c(379.3, 900.7),
                boundaries_10=c(503.1, 918.9),
                knots_2=c(538, 559, 577, 599),
                knots_3=c(406, 436, 461, 489),
                knots_4=c(435, 470, 497, 530),
                knots_5=c(457, 489, 516, 549),
                knots_6=c(468, 503, 534, 571),
                knots_7=c(497, 530, 559, 591),
                knots_8=c(503, 538, 569, 606),
                knots_9=c(660, 688, 709, 732),
                knots_10=c(664, 691, 713, 741),
                loss.hoss_2=c(347, 720),
                loss.hoss_3=c(200, 650),
                loss.hoss_4=c(230, 675),
                loss.hoss_5=c(255, 700),
                loss.hoss_6=c(270, 725),
                loss.hoss_7=c(290, 740),
                loss.hoss_8=c(300, 800),
                loss.hoss_9=c(403, 877),
                loss.hoss_10=c(522, 900)),
        MATHEMATICS.2010=list(
		boundaries_2=c(389.4, 710.6),
                boundaries_3=c(192.45, 556.55),
                boundaries_4=c(186.2, 577.8),
                boundaries_5=c(144.25, 600.75),
                boundaries_6=c(138, 622),
                boundaries_7=c(221, 639),
                boundaries_8=c(268.3, 657.7),
                boundaries_9=c(557.85, 869.15),
		boundaries_10=c(275.85, 807.15),
		knots_2=c(554, 580, 605, 628),
                knots_3=c(325, 356, 381, 409),
                knots_4=c(339, 371, 396, 421),
                knots_5=c(351, 381, 408, 436),
                knots_6=c(364, 395, 422, 451),
                knots_7=c(379, 408, 434, 466),
                knots_8=c(394, 420, 444, 474),
                knots_9=c(686, 702, 724, 749),
                knots_10=c(458, 486, 509, 539),
		loss.hoss_2=c(404, 696),
                loss.hoss_3=c(209, 540),
                loss.hoss_4=c(204, 560),
                loss.hoss_5=c(165, 580),
                loss.hoss_6=c(160, 600),
                loss.hoss_7=c(240, 620),
                loss.hoss_8=c(286, 640),
                loss.hoss_9=c(572, 855),
                loss.hoss_10=c(300, 783)),
        READING=list(
		boundaries_2=c(408.05, 736.95),
                boundaries_3=c(178, 662),
                boundaries_4=c(198, 682),
                boundaries_5=c(218.25, 696.75),
                boundaries_6=c(228, 712),
                boundaries_7=c(237, 743),
                boundaries_8=c(243.5, 826.5),
                boundaries_9=c(457.1, 850.9),
		boundaries_10=c(480, 920),
		knots_2=c(575, 599, 617, 638),
		knots_3=c(413, 443, 469, 499),
		knots_4=c(430, 463, 488, 519),
                knots_5=c(451, 483, 507, 532),
                knots_6=c(460, 492, 517, 543),
                knots_7=c(473, 506, 532, 562),
                knots_8=c(474, 509, 538, 568),
                knots_9=c(655, 676, 696, 721),
                knots_10=c(663, 694, 720, 746),
		loss.hoss_2=c(423, 722),
		loss.hoss_3=c(200, 640),
		loss.hoss_4=c(220, 660),
                loss.hoss_5=c(240, 675),
                loss.hoss_6=c(250, 690),
                loss.hoss_7=c(260, 720),
                loss.hoss_8=c(270, 800),
                loss.hoss_9=c(475, 833),
                loss.hoss_10=c(500, 900)))
                                                                         
SGPstateData[["AZ"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_3=c(386, 420, 492),
		GRADE_4=c(414, 448, 521),
		GRADE_5=c(442, 476, 550),
		GRADE_6=c(463, 496, 574),
		GRADE_7=c(484, 517, 599),
		GRADE_8=c(505, 537, 623),
		GRADE_10=c(668, 683, 750)),
	READING=list(
		GRADE_3=c(379, 431, 516),
		GRADE_4=c(402, 450, 536),
		GRADE_5=c(424, 468, 556),
		GRADE_6=c(433, 478, 571),
		GRADE_7=c(443, 489, 587),
		GRADE_8=c(452, 499, 602),
		GRADE_10=c(627, 674, 773)),
	MATHEMATICS.2010=list(
		GRADE_3=c(303, 347, 406),
		GRADE_4=c(331, 366, 416),
		GRADE_5=c(348, 381, 436),
		GRADE_6=c(366, 398, 446),
		GRADE_7=c(382, 411, 460),
		GRADE_8=c(409, 426, 475),
		GRADE_10=c(471, 487, 537)))

SGPstateData[["AZ"]][["Achievement"]][["Levels"]] <-
        list(
        Labels=c("Falls Far Below", "Approaches", "Meets", "Exceeds"),
        Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["AZ"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Typical", "High", "Very High")

SGPstateData[["AZ"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["AZ"]][["Growth"]][["Cutscores"]] <-
        list(
	Cuts=c(20, 40, 61, 81), 
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["AZ"]][["Assessment_Program_Information"]] <-
        list(
        Assessment_Name="Arizona's Instrument to Measure Standards",
        Assessment_Abbreviation="AIMS",
        Organization=list(
                Name="Arizona Department of Education",
		Abbreviation="ADE",
                URL="www.azed.gov",
                Contact="1-800-352-4558"),
        Content_Areas=c("Mathematics", "Reading"),
	Scale_Change=list(MATHEMATICS=2010),
        Grades_Tested=c(3,4,5,6,7,8,10),
        Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
	Test_Season="Spring",
	Test_Vendor="CTB/McGraw Hill")

SGPstateData[["AZ"]][["Student_Report_Information"]] <-
        list(
##	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,100,200,300,400)), ## Not used since only reporting after 2010
##	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,100,200,300,400)), ## Not used since only reporting after 2010
        Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
        Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Earliest_Year_Reported=list(MATHEMATICS=2010),
        Achievement_Level_Labels=list(
                "Falls Far Below"="Falls Far Below",
                "Approaches"="Approaches",
                "Meets"="Meets",
                "Exceeds"="Exceeds"))

SGPstateData[["AZ"]][['SGP_Configuration']] <- list(
					sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
					sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_MUSU", "Scale_Score_Targets_Current_CUKU", "Scale_Score_Targets_Current_MUSU"))

SGPstateData[["AZ"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AZ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### CALIFORNIA

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
        GRADE_7=c(253, 300, 350, 428),    # ALGEBRA I
        GRADE_8=c(253, 300, 350, 428),
        GRADE_9=c(253, 300, 350, 428),
        GRADE_10=c(253, 300, 350, 428),    
        GRADE_11=c(253, 300, 350, 428),    
        GRADE_EOCT=c(253, 300, 350, 428)),
    GEOMETRY=list(    
        GRADE_7=c(247, 300, 350, 418),    # GEOMETRY
        GRADE_8=c(247, 300, 350, 418),
        GRADE_9=c(247, 300, 350, 418),
        GRADE_10=c(247, 300, 350, 418),
        GRADE_11=c(247, 300, 350, 418),
        GRADE_EOCT=c(247, 300, 350, 418)),
    ALGEBRA_II=list(
        GRADE_8=c(257, 300, 350, 416),    # ALGEBRA II
        GRADE_9=c(257, 300, 350, 416),
        GRADE_10=c(257, 300, 350, 416),
        GRADE_11=c(257, 300, 350, 416),
        GRADE_EOCT=c(257, 300, 350, 416)),
    SUMMATIVE_HS_MATHEMATICS =list(
        GRADE_9=c(235, 300, 350, 420),    # SUMMATIVE_HS_MATHEMATICS
        GRADE_10=c(235, 300, 350, 420),
        GRADE_11=c(235, 300, 350, 420),
        GRADE_12=c(235, 300, 350, 420),
        GRADE_EOCT=c(235, 300, 350, 420)),
    INTEGRATED_MATHEMATICS_1=list(
        GRADE_9=c(249, 300, 350, 425),    # INTEGRATED MATH 1
        GRADE_10=c(249, 300, 350, 425),
        GRADE_11=c(249, 300, 350, 425),
        GRADE_EOCT=c(249, 300, 350, 425)),        
    INTEGRATED_MATHEMATICS_2=list(
        GRADE_9=c(258, 300, 350, 418),    # INTEGRATED MATH 2
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
        Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,150,275,400,525,600), ELA=c(100,150,275,400,525,600)),
        Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,150,275,400,525,600), ELA=c(100,150,275,400,525,600)),
        Vertical_Scale="No",
        Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
        Grades_Reported=list(MATHEMATICS=c(2,3,4,5,6,7), ELA=c(2,3,4,5,6,7,8,9,10,11)),
            Achievement_Level_Labels=list(
            "Far Below Basic"="Far Below Basic",
            "Below Basic"="Below Basic",
            "Basic"="Basic",
            "Proficient"="Proficient",
            "Advanced"="Advanced"))

SGPstateData[["CA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/CA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("SGP_Norm_Group_Preference/TCRP_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["CA"]][["SGP_Norm_Group_Preference"]] <- TCRP_SGP_Norm_Group_Preference
load("Baseline_Coefficient_Matrices/CA_Baseline_Matrices.Rdata")
SGPstateData[["CA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- CA_Baseline_Matrices


### CELA

SGPstateData[["CELA"]][["Achievement"]][["Knots_Boundaries"]] <-
	list(CELA =list(
		boundaries_0=c(260,585),
		boundaries_1=c(260,590),
		boundaries_2=c(260,592),
		boundaries_3=c(260,651),
		boundaries_4=c(260,651),
		boundaries_5=c(260,651),
		boundaries_6=c(260,666),
		boundaries_7=c(260,666),
		boundaries_8=c(260,666),
		boundaries_9=c(260,675),
		boundaries_10=c(260,675),
		boundaries_11=c(260,675),
		boundaries_12=c(260,675),
		knots_0=c(355,376,395,414),
		knots_1=c(410,434,452,472),
		knots_2=c(453,474,491,509),
		knots_3=c(467,490,508,528),
		knots_4=c(489,513,531,551),
		knots_5=c(505,529,547,567),
		knots_6=c(507,531,549,568),
		knots_7=c(514,541,560,579),
		knots_8=c(520,548,568,588),
		knots_9=c(507,534,551,570),
		knots_10=c(512,541,560,581),
		knots_11=c(516,546,567.6,588),
		knots_12=c(513,548,571,594),
		loss.hoss_0=c(260,585),
		loss.hoss_1=c(260,590),
		loss.hoss_2=c(260,592),
		loss.hoss_3=c(260,651),
		loss.hoss_4=c(260,651),
		loss.hoss_5=c(260,651),
		loss.hoss_6=c(260,666),
		loss.hoss_7=c(260,666),
		loss.hoss_8=c(260,666),
		loss.hoss_9=c(260,675),
		loss.hoss_10=c(260,675),
		loss.hoss_11=c(260,675),
		loss.hoss_12=c(260,675)))

SGPstateData[["CELA"]][["Achievement"]][["Cutscores"]] <- 
	list(CELA=list(
		GRADE_0=c(382,426,451,515),
		GRADE_1=c(411,435,469,522),
		GRADE_2=c(431,465,491,546),
		GRADE_3=c(445,478,509,562),
		GRADE_4=c(458,490,526,578),
		GRADE_5=c(460,493,533,584),
		GRADE_6=c(463,496,539,590),
		GRADE_7=c(465,499,546,596),
		GRADE_8=c(469,503,549,598),
		GRADE_9=c(473,507,551,600),
		GRADE_10=c(477,510,553,603),
		GRADE_11=c(481,514,556,605),
		GRADE_12=c(485,518,559,607)))

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
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(CELA="CELA"),
	Achievement_Level_Labels=list(
		"CELA Level 1"="CELA L1",
		"CELA Level 2"="CELA L2",
		"CELA Level 3"="CELA L3",
		"CELA Level 4"="CELA L4",
		"CELA Level 5"="CELA L5"))

load("Baseline_Coefficient_Matrices/CELA_Baseline_Matrices.Rdata")
SGPstateData[["CELA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["CELA.BASELINE"]] <- CELA_Baseline_Matrices[["CELA.BASELINE"]]


### COLORADO

load("CSEM/Colorado/Colorado_CSEM.Rdata")

SGPstateData[["CO"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
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
	WRITING=list(
		boundaries_3=c(150, 680),
		boundaries_4=c(190, 730),
		boundaries_5=c(220, 780),
		boundaries_6=c(230, 840),
		boundaries_7=c(240, 890),
		boundaries_8=c(250, 910),
		boundaries_9=c(260, 930),
		boundaries_10=c(270, 950),
		knots_3=c(430, 460, 480, 515),
		knots_4=c(445, 475, 500, 530),
		knots_5=c(460, 495, 520, 550),
		knots_6=c(475, 510, 540, 575),
		knots_7=c(495, 533, 565, 605),
		knots_8=c(495, 540, 575, 615),
		knots_9=c(505, 550, 585, 629),
		knots_10=c(515, 565, 600, 645),
		loss.hoss_3=c(150, 680),
		loss.hoss_4=c(190, 730),
		loss.hoss_5=c(220, 780),
		loss.hoss_6=c(230, 840),
		loss.hoss_7=c(240, 890),
		loss.hoss_8=c(250, 910),
		loss.hoss_9=c(260, 930),
		loss.hoss_10=c(270, 950)))
						  
SGPstateData[["CO"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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
	WRITING=list(
		GRADE_3=c(393, 465, 533),
		GRADE_4=c(414, 485, 554),
		GRADE_5=c(418, 498, 576),
		GRADE_6=c(423, 513, 600),
		GRADE_7=c(430, 539, 629),
		GRADE_8=c(434, 556, 651),
		GRADE_9=c(436, 563, 672),
		GRADE_10=c(459, 578, 690)))

SGPstateData[["CO"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Unsatisfactory", "Partially Proficient", "Proficient", "Advanced", "No Score"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["CO"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["CO"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["CO"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["CO"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Colorado Student Assessment Program",
	Assessment_Abbreviation="CSAP/TCAP",
	Organization=list(
		Name="Colorado Department of Education",
		Abbreviation="CDE",
		URL="www.schoolview.org",
		Contact="303-866-6600"),
	Content_Areas=c("Mathematics", "Reading", "Writing"),
	Grades_Tested=c(3,4,5,6,7,8,9,10),
	Assessment_Years=c("2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
	Test_Season="Spring",
	Test_Vendor="CTB/McGraw Hill",
	CSEM=Colorado_CSEM)

SGPstateData[["CO"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", WRITING="Writing"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10), WRITING=c(3,4,5,6,7,8,9,10)), 
	Achievement_Level_Labels=list(
		"Unsatisfactory"="Unsatisfactory", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))		

SGPstateData[["CO"]][["SGP_Configuration"]] <- list(arrow.legend.color=c("#FD5050", "#FDBF1A", "#07B806"))

load("Baseline_Coefficient_Matrices/CO_Baseline_Matrices.Rdata")
SGPstateData[["CO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- CO_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["CO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- CO_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["CO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["WRITING.BASELINE"]] <- CO_Baseline_Matrices[["WRITING.BASELINE"]]
SGPstateData[["CO"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/CO_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### CONNECTICUT

SGPstateData[["CT"]][["Achievement"]][["Cutscores"]] <- 
	list(READING=list(
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
	Transformed_Achievement_Level_Cutscores=list(WRITING=c(0,100,200,300,400,500)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(WRITING=c(0,100,200,300,400,500)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", WRITING="Writing"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), WRITING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic", 
		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Goal"="Goal", 
		"Advanced"="Advanced"))


### DEMO

load("CSEM/Demonstration/Demonstration_CSEM.Rdata")
SGPstateData[["DEMO"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
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
	list(MATHEMATICS=list(
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
		Name="Student Growth Percentiles",
		Abbreviation="SGP",
		URL="centerforassessment.github.io/SGP/",
		Contact="dbetebenner@nciea.org"),
	Content_Areas=c("Mathematics", "Reading", "Grade 9 Literature", "American Literature", "Algebra I", "Algebra II"),
	Grades_Tested=c(3,4,5,6,7,8,9,10),
	Assessment_Years=c("2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013"),
	Test_Vendor="CTB/McGraw Hill",
	Test_Season="Spring",
	CSEM=Demonstration_CSEM)

SGPstateData[["DEMO"]][["Student_Report_Information"]] <- 
	list(
#	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,100,200,300,400), READING=c(0,100,200,300,400, GRADE_9_LIT=c(0,100,200,300,400), AMERICAN_LIT=c(0,100,200,300,400), ALGEBRA_I=c(0,100,200,300,400), ALGEBRA_II=c(0,100,200,300,400))), ### FOR TESTING
#	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,100,200,300,400), READING=c(0,100,200,300,400, GRADE_9_LIT=c(0,100,200,300,400), AMERICAN_LIT=c(0,100,200,300,400), ALGEBRA_I=c(0,100,200,300,400), ALGEBRA_II=c(0,100,200,300,400))), ### FOR TESTING
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10)), 
	Achievement_Level_Labels=list(
		"Unsatisfactory"="Unsatisfactory", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))		

SGPstateData[["DEMO"]][["SGP_Configuration"]] <- list(
				sgp.minimum.default.panel.years=3,
				return.norm.group.scale.scores=TRUE, 
				sgPlot.sgp.targets=c("sgp.projections", "sgp.projections.lagged"),
				sgp.target.types=c("Scale_Score_Targets_CUKU", "Scale_Score_Targets_MUSU", "Scale_Score_Targets_Current_CUKU", "Scale_Score_Targets_Current_MUSU"))#,
#				grade.projection.sequence <- list(
#					READING=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#					MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#					GRADE_9_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#					AMERICAN_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#					ALGEBRA_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#					ALGEBRA_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT")),
#				content_area.projection.sequence <- list(
#					READING=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#					GRADE_9_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#					AMERICAN_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#					MATHEMATICS=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II"),
#					ALGEBRA_I=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II"),
#					ALGEBRA_II=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "ALGEBRA_I", "ALGEBRA_II")),
#				year_lags.projection.sequence <- list(
#					READING=rep(1L, 7),
#					MATHEMATICS=rep(1L, 7),
#					GRADE_9_LIT=rep(1L, 7),
#					AMERICAN_LIT=rep(1L, 7),
#					ALGEBRA_I=rep(1L, 7),
#					ALGEBRA_II=rep(1L, 7)))

load("Baseline_Coefficient_Matrices/DEMO_Baseline_Matrices.Rdata")
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- DEMO_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- DEMO_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["GRADE_9_LIT.BASELINE"]] <- DEMO_Baseline_Matrices[["GRADE_9_LIT.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["AMERICAN_LIT.BASELINE"]] <- DEMO_Baseline_Matrices[["AMERICAN_LIT.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ALGEBRA_I.BASELINE"]] <- DEMO_Baseline_Matrices[["ALGEBRA_I.BASELINE"]]
SGPstateData[["DEMO"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ALGEBRA_II.BASELINE"]] <- DEMO_Baseline_Matrices[["ALGEBRA_II.BASELINE"]]
SGPstateData[["DEMO"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/DEMO_Variable_Name_Lookup.csv", colClasses=c(rep("character",3), "logical"))
load("SGP_Norm_Group_Preference/DEMO_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["DEMO"]][["SGP_Norm_Group_Preference"]] <- DEMO_SGP_Norm_Group_Preference


### GUATEMALA/GUA

load("Knots_Boundaries/GUA_Knots_Boundaries.Rdata")
SGPstateData[["GUA"]][["Achievement"]][["Knots_Boundaries"]] <- GUA_Knots_Boundaries

SGPstateData[["GUA"]][["Achievement"]][["Cutscores"]] <- 
	list(READING=list(
		GRADE_9=c(-0.387, 0.341,  0.823),
		GRADE_12=c(-0.129, 0.469, 0.879)),
	MATHEMATICS=list(
	       GRADE_9=c(-0.089, 0.500, 1.365),
		GRADE_12=c(0.019, 1.053, 1.427)))

SGPstateData[["GUA"]][["Achievement"]][["Levels"]] <- list(
	     	Labels=c("Insatisfactorio", "Necesita mejorar", "Satisfactorio", "Excelente"),
		Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["GUA"]][["Growth"]][["Levels"]] <- c("Muy bajo", "Bajo", "Típico", "Alto", "Muy alto")
SGPstateData[["GUA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["GUA"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(20, 40, 61, 81), Labels=list("1st-19th", "20th-39th", "40th-60th", "61st-80th", "81st-99th"))

SGPstateData[["GUA"]][["Assessment_Program_Information"]][["Grades_Tested"]] <- c(9, 12)

SGPstateData[["GUA"]][["Student_Report_Information"]] <- list(
		Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,100,200,300,400), READING=c(0,100,200,300,400)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,100,200,300,400), READING=c(0,100,200,300,400)),
		Content_Areas_Labels=list(MATHEMATICS="Matemáticas", READING="Lectura"),
		Grades_Reported=list(MATHEMATICS=c(9,12), READING=c(9,12)),
		Achievement_Level_Labels=list(
			"Insatisfactorio"="Insatisfactorio",
			"Necesita mejorar"="Necesita mejorar",
		      "Satisfactorio"="Satisfactorio",
			"Excelente"="Excelente"))

SGPstateData[["GUA"]][["SGP_Configuration"]] <- list(highest.level.summary.grouping="COUNTRY")
SGPstateData[["GUA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/GUA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

### GEORGIA

load("CSEM/Georgia/Georgia_CSEM.Rdata")
SGPstateData[["GA"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
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
	GRADE_9_LIT=list(
		knots_EOCT=c(393, 414, 432, 453),
		boundaries_EOCT=c(160, 640),
		loss.hoss_EOCT=c(200, 600)),
	AMERICAN_LIT=list(
		knots_EOCT=c(404, 422, 437, 456),
		boundaries_EOCT=c(160, 640),
		loss.hoss_EOCT=c(200, 600)),
	BIOLOGY=list(
		knots_EOCT=c(381, 402, 424, 450),
		boundaries_EOCT=c(155, 695),
		loss.hoss_EOCT=c(200, 650)),
	PHYSICAL_SCIENCE=list(
		knots_EOCT=c(380, 407, 432, 464),
		boundaries_EOCT=c(145, 805),
		loss.hoss_EOCT=c(200, 750)),
	US_HISTORY=list(
		knots_EOCT=c(370, 400, 425, 456),
		boundaries_EOCT=c(155, 695),
		loss.hoss_EOCT=c(200, 650)),
	ECONOMICS=list(
		knots_EOCT=c(385, 410, 431, 460),
		boundaries_EOCT=c(155, 695),
		loss.hoss_EOCT=c(200, 650)),
	ALGEBRA=list(
		knots_EOCT=c(382, 403, 420, 439),
		boundaries_EOCT=c(160, 640),
		loss.hoss_EOCT=c(200, 600)),
	GEOMETRY=list(
		knots_EOCT=c(391, 415, 436, 462),
		boundaries_EOCT=c(270, 630),
		loss.hoss_EOCT=c(200, 600)),
	COORDINATE_ALGEBRA=list(
		knots_EOCT=c(363, 381, 396, 414),
		boundaries_EOCT=c(160, 640),
		loss.hoss_EOCT=c(200, 600)),
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
	SCIENCE=list(
		GRADE_3=c(800, 850),
		GRADE_4=c(800, 850),
		GRADE_5=c(800, 850),
		GRADE_6=c(800, 850),
		GRADE_7=c(800, 850),
		GRADE_8=c(800, 850)),
	SOCIAL_STUDIES=list(
		GRADE_3=c(800, 850),
		GRADE_4=c(800, 850),
		GRADE_5=c(800, 850),
		GRADE_6=c(800, 850),
		GRADE_7=c(800, 850),
		GRADE_8=c(800, 850)),
	GRADE_9_LIT=list(
		GRADE_EOCT=c(400, 450)),
	AMERICAN_LIT=list(
		GRADE_EOCT=c(400, 450)),
	BIOLOGY=list(
		GRADE_EOCT=c(400, 450)),
	PHYSICAL_SCIENCE=list(
		GRADE_EOCT=c(400, 450)),
	US_HISTORY=list(
		GRADE_EOCT=c(400, 450)),
	ECONOMICS=list(
		GRADE_EOCT=c(400, 450)),
	ALGEBRA=list(
		GRADE_EOCT=c(400, 450)),
	COORDINATE_ALGEBRA=list(
		GRADE_EOCT=c(400, 450)),
	GEOMETRY=list(
		GRADE_EOCT=c(400, 450)),
	MATHEMATICS_I=list(
		GRADE_EOCT=c(400, 450)),
	MATHEMATICS_II=list(
		GRADE_EOCT=c(400, 450)))


SGPstateData[["GA"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Does Not Meet Expectations", "Meets Expectations", "Exceeds Expectations"),
	Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["GA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["GA"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

SGPstateData[["GA"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["GA"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Georgia Criterion-Referenced Competency Tests",
	Assessment_Abbreviation="GA-CRCT",
	Content_Areas=c("Mathematics", "Reading", "ELA", "Science", "Social Studies"),
	Grades_Tested=c(3,4,5,6,7,8),
	Assessment_Years=c('2007', '2008', '2009', '2010', '2011', '2012', '2013'),
	Test_Season="Spring",
	Test_Vendor="CTB/McGraw Hill",
	CSEM=Georgia_CSEM)

SGPstateData[["GA"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", ELA="ELA", SCIENCE="Science", SOCIAL_STUDIES="Social Studies"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8), SCIENCE=c(3,4,5,6,7,8), SOCIAL_STUDIES=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Does Not Meet"="Does Not Meet Expectations",
		"Meets Expectations" = "Meets Expectations",
		"Exceeds Expectations" = "Exceeds Expectations"))

SGPstateData[["GA"]][["SGP_Configuration"]] <- list(use.cohort.for.baseline.when.missing=TRUE, return.norm.group.scale.scores=TRUE, goodness.of.fit.minimum.n=1)
#SGPstateData[["GA"]][["SGP_Configuration"]][["grade.projection.sequence"]] <- list(
#	READING=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	ELA=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	GRADE_9_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	AMERICAN_LIT=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	MATHEMATICS=c("3", "4", "5", "6", "7", "8", "EOCT"),
#	MATHEMATICS_I=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	MATHEMATICS_II=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	COORDINATE_ALGEBRA=c("3", "4", "5", "6", "7", "8", "EOCT"),
#	SCIENCE=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	BIOLOGY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	PHYSICAL_SCIENCE=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	SOCIAL_STUDIES=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	US_HISTORY=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"),
#	ECONOMICS=c("3", "4", "5", "6", "7", "8", "EOCT", "EOCT"))
#SGPstateData[["GA"]][["SGP_Configuration"]][["content_area.projection.sequence"]] <- list(
#	READING=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#	ELA=c("ELA", "ELA", "ELA", "ELA", "ELA", "ELA", "GRADE_9_LIT", "AMERICAN_LIT"),
#	GRADE_9_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#	AMERICAN_LIT=c("READING", "READING", "READING", "READING", "READING", "READING", "GRADE_9_LIT", "AMERICAN_LIT"),
#	MATHEMATICS=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "COORDINATE_ALGEBRA"),
#	MATHEMATICS_I=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS_I", "MATHEMATICS_II"),
#	MATHEMATICS_II=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS_I", "MATHEMATICS_II"),
#	COORDINATE_ALGEBRA=c("MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "MATHEMATICS", "COORDINATE_ALGEBRA"),
#	SCIENCE=c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"),
#	BIOLOGY=c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"),
#	PHYSICAL_SCIENCE=c("SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "SCIENCE", "BIOLOGY", "PHYSICAL_SCIENCE"),
#	SOCIAL_STUDIES=c("SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "US_HISTORY", "ECONOMICS"),
#	US_HISTORY=c("SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "US_HISTORY", "ECONOMICS"),
#	ECONOMICS=c("SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "SOCIAL_STUDIES", "US_HISTORY", "ECONOMICS"))
#SGPstateData[["GA"]][["SGP_Configuration"]][["year_lags.projection.sequence"]] <- list(
#	READING=rep(1L, 7),
#	ELA=rep(1L, 7),
#	GRADE_9_LIT=rep(1L, 7),
#	AMERICAN_LIT=rep(1L, 7),
#	MATHEMATICS=rep(1L, 6),
#	MATHEMATICS_I=as.integer(c(1,1,1,1,1,2,1)),
#	MATHEMATICS_II=as.integer(c(1,1,1,1,1,2,1)),
#	COORDINATE_ALGEBRA=rep(1L, 6),
#	SCIENCE=rep(1L, 7),
#	BIOLOGY=rep(1L, 7),
#	PHYSICAL_SCIENCE=rep(1L, 7),
#	SOCIAL_STUDIES=as.integer(c(1,1,1,1,1,3,1)),
#	US_HISTORY=as.integer(c(1,1,1,1,1,3,1)),
#	ECONOMICS=as.integer(c(1,1,1,1,1,3,1)))

SGPstateData[["GA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/GA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/GA_Baseline_Matrices.Rdata")
SGPstateData[["GA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]] <- GA_Baseline_Matrices
load("SGP_Norm_Group_Preference/GA_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["GA"]][["SGP_Norm_Group_Preference"]] <- GA_SGP_Norm_Group_Preference

### HAWAII

SGPstateData[["HI"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_3=c(251, 300, 324),
		GRADE_4=c(270, 300, 325),
		GRADE_5=c(278, 300, 328),
		GRADE_6=c(277, 300, 323),
		GRADE_7=c(281, 300, 334),
		GRADE_8=c(276, 300, 332),
		GRADE_10=c(275, 300, 331)),
	MATHEMATICS.2011=list(
		GRADE_3=c(268, 300, 343),
		GRADE_4=c(268, 300, 342),
		GRADE_5=c(269, 300, 339),
		GRADE_6=c(271, 300, 340),
		GRADE_7=c(271, 300, 339),
		GRADE_8=c(272, 300, 342),
		GRADE_10=c(277, 300, 336)),
	READING=list(
		GRADE_3=c(271, 300, 352),
		GRADE_4=c(273, 300, 351),
		GRADE_5=c(282, 300, 346),
		GRADE_6=c(278, 300, 342),
		GRADE_7=c(286, 300, 343),
		GRADE_8=c(286, 300, 340),
		GRADE_10=c(289, 300, 336)),
	READING.2011=list(
		GRADE_3=c(266, 300, 324),
		GRADE_4=c(271, 300, 325),
		GRADE_5=c(269, 300, 328),
		GRADE_6=c(270, 300, 331),
		GRADE_7=c(270, 300, 336),
		GRADE_8=c(273, 300, 330),
		GRADE_10=c(277, 300, 340)))

SGPstateData[["HI"]][["Achievement"]][["Knots_Boundaries"]] <-
        list(MATHEMATICS.2011=list(
                boundaries_3=c(60, 540),
                boundaries_4=c(60, 540),
                boundaries_5=c(60, 540),
                boundaries_6=c(60, 540),
                boundaries_7=c(60, 540),
                boundaries_8=c(60, 540),
                boundaries_10=c(60, 540),
                knots_3=c(267, 290, 308, 330),
                knots_4=c(269, 290, 309, 330),
                knots_5=c(264, 287, 307, 328),
                knots_6=c(266, 288, 304, 325),
                knots_7=c(268, 289, 307, 329),
                knots_8=c(262, 286, 306, 329),
                knots_10=c(267, 282, 298, 314),
                loss.hoss_3=c(178, 453),
                loss.hoss_4=c(181, 458),
                loss.hoss_5=c(185, 464),
                loss.hoss_6=c(182, 465),
                loss.hoss_7=c(195, 471),
                loss.hoss_8=c(175, 474),
                loss.hoss_10=c(195, 467)),
        MATHEMATICS=list(
                boundaries_3=c(60, 540),
                boundaries_4=c(60, 540),
                boundaries_5=c(60, 540),
                boundaries_6=c(60, 540),
                boundaries_7=c(60, 540),
                boundaries_8=c(60, 540),
                boundaries_10=c(60, 540),
                knots_3=c(267, 290, 308, 330),
                knots_4=c(269, 290, 309, 330),
                knots_5=c(264, 287, 307, 328),
                knots_6=c(266, 288, 304, 325),
                knots_7=c(268, 289, 307, 329),
                knots_8=c(262, 286, 306, 329),
                knots_10=c(267, 282, 298, 314),
                loss.hoss_3=c(100, 500),
                loss.hoss_4=c(100, 500),
                loss.hoss_5=c(100, 500),
                loss.hoss_6=c(100, 500),
                loss.hoss_7=c(100, 500),
                loss.hoss_8=c(100, 500),
                loss.hoss_10=c(100, 500)),
        READING.2011=list(
                boundaries_3=c(60, 540),
                boundaries_4=c(60, 540),
                boundaries_5=c(60, 540),
                boundaries_6=c(60, 540),
                boundaries_7=c(60, 540),
                boundaries_8=c(60, 540),
                boundaries_10=c(60, 540),
                knots_3=c(274, 300, 319, 339),
                knots_4=c(274, 300, 319, 338),
                knots_5=c(278, 301, 317, 337),
                knots_6=c(278, 301, 319, 338),
                knots_7=c(286, 306, 324, 344),
                knots_8=c(287, 306, 320, 340),
                knots_10=c(285, 303, 315, 331),
                loss.hoss_3=c(200, 442),
                loss.hoss_4=c(210, 438),
                loss.hoss_5=c(206, 451),
                loss.hoss_6=c(204, 444),
                loss.hoss_7=c(187, 448),
                loss.hoss_8=c(210, 460),
                loss.hoss_10=c(200, 433)),
        READING=list(
                boundaries_3=c(60, 540),
                boundaries_4=c(60, 540),
                boundaries_5=c(60, 540),
                boundaries_6=c(60, 540),
                boundaries_7=c(60, 540),
                boundaries_8=c(60, 540),
                boundaries_10=c(60, 540),
                knots_3=c(274, 300, 319, 339),
                knots_4=c(274, 300, 319, 338),
                knots_5=c(278, 301, 317, 337),
                knots_6=c(278, 301, 319, 338),
                knots_7=c(286, 306, 324, 344),
                knots_8=c(287, 306, 320, 340),
                knots_10=c(285, 303, 315, 331),
                loss.hoss_3=c(100, 500),
                loss.hoss_4=c(100, 500),
                loss.hoss_5=c(100, 500),
                loss.hoss_6=c(100, 500),
                loss.hoss_7=c(100, 500),
                loss.hoss_8=c(100, 500),
                loss.hoss_10=c(100, 500)))

SGPstateData[["HI"]][["Achievement"]][["Levels"]] <-
        list(
        Labels=c("Well Below Proficiency", "Approaches Proficiency", "Meets Proficiency", "Exceeds Proficiency"),
        Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["HI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["HI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["HI"]][["Growth"]][["Cutscores"]] <-
        list(
        Cuts=c(35, 66),
        Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["HI"]][["Assessment_Program_Information"]] <-
        list(
        Assessment_Name="Hawaii State Assessment",
        Assessment_Abbreviation="HSA",
        Organization=list(
			Name="Hawaii State Department of Education",
			Abbreviation="HIDOE",
			URL="www.doe.k12.hi.us", 
			Contact="808-586-3230"), 
        Content_Areas=c("Mathematics", "Reading"),
        Grades_Tested=c(3,4,5,6,7,8,10),
        Assessment_Years=c("2007", "2008", "2009", "2010", "2011", "2012", "2013"),
	Test_Season="Year_Round")

SGPstateData[["HI"]][["Student_Report_Information"]] <-
        list(
		Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
		Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
		Vertical_Scale="No",
		Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
		Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), READING=c(3,4,5,6,7,8,10)),
	        Achievement_Level_Labels=list(
			"Well Below"="Well Below Proficiency",
			"Approaches"="Approaches Proficiency",
			"Meets"="Meets Proficiency",
			"Exceeds"="Exceeds Proficiency"))

SGPstateData[["HI"]][["SGP_Configuration"]] <- list(output.groups=c("COMPLEX", "SCHOOL"))

load("Baseline_Coefficient_Matrices/HI_Baseline_Matrices.Rdata")
SGPstateData[["HI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- HI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["HI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- HI_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["HI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/HI_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### IDAHO

SGPstateData[["ID"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
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
		loss.hoss_10=c(182, 295)))

SGPstateData[["ID"]][["Achievement"]][["Cutscores"]] <- 
	list(LANGUAGE_USAGE=list(
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
	READING=list(
		GRADE_3=c(187, 192, 208),
		GRADE_4=c(193, 198, 214),
		GRADE_5=c(197, 204, 219),
		GRADE_6=c(201, 208, 223),
		GRADE_7=c(204, 212, 227),
		GRADE_8=c(207, 214, 229),
		GRADE_9=c(211, 220, 235),
		GRADE_10=c(211, 220, 235)))

SGPstateData[["ID"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["ID"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ID"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["ID"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["ID"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Idaho Standards Achievement Tests",
	Assessment_Abbreviation="ISAT",
        Organization=list(
		Name="Idaho Department of Education",
		Abbreviation="IDOE",
		URL="www.sde.idaho.gov/",
		Contact="support@sde.idaho.gov"),
	Content_Areas=c("Language Usage", "Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,9,10),
	Test_Season="Spring",
	Test_Vendor="Data Recognition Corporation (DRC)")

SGPstateData[["ID"]][["Student_Report_Information"]] <- 
	list(Vertical_Scale="Yes",
		Content_Areas_Labels=list(LANGUAGE_USAGE="Language", MATHEMATICS="Math", READING="Read"),
		Grades_Reported=list(LANGUAGE_USAGE=c(3,4,5,6,7,8,9,10), MATHEMATICS=c(3,4,5,6,7,8,9,10), READING=c(3,4,5,6,7,8,9,10)), 
		Achievement_Level_Labels=list(
			"Below Basic"="Below Basic", 
			"Basic"="Basic", 
			"Proficient"="Proficient", 
			"Advanced"="Advanced"))

 
### INDIANA

SGPstateData[["IN"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(ELA=list(
		boundaries_2=c(94.1, 695.9),
		boundaries_3=c(103.3, 786.7),
		boundaries_4=c(113.2, 806.8),
		boundaries_5=c(128.15, 826.85),
		boundaries_6=c(173.3, 856.7),
		boundaries_7=c(203.4, 876.6),
		boundaries_8=c(223.4, 896.6),
		knots_2=c(402, 432, 458, 490),
		knots_3=c(422, 452, 478, 507),
		knots_4=c(440, 473, 498, 528),
		knots_5=c(461, 490, 514, 541),
		knots_6=c(468, 509, 543, 582),
		knots_7=c(496, 526, 551, 580),
		knots_8=c(494, 530, 561, 598),
		loss.hoss_2=c(100, 690),
		loss.hoss_3=c(110, 780),
		loss.hoss_4=c(115, 800),
		loss.hoss_5=c(130, 820),
		loss.hoss_6=c(175, 850),
		loss.hoss_7=c(210, 870),
		loss.hoss_8=c(230, 890)),
	MATHEMATICS=list(
		boundaries_2=c(94.8, 625.2),
		boundaries_3=c(134.05, 740.95),
		boundaries_4=c(174.3, 755.7),
		boundaries_5=c(214.45, 780.55),
		boundaries_6=c(234.5, 795.5),
		boundaries_7=c(254.5, 815.5),
		boundaries_8=c(335.1, 834.9),
		knots_2=c(379, 414, 441, 472),
		knots_3=c(409, 447, 478, 515),
		knots_4=c(434, 471, 501, 536),
		knots_5=c(471, 507, 536, 568),
		knots_6=c(486, 521, 551, 585),
		knots_7=c(503, 541, 575, 614),
		knots_8=c(530, 571, 604, 641),
		loss.hoss_2=c(100, 620),
		loss.hoss_3=c(140, 735),
		loss.hoss_4=c(180, 750),
		loss.hoss_5=c(220, 775),
		loss.hoss_6=c(240, 790),
		loss.hoss_7=c(260, 810),
		loss.hoss_8=c(340, 830)))

SGPstateData[["IN"]][["Achievement"]][["Cutscores"]] <- 
	list(ELA=list(
		GRADE_3=c(417, 521),
		GRADE_4=c(437, 535),
		GRADE_5=c(468, 548),
		GRADE_6=c(478, 579),
		GRADE_7=c(501, 584),
		GRADE_8=c(508, 627)),
	MATHEMATICS=list(
		GRADE_3=c(413, 513),
		GRADE_4=c(445, 541), 
		GRADE_5=c(463, 556),
		GRADE_6=c(487, 590),
		GRADE_7=c(511, 603),
		GRADE_8=c(537, 641)))

SGPstateData[["IN"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Did Not Pass", "Pass", "Pass +"),
	Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["IN"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["IN"]][["Growth"]][["System_Type"]] <- "Cohort and Baseline Referenced"

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
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Test_Vendor="CTB/McGraw Hill")

SGPstateData[["IN"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(ELA="ELA", MATHEMATICS="Math"),
	Grades_Reported=list(ELA=c(3,4,5,6,7,8), MATHEMATICS=c(3,4,5,6,7,8)), 
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
						sgp.loss.hoss.adjustment="IN")

SGPstateData[["IN"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/IN_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/IN_Baseline_Matrices.Rdata")
SGPstateData[["IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- IN_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["IN"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- IN_Baseline_Matrices[["ELA.BASELINE"]]


### KANSAS

load("Knots_Boundaries/KS_Knots_Boundaries.Rdata")
SGPstateData[["KS"]][["Achievement"]][["Knots_Boundaries"]] <- KS_Knots_Boundaries

SGPstateData[["KS"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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

SGPstateData[["KS"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Academic Warning (Unsatisfactory)", "Approaching Standard (Basic)", "Meets Standard (Proficient)", "Exceeds Standard (Advanced)", "Exemplary", "Not Tested or Missing"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient", NA))

SGPstateData[["KS"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["KS"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["KS"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["KS"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Kansas General Education Assessments",
	Assessment_Abbreviation="KS-GEA",
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Spring",
	Assessment_Years=c("2005_2006", "2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013"),
	Test_Vendor="The Center for Educational Testing and Evaluation (CETE) at The University of Kansas")
######  Grades and Assessment Years need to be verified - based on Sheng's sample data

SGPstateData[["KS"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80,100), READING=c(0,20,40,60,80,100)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80,100), READING=c(0,20,40,60,80,100)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)), 
	Achievement_Level_Labels=list(
		"Warning"="Academic Warning (Unsatisfactory)", 
		"Approaches"="Approaching Standard (Basic)", 
		"Meets"="Meets Standard (Proficient)", 
		"Exceeds"="Exceeds Standard (Advanced)", 
		"Exemplary"="Exemplary"))

SGPstateData[["AOB"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/AOB_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

### MAINE

SGPstateData[["ME"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(READING=list(
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
	list(MATHEMATICS=list(
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

SGPstateData[["ME"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["ME"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["ME"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["ME"]][["Growth"]][["Cutscores"]] <- 
	list(
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
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Fall",
	Test_Vendor="Measured Progress",
        CSEM=NECAP_CSEM)

SGPstateData[["ME"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Proficient"="Substantially Below Proficient", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Distinction"="Proficient with Distinction"))

SGPstateData[["ME"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/ME_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/ME_Baseline_Matrices.Rdata")
SGPstateData[["ME"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- ME_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["ME"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- ME_Baseline_Matrices[["MATHEMATICS.BASELINE"]]

### MASSACHUSETTS

load("CSEM/Massachusetts/Massachusetts_CSEM.Rdata")
SGPstateData[["MA"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
		boundaries_3=c(-6.904, 4.189),
		boundaries_4=c(-5.225, 2.647),
		boundaries_5=c(-7.580, 4.115),
		boundaries_6=c(-9.691, 4.801),
		boundaries_7=c(-11.246, 4.736),
		boundaries_8=c(-18.094, 4.696),
		boundaries_10=c(-18.094, 4.696),
		knots_3=c(-0.436, 0.155, 0.618, 1.250),
		knots_4=c(-0.553, -0.125, 0.225, 0.658),
		knots_5=c(-0.794, -0.156, 0.368, 0.956),
		knots_6=c(-0.848, -0.081, 0.500, 1.258),
		knots_7=c(-1.097, -0.346, 0.292, 1.021),
		knots_8=c(-1.175, -0.369, 0.298, 0.988),
		knots_10=c(-1.175, -0.369, 0.298, 0.988),
		loss.hoss_3=c(-6.904, 4.189),
		loss.hoss_4=c(-5.225, 2.647),
		loss.hoss_5=c(-7.580, 4.115),
		loss.hoss_6=c(-9.691, 4.801),
		loss.hoss_7=c(-11.246, 4.736),
		loss.hoss_8=c(-18.094, 4.696),
		loss.hoss_10=c(-18.094, 4.696)),
	ELA=list(
		boundaries_3=c(-8.275, 3.620),
		boundaries_4=c(-2.788, 3.995),
		boundaries_5=c(-4.08, 4.08),
		boundaries_6=c(-4.088, 4.841),
		boundaries_7=c(-6.11, 4.82),
		boundaries_8=c(-6.375, 5.67),
		boundaries_10=c(-6.375, 5.67),
		knots_3=c(-0.903, -0.331, 0.181, 0.763),
		knots_4=c(-1.161, -0.463, .079, 0.759),
		knots_5=c(-0.854, -0.201, -0.301, 0.977),
		knots_6=c(-0.721, -0.031, 0.537, 1.077),
		knots_7=c(-0.697, 0.053, 0.596, 1.265),
		knots_8=c(-0.520, 0.236, 0.834, 1.622),
		knots_10=c(-0.520, 0.236, 0.834, 1.622),
		loss.hoss_3=c(-8.275, 3.620),
		loss.hoss_4=c(-2.788, 3.995),
		loss.hoss_5=c(-4.08, 4.08),
		loss.hoss_6=c(-4.088, 4.841),
		loss.hoss_7=c(-6.11, 4.82),
		loss.hoss_8=c(-6.375, 5.67),
		loss.hoss_10=c(-6.375, 5.67)))

SGPstateData[["MA"]][["Achievement"]][["Cutscores"]] <- 
	list(ELA=list(
		GRADE_3=c(-1.42909369, -0.215034418, 1.091762353),
		GRADE_4=c(-1.701038566, -0.231680055, 1.298985981),  
		GRADE_5=c(-1.676113199, -0.192168777, 1.366544216),
		GRADE_6=c(-1.691579968, -0.17458534, 1.760596127),
		GRADE_7=c(-1.729307659, -0.234448095, 1.794513035),
		GRADE_8=c(-1.659630289, -0.307644016, 2.092363055),
		GRADE_10=c(-1.810870172, -0.278593633, 1.435370133)),
	ELA.2010=list(
		GRADE_3=c(-1.621318975, -0.235480278, 1.018899635),
		GRADE_4=c(-1.682014372, -0.223930122, 1.37276864),  
		GRADE_5=c(-1.599576055, -0.227214179, 1.254204256),
		GRADE_6=c(-1.731083908, -0.262337138, 1.729612884),
		GRADE_7=c(-1.650343315, -0.290737927, 1.927702368),
		GRADE_8=c(-1.608374133, -0.247825427, 2.050635042),
		GRADE_10=c(-1.919766153, -0.227606302, 1.492616535)),
	ELA.2011=list(
		GRADE_3=c(-1.644681109, -0.283594296, 1.205757479),
		GRADE_4=c(-1.715332096, -0.22960969, 1.486208717),  
		GRADE_5=c(-1.701200572, -0.312242947, 1.192126975),
		GRADE_6=c(-1.671314382, -0.201858788, 1.673682971),
		GRADE_7=c(-1.698154856, -0.247514204, 1.744052569),
		GRADE_8=c(-1.619903644, -0.279321809, 1.992450909),
		GRADE_10=c(-1.909834297, -0.302027595, 1.414670298)),
	ELA.2012=list(
		GRADE_3=c(-1.686017235, -0.31126683, 0.901631274),
		GRADE_4=c(-1.672310689, -0.303124723, 1.382321351),  
		GRADE_5=c(-1.659283658, -0.241931899, 1.266161997),
		GRADE_6=c(-1.623704972, -0.232602665, 1.618507533),
		GRADE_7=c(-1.695255017, -0.213966527, 1.845140149),
		GRADE_8=c(-1.681302569, -0.301606879, 2.106119446),
		GRADE_10=c(-1.895658417, -0.289381678, 1.451536227)),
	ELA.2013=list(
		GRADE_3=c(-1.677320162, -0.21672897, 1.117832811),
		GRADE_4=c(-1.740793321, -0.280595031, 1.452778744),  
		GRADE_5=c(-1.629517738, -0.306804018, 1.1993955),
		GRADE_6=c(-1.717854121, -0.178538123, 1.81569587),
		GRADE_7=c(-1.722321416, -0.253271057, 1.786744892),
		GRADE_8=c(-1.613784175, -0.257666012, 2.081155848),
		GRADE_10=c(-1.813457499, -0.237741623, 1.470799706)),
	MATHEMATICS=list(
		GRADE_3=c(-0.679597014, 0.259570745, 1.440019007),
		GRADE_4=c(-0.818911094, 0.150419543, 0.745903854), 
		GRADE_5=c(-0.843950203, 0.171740196, 1.079620173),
		GRADE_6=c(-0.90862029, 0.145456382, 1.234203935),
		GRADE_7=c(-0.849875919, 0.174870873, 1.251282185),
		GRADE_8=c(-0.879401299, 0.170045893, 1.180853733),
		GRADE_10=c(-1.417415757, 0.15243449, 1.371427206)),
	MATHEMATICS.2010=list(
		GRADE_3=c(-0.869475871, 0.187857155, 1.32813029),
		GRADE_4=c(-0.792569016, 0.158288036, 0.760617004), 
		GRADE_5=c(-0.829436707, 0.186441511, 1.03658179),
		GRADE_6=c(-0.879909019, 0.172964143, 1.220837038),
		GRADE_7=c(-0.855205788, 0.142883728, 1.325876342),
		GRADE_8=c(-0.901223853, 0.196553224, 1.27311411),
		GRADE_10=c(-1.538201277, 0.178728912, 1.355127466)),
	MATHEMATICS.2011=list(
		GRADE_3=c(-0.836216032, 0.135066055, 1.457577645),
		GRADE_4=c(-0.812718733, 0.174743403, 0.758801425), 
		GRADE_5=c(-0.808464525, 0.149127134, 1.088119238),
		GRADE_6=c(-0.859234498, 0.190546824, 1.209532603),
		GRADE_7=c(-0.90052886, 0.193310389, 1.321574452),
		GRADE_8=c(-0.92188104, 0.132145402, 1.180694563),
		GRADE_10=c(-1.415991148, 0.145731612, 1.445822342)),
	MATHEMATICS.2012=list(
		GRADE_3=c(-0.774653198, 0.206120813, 1.222999624),
		GRADE_4=c(-0.770931912, 0.132958294, 0.786784793), 
		GRADE_5=c(-0.806186904, 0.159558291, 1.100842745),
		GRADE_6=c(-0.8459956, 0.198964231, 1.194926159),
		GRADE_7=c(-0.924844147, 0.203457327, 1.24529973),
		GRADE_8=c(-0.927795391, 0.176658004, 1.242965789),
		GRADE_10=c(-1.411008894, 0.109299723, 1.452366601)),
	MATHEMATICS.2013=list(
		GRADE_3=c(-0.819602484, 0.214018392, 1.235457872),
		GRADE_4=c(-0.835527388, 0.131079297, 0.779292276), 
		GRADE_5=c(-0.898299863, 0.142907475, 1.081483186),
		GRADE_6=c(-0.850822498, 0.160319072, 1.272165299),
		GRADE_7=c(-0.891990177, 0.126106113, 1.260375497),
		GRADE_8=c(-0.878231414, 0.141874403, 1.303559999),
		GRADE_10=c(-1.381145218, 0.111910031, 1.371984305)))

SGPstateData[["MA"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Warning/Failing", "Needs Improvement", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["MA"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Moderate", "High", "Very High")

SGPstateData[["MA"]][["Growth"]][["System_Type"]] <- "Baseline Referenced"

SGPstateData[["MA"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(20, 40, 61, 81), 
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["MA"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Massachusetts Comprehensive Assessment System",
	Assessment_Abbreviation="MCAS",
        Organization=list(
           Name="Massachusetts Department of Elementary and Secondary Education",
           Abbreviation="ESE",
           URL="http://www.doe.mass.edu/",
           Contact="781-338-3000"),
	Content_Areas=c("Mathematics", "English Language Arts"),
	Grades_Tested=c(3,4,5,6,7,8,10),
	Test_Season="Spring",
	Test_Vendor="Measured Progress",
	CSEM=Massachusetts_CSEM)

SGPstateData[["MA"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), ELA=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), ELA=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), ELA=c(3,4,5,6,7,8,10)), 
	Achievement_Level_Labels=list(
		"Warning/Failing"="Warning/Failing", 
		"Needs Improvement"="Needs Improvement", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))

SGPstateData[["MA"]][["SGP_Configuration"]] <- list(projcuts.digits=2)

load("Baseline_Coefficient_Matrices/MA_Baseline_Matrices_2009_2013.Rdata")
SGPstateData[["MA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- MA_Baseline_Matrices_2009_2013[["ELA.BASELINE"]]
SGPstateData[["MA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- MA_Baseline_Matrices_2009_2013[["MATHEMATICS.BASELINE"]]

SGPstateData[["MA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

### Minnesota

SGPstateData[["MN"]][["Achievement"]][["Knots_Boundaries"]] <-
          list(MATHEMATICS=list(
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

SGPstateData[["MN"]][["Achievement"]][["Cutscores"]] <-
          list(MATHEMATICS=list(
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
SGPstateData[["MN"]][["Achievement"]][["Levels"]] <-
                list(
                Labels=c("Does Not Meet", "Partially Meets", "Meets", "Exceeds", "No Score"),
                Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", NA))

SGPstateData[["MN"]][["Growth"]][["Levels"]] <- c("Low", "Medium", "High")

SGPstateData[["MN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["MN"]][["Growth"]][["Cutscores"]] <-
                list(
                Cuts=c(35, 66),
                Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["MN"]][["Assessment_Program_Information"]] <-
                list(
                Assessment_Name="Minnesota Comprehensive Assessments",
                Assessment_Abbreviation="MCAs",
                Organization=list(
                                Name="Minnesota Department of Education",
				Abbreviation="MDOE",
                                URL="www.education.state.mn.us/mde/index.html",
                                Contact="651-582-8200"),
                Content_Areas=c("Mathematics", "Reading", "Science"),
                Grades_Tested=c(3,4,5,6,7,8,10,11),
                Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
		Test_Season="Spring",
		Test_Vendor="Pearson")
#                CSEM=Minnesota_CSEM)

SGPstateData[["MN"]][["Student_Report_Information"]] <-
                list(
                Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,40,50,60,80), READING=c(0,40,50,60,80)),
                Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,40,50,60,80), READING=c(0,40,50,60,80)),
                Vertical_Scale="No",
                Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", SCIENCE="Science"),
                Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10,11), READING=c(3,4,5,6,7,8,10,11), SCIENCE=c(3,4,5,6,7,8,10,11)),
                Achievement_Level_Labels=list(
                                "Does Not Meet" = "Does Not Meet",
                                "Partially Meets" = "Partially Meets",
                                "Meets" = "Meets",
                                "Exceeds" = "Exceeds"))
                                


### MISSISSIPPI

SGPstateData[["MS"]][["Achievement"]][["Knots_Boundaries"]] <-
        list(MATHEMATICS=list(
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
	Test_Vendor="Pearson")

SGPstateData[["MS"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,200,300,400,500), READING_LANGUAGE_ARTS=c(100,200,300,400,500)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,200,300,400,500), READING_LANGUAGE_ARTS=c(100,200,300,400,500)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING_LANGUAGE_ARTS="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING_LANGUAGE_ARTS=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Minimal"="Minimal", 
		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))

SGPstateData[["MS"]][["SGP_Configuration"]] <- list(sgp.loss.hoss.adjustment="MS")

SGPstateData[["MS"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/MS_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/MS_Baseline_Matrices.Rdata")
SGPstateData[["MS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- MS_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["MS"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING_LANGUAGE_ARTS.BASELINE"]] <- MS_Baseline_Matrices[["READING_LANGUAGE_ARTS.BASELINE"]]
load("SGP_Norm_Group_Preference/MS_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["MS"]][["SGP_Norm_Group_Preference"]] <- MS_SGP_Norm_Group_Preference


### MISSOURI

load("CSEM/Missouri/Missouri_CSEM.Rdata")
SGPstateData[["MO"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(COMMUNICATION_ARTS=list(
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
	list(COMMUNICATION_ARTS=list(
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
	Test_Vendor="CTB/McGraw Hill",
	CSEM=Missouri_CSEM)

SGPstateData[["MO"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", COMMUNICATION_ARTS="Comm Arts"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), COMMUNICATION_ARTS=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic", 
		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced")) 

SGPstateData[["MO"]][["SGP_Configuration"]] <- list(state.multiple.year.summary=5)


### AUSTRALIA/NAPLAN

SGPstateData[["NAPLAN"]][["Achievement"]][["Knots_Boundaries"]] <- 
		list(READING=list(
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
	list(READING=list(
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

SGPstateData[["NAPLAN"]][["Achievement"]][["Levels"]] <- list(
	     	Labels=c("Below Nat Min Std", "At Nat Min Std", "Above Nat Min Std"),
		Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NAPLAN"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Typical", "High", "Very High")
SGPstateData[["NAPLAN"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"
SGPstateData[["NAPLAN"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(20, 40, 60, 80), Labels=list("1st-19th", "20th-39th", "40th-59th", "60th-79th", "80th-99th"))

SGPstateData[["NAPLAN"]][["Assessment_Program_Information"]][["Grades_Tested"]] <- c(3, 5, 7, 9)

SGPstateData[["NAPLAN"]][["Student_Report_Information"]] <- list(
		Content_Areas_Labels=list(NUMERACY="Numeracy", READING="Reading", WRITING="Writing", GRAMMAR="Grammar", SPELLING="Spelling"),
		Grades_Reported=list(NUMERACY=c(3,5,7,9), READING=c(3,5,7,9), WRITING=c(3,5,7,9), GRAMMAR=c(3,5,7,9), SPELLING=c(3,5,7,9)),
		Achievement_Level_Labels=list(
			"Below Standard"="Below Nat Min Std",
			"At Standard"="At Nat Min Std",
			"Above Standard"="Above Nat Min Std"))

### NEBRASKA

SGPstateData[["NE"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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
        Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,85,135,200), READING=c(0,85,135,200)),
        Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,85,135,200), READING=c(0,85,135,200)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)), 
	Achievement_Level_Labels=list(
		"Below"="Below the Standards", 
		"Meets"="Meets the Standards", 
		"Exceeds"="Exceeds the Standards"))


### NEVADA

load("CSEM/Nevada/Nevada_CSEM.Rdata")

SGPstateData[["NV"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(READING=list(
		knots_3=c(256, 296, 327, 357),
		knots_4=c(246, 297, 335, 375),
		knots_5=c(237, 281, 313, 349),
		knots_6=c(241, 297, 342, 382),
		knots_7=c(258, 310, 350, 387),
		knots_8=c(256, 298, 328, 363),
		boundaries_3=c(60, 540),
		boundaries_4=c(60, 540),
		boundaries_5=c(60, 540),
		boundaries_6=c(60, 540),
		boundaries_7=c(60, 540),
		boundaries_8=c(60, 540),
		loss.hoss_3=c(100, 500),
		loss.hoss_4=c(100, 500),
		loss.hoss_5=c(100, 500),
		loss.hoss_6=c(100, 500),
		loss.hoss_7=c(100, 500),
		loss.hoss_8=c(100, 500)),
	MATHEMATICS=list(
		knots_3=c(254, 295, 328, 367),
		knots_4=c(260, 308, 342, 384),
		knots_5=c(257, 300, 335, 376),
		knots_6=c(229, 293, 342, 398),
		knots_7=c(226, 289, 337, 397),
		knots_8=c(219, 276, 320, 373),
		boundaries_3=c(60, 540),
		boundaries_4=c(60, 540),
		boundaries_5=c(60, 540),
		boundaries_6=c(60, 540),
		boundaries_7=c(60, 540),
		boundaries_8=c(60, 540),
		loss.hoss_3=c(100, 500),
		loss.hoss_4=c(100, 500),
		loss.hoss_5=c(100, 500),
		loss.hoss_6=c(100, 500),
		loss.hoss_7=c(100, 500),
		loss.hoss_8=c(100, 500)))

SGPstateData[["NV"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_3=c(200, 300, 354),
		GRADE_4=c(200, 300, 375),
		GRADE_5=c(200, 300, 380),
		GRADE_6=c(200, 300, 404),
		GRADE_7=c(200, 300, 412),
		GRADE_8=c(200, 300, 418),
		GRADE_10=c(200, 300, 400)),
	MATHEMATICS.2009_2010=list(
		GRADE_3=c(250, 300, 349),
		GRADE_4=c(250, 300, 376),
		GRADE_5=c(250, 300, 474),
		GRADE_6=c(183, 255, 406),
		GRADE_7=c(210, 267, 389),
		GRADE_8=c(201, 267, 375),
		GRADE_10=c(105, 242, 323)),
	MATHEMATICS.2012_2013=list(
		GRADE_3=c(250, 300, 349),
		GRADE_4=c(250, 300, 376),
		GRADE_5=c(250, 300, 474),
		GRADE_6=c(250, 300, 406),
		GRADE_7=c(250, 300, 389),
		GRADE_8=c(250, 300, 375),
		GRADE_10=c(250, 300, 344)),
	READING=list(
		GRADE_3=c(200, 300, 356),
		GRADE_4=c(200, 300, 380),
		GRADE_5=c(200, 300, 385),
		GRADE_6=c(200, 300, 389),
		GRADE_7=c(200, 300, 397),
		GRADE_8=c(200, 300, 373),
		GRADE_10=c(200, 251, 400)),
	READING.2010_2011=list(
		GRADE_3=c(250, 300, 361),
		GRADE_4=c(250, 300, 379),
		GRADE_5=c(250, 300, 374),
		GRADE_6=c(250, 300, 367),
		GRADE_7=c(250, 300, 369),
		GRADE_8=c(250, 300, 343),
		GRADE_10=c(250, 300, 436)))

SGPstateData[["NV"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Emergent/Developing", "Approaches Standard", "Meets Standard", "Exceeds Standard"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NV"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NV"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NV"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(40, 61), 
	Labels=list("1st - 39th", "40th - 60th", "61st - 99th"))

SGPstateData[["NV"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Nevada Proficiency Examination Program",
	Assessment_Abbreviation="CRT",
	Organization=list(
		Name="Nevada Department of Education",
		Abbreviation="NDE",
		URL="www.doe.nv.gov",
		Contact="775-687-9200 "),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,10),
	Test_Season="Spring",
	Test_Vendor="Measured Progress",
	CSEM=Nevada_CSEM)

SGPstateData[["NV"]][["Student_Report_Information"]] <- 
	list(
        Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
        Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,10), READING=c(3,4,5,6,7,8,10)), 
	Achievement_Level_Labels=list(
		"Developing"="Emergent/Developing", 
		"Approaches"="Approaches Standard", 
		"Meets"="Meets Standard", 
		"Exceeds"="Exceeds Standard"))

SGPstateData[["NV"]][["SGP_Configuration"]] <- list(max.order.for.percentile=4,
                                                max.order.for.projection=4)
						 
load("Baseline_Coefficient_Matrices/NV_Baseline_Matrices.Rdata")
SGPstateData[["NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NV_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["NV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- NV_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["NV"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NV_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### NEW HAMPSHIRE

SGPstateData[["NH"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(READING=list(
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
		loss.hoss_11=c(1100, 1180)))

SGPstateData[["NH"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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

SGPstateData[["NH"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NH"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NH"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NH"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NH"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="New Hampshire NECAP",
	Assessment_Abbreviation="NECAP",
	Organization=list(
		Name="New Hampshire Department of Education",
		Abbreviation="NHDOE",
		URL="www.education.nh.gov",
		Contact="603-271-3494"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Fall",
	Test_Vendor="Measured Progress",
        CSEM=NECAP_CSEM)

SGPstateData[["NH"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Proficient"="Substantially Below Proficient", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Distinction"="Proficient with Distinction"))

SGPstateData[["NH"]][["SGP_Configuration"]] <- list(state.multiple.year.summary=5)

SGPstateData[["NH"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NH_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/NH_Baseline_Matrices.Rdata")
SGPstateData[["NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NH_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["NH"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- NH_Baseline_Matrices[["READING.BASELINE"]]


### NEW HAVEN

SGPstateData[["NEW_HAVEN"]][["Achievement"]][["Cutscores"]] <- 
	list(READING=list(
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
	list(MATHEMATICS=list(
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
	Transformed_Achievement_Level_Cutscores=list(WRITING=c(0,100,200,300,400,500)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(WRITING=c(0,100,200,300,400,500)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading", WRITING="Writing"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8), WRITING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic", 
		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Goal"="Goal", 
		"Advanced"="Advanced"))


### NEW JERSEY

SGPstateData[["NJ"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(ELA= list(
		boundaries_3=c(80, 320),
		boundaries_4=c(80, 320),
		boundaries_5=c(80, 320),
		boundaries_6=c(80, 320),
		boundaries_7=c(80, 320),
		boundaries_8=c(80, 320),
		knots_3=c(193, 209, 221, 234),
		knots_4=c(189, 207, 220, 233),
		knots_5=c(192, 207, 219, 234),
		knots_6=c(188, 204, 217, 231),
		knots_7=c(193, 209, 222, 239),
		knots_8=c(201, 216, 228, 243),
		loss.hoss_3=c(100, 300),
		loss.hoss_4=c(100, 300),
		loss.hoss_5=c(100, 300),
		loss.hoss_6=c(100, 300),
		loss.hoss_7=c(100, 300),
		loss.hoss_8=c(100, 300)),
	MATHEMATICS=list(
		boundaries_3=c(80, 320),
		boundaries_4=c(80, 320),
		boundaries_5=c(80, 320),
		boundaries_6=c(80, 320),
		boundaries_7=c(80, 320),
		boundaries_8=c(80, 320),
		knots_3=c(202, 226, 244, 259),
		knots_4=c(200, 224, 246, 265),
		knots_5=c(197, 220, 238, 259),
		knots_6=c(189, 210, 227, 250),
		knots_7=c(181, 202, 221, 246),
		knots_8=c(181, 209, 231, 258),
		loss.hoss_3=c(100, 300),
		loss.hoss_4=c(100, 300),
		loss.hoss_5=c(100, 300),
		loss.hoss_6=c(100, 300),
		loss.hoss_7=c(100, 300),
		loss.hoss_8=c(100, 300)))

SGPstateData[["NJ"]][["Achievement"]][["Cutscores"]] <- 
	list(ELA =list(
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
		GRADE_8=c(200, 250)))

SGPstateData[["NJ"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Partially Proficient", "Proficient", "Advanced Proficient"),
	Proficient=c("Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NJ"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NJ"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NJ"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NJ"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="New Jersey Assessment of Skills and Knowledge",
	Assessment_Abbreviation="NJ ASK",
	Organization=list(
		Name="New Jersey Department of Education",
		Abbreviation="NJDOE",
		URL="www.state.nj.us/education",
		Contact="877-900-6960"),
	Content_Areas=c("English Language Arts", "Mathematics"),
	Grades_Tested=c(3,4,5,6,7,8),
	Test_Season="Spring",
	Test_Vendor="Measurement Incorporated")

SGPstateData[["NJ"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="No",
	Content_Areas_Labels=list(ELA="ELA", MATHEMATICS="Math"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced Proficient"))

load("Baseline_Coefficient_Matrices/NJ_Baseline_Matrices.Rdata")
SGPstateData[["NJ"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- NJ_Baseline_Matrices[["ELA.BASELINE"]]
SGPstateData[["NJ"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NJ_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["NJ"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NJ_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))

SGPstateData[["NJ"]][["SGP_Configuration"]] <- list(sgp.loss.hoss.adjustment="NJ")


### NEW MEXICO

load("Knots_Boundaries/ABQ_Knots_Boundaries.Rdata")
SGPstateData[["NM"]][["Achievement"]][["Knots_Boundaries"]] <- ABQ_Knots_Boundaries

SGPstateData[["NM"]][["Achievement"]][["Cutscores"]] <- list(
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

SGPstateData[["NM"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Beginning Step", "Nearing Proficient", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NM"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NM"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NM"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NM"]][["Assessment_Program_Information"]] <- 
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

SGPstateData[["NM"]][["Student_Report_Information"]] <- list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Beginning"="Beginning Step", 
		"Nearing"="Nearing Proficient", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))


### NEW YORK

load("CSEM/New_York/New_York_CSEM.Rdata")

SGPstateData[["NY"]][["Achievement"]][["Cutscores"]] <- list(
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

SGPstateData[["NY"]][["Achievement"]][["Knots_Boundaries"]] <- list(ELA=list(boundaries_3=c(444.5, 810.5),
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
                                                         MATHEMATICS=list(boundaries_3=c(440, 800),
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

SGPstateData[["NY"]][["Achievement"]][["Levels"]] <- list(Labels=c("Below Standard", "Meets Basic Standard", "Meets Proficiency Standard", "Exceeds Proficiency Standard"),
                                                       Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["NY"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["NY"]][["Growth"]][["Cutscores"]] <- list(Cuts=c(35, 66), Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["NY"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["NY"]][["Assessment_Program_Information"]] <- list(Assessment_Name="New York State Assessment Program",
                                                              Assessment_Abbreviation="NYSTP",
                                                              Content_Areas=c("Mathematics", "ELA"),
                                                              Grades_Tested=c(3,4,5,6,7,8),
                                                              Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
                                                              Test_Season="Spring",
                                                              Test_Vendor="CTB/McGraw Hill",
                                                              CSEM=New_York_CSEM)

SGPstateData[["NY"]][["Student_Report_Information"]] <- list(
							Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), ELA=c(0,20,40,60,80)),
							Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), ELA=c(0,20,40,60,80)),
                                                          Vertical_Scale="No",
                                                          Content_Areas_Labels=list(MATHEMATICS="Math", ELA="ELA"),
                                                          Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), ELA=c(3,4,5,6,7,8)),
                                                          Achievement_Level_Labels=list("Below Basic"="Below Standard", 
                                                                                        "Basic"="Meets Basic Standard", 
                                                                                        "Proficient"="Meets Proficiency Standard", 
                                                                                        "Exceeds"="Exceeds Proficiency Standard"))

SGPstateData[["NY"]][["SGP_Configuration"]] <- list(max.order.for.percentile=3,
						max.order.for.projection=3)

load("Baseline_Coefficient_Matrices/NY_Baseline_Matrices.Rdata")
SGPstateData[["NY"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- NY_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["NY"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["ELA.BASELINE"]] <- NY_Baseline_Matrices[["ELA.BASELINE"]]
SGPstateData[["NY"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/NY_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))


### OREGON

SGPstateData[["OR"]][["Achievement"]][["Cutscores"]] <- list(
								Reading=list(
									GRADE_3=c(204,211,224),
									GRADE_4=c(210,216,226),
									GRADE_5=c(214,221,230),
									GRADE_6=c(217,226,237),
									GRADE_7=c(222,229,241),
									GRADE_8=c(226,232,242),
									GRADE_11=c(232,236,247)),
								Math=list(
									GRADE_3=c(205,212,219),
									GRADE_4=c(212,219,227),
									GRADE_5=c(219,225,234),
									GRADE_6=c(222,227,237),
									GRADE_7=c(228,232,242),
									GRADE_8=c(230,234,245),
									GRADE_11=c(232,236,251)))

SGPstateData[["OR"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Low", "Nearly Meets", "Meets", "Exceeds"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["OR"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["OR"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["OR"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["OR"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Oregon Assessment of Knowledge and Skills",
	Assessment_Abbreviation="OAKS",
	Organization=list(
		Name="Oregon Department of Education",
		Abbreviation="ODOE",
		URL="www.ode.state.or.us",
		Contact="503-947-5600"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Spring",
	Test_Vendor="Oregon Department Education")

SGPstateData[["OR"]][["Student_Report_Information"]] <- list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)), 
	Achievement_Level_Labels=list(
		"Low"="Low", 
		"Near"="Nearly Meets", 
		"Proficient"="Meets", 
		"Exceeds"="Exceeds"))


### RHODE ISLAND

SGPstateData[["RI"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(READING=list(
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
		loss.hoss_11=c(1100, 1180)))

SGPstateData[["RI"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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

SGPstateData[["RI"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["RI"]][["Growth"]][["Levels"]] <- c("Low", "Low Typical", "Typical", "High Typical", "High")

SGPstateData[["RI"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(31, 46, 56, 71), 
	Labels=c("1st-30th", "31st-45th", "46th-55th", "56th-70th", "71st-99th"))

SGPstateData[["RI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["RI"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Rhode Island NECAP",
	Assessment_Abbreviation="NECAP",
	Organization=list(
		Name="Rhode Island Department of Education",
		Abbreviation="RIDE",
		URL="www.ride.ri.gov/",
		Contact="401-222-4600"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Season="Fall",
	Test_Vendor="Measured Progress",
        CSEM=NECAP_CSEM)

SGPstateData[["RI"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Proficient"="Substantially Below Proficient", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Distinction"="Proficient with Distinction"))

SGPstateData[["RI"]][["SGP_Configuration"]] <- list(null.output.string="")
load("Baseline_Coefficient_Matrices/RI_Baseline_Matrices.Rdata")
SGPstateData[["RI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- RI_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["RI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- RI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["RI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/RI_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))


### SOUTH DAKOTA

load("Knots_Boundaries/SD_Knots_Boundaries.Rdata")
SGPstateData[["SD"]][["Achievement"]][["Knots_Boundaries"]] <- SD_Knots_Boundaries

SGPstateData[["SD"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_3=c(530, 600, 668),
		GRADE_4=c(548, 618, 684),
		GRADE_5=c(582, 637, 699),
		GRADE_6=c(601, 661, 728),
		GRADE_7=c(619, 678, 742),
		GRADE_8=c(625, 687, 754),
		GRADE_11=c(645, 715, 781)),
	READING=list(
		GRADE_3=c(544, 594, 644),
		GRADE_4=c(539, 598, 644),
		GRADE_5=c(540, 597, 648),
		GRADE_6=c(552, 600, 656),
		GRADE_7=c(553, 600, 651),
		GRADE_8=c(554, 600, 650),
		GRADE_11=c(566, 604, 656)))

SGPstateData[["SD"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Below Basic", "Basic", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["SD"]][["Growth"]][["Levels"]] <- c("Very Low", "Low", "Typical", "High", "Very High")

SGPstateData[["SD"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["SD"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(20, 40, 61, 81), 
	Labels=c("1st - 19th", "20th - 39th", "40th - 60th", "61st - 80th", "81st  - 99th"))

SGPstateData[["SD"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="South Dakota State Test of Educational Progress",
	Assessment_Abbreviation="STEP",
	Organization=list(
		Name="South Dakota Department of Education",
		Abbreviation="SDDOE",
		URL="www.doe.sd.gov",
		Contact="betty.leidholt@state.sd.us"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Assessment_Years=c("2009", "2010", "2011", "2012", "2013"),
	Test_Vendor="Pearson",
	Test_Season="Spring")

SGPstateData[["SD"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,11), READING=c(3,4,5,6,7,8,11)), 
	Achievement_Level_Labels=list(
		"Below Basic"="Below Basic", 
		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))		


### UTAH

SGPstateData[["UT"]][["Achievement"]][["Knots_Boundaries"]] <- list(
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
	MATHEMATICS=list(
		boundaries_3=c(123.1, 205.9),
		boundaries_4=c(123.1, 205.9),
		boundaries_5=c(123.1, 205.9),
		boundaries_6=c(123.1, 205.9),
		boundaries_7=c(123.1, 205.9),
		boundaries_8=c(123.1, 205.9),
		boundaries_9=c(123.1, 205.9),
		boundaries_10=c(123.1, 205.9),
		boundaries_11=c(123.1, 205.9),
		boundaries_12=c(123.1, 205.9),
		knots_3=c(157, 164, 169, 175),
		knots_4=c(158, 164, 170, 176),
		knots_5=c(157, 164, 169, 175),
		knots_6=c(157, 164, 169, 175),
		knots_7=c(160, 165, 170, 175),
		knots_8=c(157, 163, 168, 173),
		knots_9=c(155, 161, 166, 172),
		knots_10=c(151, 156, 161, 166),
		knots_11=c(145, 151, 156, 162),
		knots_12=c(143, 150, 155, 161),
		loss.hoss_3=c(130, 199),
		loss.hoss_4=c(130, 207),
		loss.hoss_5=c(130, 199),
		loss.hoss_6=c(130, 199),
		loss.hoss_7=c(130, 199),
		loss.hoss_8=c(130, 199),
		loss.hoss_9=c(125, 199),
		loss.hoss_10=c(128, 199),
		loss.hoss_11=c(130, 199),
		loss.hoss_12=c(130, 199)),
	SCIENCE=list(
		boundaries_4=c(123.1, 205.9),
		boundaries_5=c(123.1, 205.9),
		boundaries_6=c(123.1, 205.9),
		boundaries_7=c(123.1, 205.9),
		boundaries_8=c(123.1, 205.9),
		boundaries_9=c(123.1, 205.9),
		boundaries_10=c(123.1, 205.9),
		boundaries_11=c(123.1, 205.9),
		boundaries_12=c(123.1, 205.9),
		knots_4=c(154, 160, 166, 171),
		knots_5=c(156, 162, 167, 172),
		knots_6=c(156, 162, 168, 173),
		knots_7=c(156, 162, 168, 173),
		knots_8=c(155, 162, 167, 173),
		knots_9=c(156, 163, 168, 173),
		knots_10=c(155, 160, 165, 170),
		knots_11=c(151, 158, 163, 169),
		knots_12=c(154, 161, 166, 172),
		loss.hoss_4=c(130, 199),
		loss.hoss_5=c(130, 199),
		loss.hoss_6=c(130, 199),
		loss.hoss_7=c(130, 199),
		loss.hoss_8=c(130, 199),
		loss.hoss_9=c(130, 199),
		loss.hoss_10=c(130, 199),
		loss.hoss_11=c(130, 199),
		loss.hoss_12=c(130, 199)),
		
PRE_ALGEBRA=list(
		knots_EOCT=c(156, 163, 168, 174),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

ALGEBRA_I=list(
		knots_EOCT=c(153, 160, 165, 171),
		boundaries_EOCT=c(117, 207),
		loss.hoss_EOCT=c(125, 199)),

ALGEBRA_II=list(
		knots_EOCT=c(149, 155, 160, 166),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

GEOMETRY=list(
		knots_EOCT=c(154, 161, 166, 172),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

EARTH_SCIENCE=list(
		knots_EOCT=c(155, 161, 166, 172),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

BIOLOGY=list(
		knots_EOCT=c(156, 162, 167, 173),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

CHEMISTRY=list(
		knots_EOCT=c(151, 158, 163, 168),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)),

PHYSICS=list(
		knots_EOCT=c(155, 161, 166, 172),
		boundaries_EOCT=c(123, 206),
		loss.hoss_EOCT=c(130, 199)))

SGPstateData[["UT"]][["Achievement"]][["Cutscores"]] <- 
	list(
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
	MATHEMATICS=list(
		GRADE_3=c(160, 168),
		GRADE_4=c(160, 167),
		GRADE_5=c(160, 166),
		GRADE_6=c(160, 166),
		GRADE_7=c(160, 169)), 
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
	EARTH_SCIENCE=list(
		GRADE_EOCT=c(160, 167)),
	BIOLOGY=list(
		GRADE_EOCT=c(160, 167)),
	CHEMISTRY=list(
		GRADE_EOCT=c(160, 166)),
	PHYSICS=list(
		GRADE_EOCT=c(160, 169)))

SGPstateData[["UT"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("BP", "P", "A"),
	Proficient=c("Not Proficient", "Proficient", "Proficient"))
	
SGPstateData[["UT"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High") #  Based on 'official' school growth levels (60th p)

SGPstateData[["UT"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 60), 
	Labels=c("1st - 34th", "35th - 59th", "60th - 99th")) #  Changed to 60th percentile cut per conversation with Elena and Chris D. 10/01/12

SGPstateData[["UT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["UT"]][["SGP_Configuration"]] <- list(sgp.cohort.size=3000)

SGPstateData[["UT"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Utah Criterion-Referenced Tests",
	Assessment_Abbreviation="CRT",
	Organization=list(
		Name="Utah State Office of Education",
		Abbreviation="USOE",
		URL="www.schools.utah.gov",
		Contact="(801) 538-7811"),
	Content_Areas=c("ELA", "MATHEMATICS", "SCIENCE"),
	Grades_Tested=c(3,4,5,6,7,8,11),
        Test_Season="Spring",
	Assessment_Years=c("2008", "2009", "2010", "2011", "2012", "2013"), # 2005-2007 removed in 2013
	Test_Vendor="Measured Progress")

SGPstateData[["UT"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100, 150, 175, 200), ELA=c(100, 150, 175, 200), SCIENCE=c(100, 150, 175, 200)), 
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100, 150, 175, 200), ELA =c(100, 150, 175, 200), SCIENCE=c(100, 150, 175, 200)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(ELA="ELA", MATHEMATICS="Math", SCIENCE="Science"),
	Grades_Reported=list(ELA=3:11, MATHEMATICS=3:7, SCIENCE=4:8),
	Achievement_Level_Labels=list(
		"Below Proficient"="BP",
		"Proficient"="P",
		"Advanced"="A"))

SGPstateData[["UT"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/UT_Variable_Name_Lookup.csv", colClasses=c(rep("character", 4), "logical"))
load("SGP_Norm_Group_Preference/UT_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["UT"]][["SGP_Norm_Group_Preference"]] <- UT_SGP_Norm_Group_Preference


### VERMONT

SGPstateData[["VT"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
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

SGPstateData[["VT"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Substantially Below Proficient", "Partially Proficient", "Proficient", "Proficient with Distinction"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["VT"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["VT"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["VT"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["VT"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Vermont NECAP",
	Assessment_Abbreviation="NECAP",
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,11),
	Test_Vendor="Measured Progress",
        Test_Season="Fall",
        CSEM=NECAP_CSEM)

SGPstateData[["VT"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(0,20,40,60,80), READING=c(0,20,40,60,80)),
	Vertical_Scale="No",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
	Achievement_Level_Labels=list(
		"Below Proficient"="Substantially Below Proficient", 
		"Part Proficient"="Partially Proficient", 
		"Proficient"="Proficient", 
		"Distinction"="Proficient with Distinction"))


### VIRGINIA

SGPstateData[["VA"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(MATHEMATICS=list(
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
	list(MATHEMATICS=list(
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

SGPstateData[["VA"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["VA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["VA"]][["Assessment_Program_Information"]] <- 
	list(
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

SGPstateData[["VA"]][["Student_Report_Information"]] <- 
	list(
	Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(200,300,400,500,600), ENGLISH_READING=c(200,300,400,500,600)),
	Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(200,300,400,500,600), ENGLISH_READING=c(200,300,400,500,600)),
	Vertical_Scale="No",
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


### WASHINGTON

load("CSEM/Washington/Washington_CSEM.Rdata")
SGPstateData[["WA"]][["Achievement"]][["Knots_Boundaries"]] <-
    list(
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

SGPstateData[["WA"]][["Achievement"]][["Cutscores"]] <- 
    list(
    MATHEMATICS=list(
        GRADE_3=c(375, 400, 436),
        GRADE_4=c(375, 400, 447),
        GRADE_5=c(375, 400, 440),
        GRADE_6=c(375, 400, 442),
        GRADE_7=c(375, 400, 444),
        GRADE_8=c(375, 400, 437),
       GRADE_10=c(375, 400, 434)),
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

SGPstateData[["WA"]][["Achievement"]][["Levels"]] <-
    list(
        Labels=c("L1: Below Basic", "L2: Basic", "L3: Proficient", "L4: Advanced"),
        Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["WA"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WA"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WA"]][["Growth"]][["Cutscores"]] <-
    list(
    Cuts=c(34, 67), 
    Labels=c("1st - 33rd", "34th - 66th", "67th - 99th"))

SGPstateData[["WA"]][["Assessment_Program_Information"]] <-
    list(
    Assessment_Name="Washington Comprehensive Assessment Program",
    Assessment_Abbreviation="MSP/HSPE",
    Organization=list(
        Name="State of Washington Office of Superintendent of Public Instruction",
	Abbreviation="OSPI",
        URL="www.k12.wa.us",
        Contact="(360) 725-6000"),
    Content_Areas=c("Mathematics", "Reading", "Science"),
    # # The assessment changed from WASL to MSP/HSPE (WCAP), but the scale basically stayed the same...
    # Scale_Change=list(MATHEMATICS=c("2009_2010", "2010_2011"),
                      # SCIENCE="2009_2010",
                      # READING="2009_2010",
                      # WRITING="2009_2010"),
    Grades_Tested=c(3,4,5,6,7,8,10),
    Assessment_Years=c("2006_2007", "2007_2008", "2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013"),
    Test_Season="Spring",
    Test_Vendor="ETS",
	CSEM=Washington_CSEM)

SGPstateData[["WA"]][["Student_Report_Information"]] <-
    list(
    Transformed_Achievement_Level_Cutscores=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500), SCIENCE=c(100,200,300,400,500)), 
    Transformed_Achievement_Level_Cutscores_gaPlot=list(MATHEMATICS=c(100,200,300,400,500), READING=c(100,200,300,400,500), SCIENCE=c(100,200,300,400,500)),
    Content_Areas_Labels=list(MATHEMATICS="Math", SCIENCE="Science", READING="Reading"),
    Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), SCIENCE=c(5,8), READING=c(3,4,5,6,7,8,10)),
    Achievement_Level_Labels=list(
        "L1: Below Basic"="Below Basic",
        "L2: Basic"="Basic",
        "L3: Proficient"="Proficient",
        "L4: Advanced"="Advanced"))

SGPstateData[['WA']][['SGP_Configuration']] <- list(
						max.sgp.target.years.forward=2,
						gPlot.sgp.targets.timeframe=2)

load("Baseline_Coefficient_Matrices/WA_Baseline_Matrices.Rdata")
SGPstateData[["WA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- WA_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["WA"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- WA_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["WA"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WA_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("SGP_Norm_Group_Preference/WA_SGP_Norm_Group_Preference.Rdata")
SGPstateData[["WA"]][["SGP_Norm_Group_Preference"]] <- WA_SGP_Norm_Group_Preference


### WEST VIRGINIA

SGPstateData[["WV"]][["Achievement"]][["Knots_Boundaries"]] <-
        list(READING=list(
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
                loss.hoss_11=c(513, 915)))

SGPstateData[["WV"]][["Achievement"]][["Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_3=c(458, 557, 587, 623),
		GRADE_4=c(463, 570, 609, 636),
		GRADE_5=c(502, 591, 637, 655),
		GRADE_6=c(554, 609, 652, 678),
		GRADE_7=c(556, 624, 675, 699),
		GRADE_8=c(576, 624, 675, 699),
		GRADE_9=c(599, 642, 695, 730),
		GRADE_10=c(605, 650, 702, 732),
		GRADE_11=c(622, 660, 711, 734)),
	MATHEMATICS.2009_2010=list(
		GRADE_3=c(547, 581, 601, 623),
		GRADE_4=c(556, 592, 622, 646),
		GRADE_5=c(577, 611, 637, 667),
		GRADE_6=c(597, 626, 652, 682),
		GRADE_7=c(618, 641, 669, 698),
		GRADE_8=c(622, 651, 673, 699),
		GRADE_9=c(642, 668, 686, 707),
		GRADE_10=c(645, 670, 690, 714),
		GRADE_11=c(661, 680, 702, 723)),
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
	READING.2009_2010=list(
		GRADE_3=c(418, 436, 461, 487),
		GRADE_4=c(427, 452, 475, 502),
		GRADE_5=c(435, 460, 485, 512),
		GRADE_6=c(442, 470, 496, 522),
		GRADE_7=c(447, 479, 505, 529),
		GRADE_8=c(448, 481, 508, 539),
		GRADE_9=c(449, 484, 517, 550),
		GRADE_10=c(453, 492, 527, 560),
		GRADE_11=c(454, 501, 528, 563)))

SGPstateData[["WV"]][["Achievement"]][["College_Readiness_Cutscores"]] <- 
	list(MATHEMATICS=list(
		GRADE_11=710),
	READING=list(
		GRADE_11=505))

SGPstateData[["WV"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Novice", "Partial Mastery", "Mastery", "Above Mastery", "Distinguished"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient", "Proficient"))

SGPstateData[["WV"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WV"]][["Growth"]][["Cutscores"]] <- 
	list(
	Cuts=c(35, 66), 
	Labels=list("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WV"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WV"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="West Virginia Educational Standards Tests",
	Assessment_Abbreviation="WESTEST 2",
        Organization=list(
                Name="West Virginia Department of Education",
		Abbreviation="WVDE",
                URL="wvde.state.wv.us",
                Contact="304-558-2546 "),
	Content_Areas=c("Reading", "Mathematics"),
	Grades_Tested=c(3,4,5,6,7,8,9,10,11),
	Test_Season="Spring",
	Test_Vendor="CTB/McGraw Hill")

SGPstateData[["WV"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="R/LA"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8,9,10,11), READING=c(3,4,5,6,7,8,9,10,11)),
	Achievement_Level_Labels=list(
		"Novice"="Novice",
		"Partial Mastery"="Partial Mastery", 
		"Mastery"="Mastery", 
		"Above Mastery"="Above Mastery",
		"Distinguished"="Distinguished"))
						 
SGPstateData[["WV"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WV_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))
load("Baseline_Coefficient_Matrices/WV_Baseline_Matrices.Rdata")
SGPstateData[["WV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- WV_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["WV"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- WV_Baseline_Matrices[["READING.BASELINE"]]


### WISCONSIN

load("CSEM/Wisconsin/Wisconsin_CSEM.Rdata")
SGPstateData[["WI"]][["Achievement"]][["Knots_Boundaries"]] <- 
	list(READING=list(
		knots_3=c(431, 452, 469, 487),
		knots_4=c(444, 470, 491, 513),
		knots_5=c(450, 477, 498, 520),
		knots_6=c(467, 496, 518, 542),
		knots_7=c(479, 507, 529, 553),
		knots_8=c(491, 519, 542, 566),
		knots_10=c(494, 531, 559, 588),
		boundaries_3=c(266.3, 643.7),
		boundaries_4=c(276.3, 653.7),
		boundaries_5=c(286, 694),
		boundaries_6=c(295.7, 734.3),
		boundaries_7=c(305.3, 784.7),
		boundaries_8=c(325.4, 794.6),
		boundaries_10=c(345.3, 824.7),
		loss.hoss_3=c(270, 640),
		loss.hoss_4=c(280, 650),
		loss.hoss_5=c(290, 690),
		loss.hoss_6=c(300, 730),
		loss.hoss_7=c(310, 780),
		loss.hoss_8=c(330, 790),
		loss.hoss_10=c(350, 820)),
	MATHEMATICS=list(knots_3=c(399, 425, 446, 470),
		knots_4=c(434, 460, 480, 503),
		knots_5=c(457, 483, 504, 528),
		knots_6=c(479, 505, 525, 548),
		knots_7=c(501, 526, 546, 569),
		knots_8=c(507, 535, 558, 583),
		knots_10=c(526, 555, 576, 600),
		boundaries_3=c(215.9, 634.1),
		boundaries_4=c(235.9, 654.1),
		boundaries_5=c(265.9, 684.1),
		boundaries_6=c(306.1, 703.9),
		boundaries_7=c(326.2, 713.8),
		boundaries_8=c(346.2, 733.8),
		boundaries_10=c(406.6, 753.4),
		loss.hoss_3=c(220, 630),
		loss.hoss_4=c(240, 650),
		loss.hoss_5=c(270, 680),
		loss.hoss_6=c(310, 700),
		loss.hoss_7=c(330, 710),
		loss.hoss_8=c(350, 730),
		loss.hoss_10=c(410, 750)))

SGPstateData[["WI"]][["Achievement"]][["Cutscores"]] <- 
	list(READING=list(
		GRADE_3=c(394, 430, 466),
		GRADE_4=c(396, 440, 489),
		GRADE_5=c(401, 444, 497),
		GRADE_6=c(418, 457, 514),
		GRADE_7=c(434, 467, 523),
		GRADE_8=c(445, 480, 539),
		GRADE_10=c(456, 503, 555)),
	READING.2012=list(
		GRADE_3=c(445, 475, 507),
		GRADE_4=c(462, 498, 536),
		GRADE_5=c(464, 504, 546),
		GRADE_6=c(479, 525, 574),
		GRADE_7=c(486, 537, 591),
		GRADE_8=c(493, 548, 613),
		GRADE_10=c(496, 566, 645)),
	MATHEMATICS=list(
		GRADE_3=c(392, 407, 452),
		GRADE_4=c(421, 438, 484),
		GRADE_5=c(445, 463, 505),
		GRADE_6=c(464, 485, 532),
		GRADE_7=c(480, 504, 555),
		GRADE_8=c(483, 513, 573),
		GRADE_10=c(516, 541, 595)),
	MATHEMATICS.2012=list(
		GRADE_3=c(388, 438, 491),
		GRADE_4=c(426, 474, 527),
		GRADE_5=c(452, 503, 558),
		GRADE_6=c(477, 525, 577),
		GRADE_7=c(500, 546, 592),
		GRADE_8=c(510, 558, 605),
		GRADE_10=c(527, 574, 617)))

SGPstateData[["WI"]][["Achievement"]][["Levels"]] <- 
	list(
	Labels=c("Minimal Performance", "Basic", "Proficient", "Advanced"),
	Proficient=c("Not Proficient", "Not Proficient", "Proficient", "Proficient"))

SGPstateData[["WI"]][["Growth"]][["Cutscores"]] <-
        list(
        Cuts=c(35, 66),
        Labels=c("1st - 34th", "35th - 65th", "66th - 99th"))

SGPstateData[["WI"]][["Growth"]][["Levels"]] <- c("Low", "Typical", "High")

SGPstateData[["WI"]][["Growth"]][["System_Type"]] <- "Cohort Referenced"

SGPstateData[["WI"]][["Assessment_Program_Information"]] <- 
	list(
	Assessment_Name="Wisconsin Knowledge and Concepts Examinations",
	Assessment_Abbreviation="WKCE",
	Organization=list(
                Name="Wisconsin Department of Public Instruction",
		Abbreviation="WDOE",
                URL="dpi.state.wi.us",
                Contact="800-441-4563"),
	Content_Areas=c("Mathematics", "Reading"),
	Grades_Tested=c(3,4,5,6,7,8,10),
	Assessment_Years=c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"),
	Test_Season="Fall",
	Test_Vendor="CTB/McGraw Hill",
	CSEM=Wisconsin_CSEM)

SGPstateData[["WI"]][["Student_Report_Information"]] <- 
	list(
	Vertical_Scale="Yes",
	Content_Areas_Labels=list(MATHEMATICS="Math", READING="Reading"),
	Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)),
	Achievement_Level_Labels=list(
		"Minimal"="Minimal Performance", 
 		"Basic"="Basic", 
		"Proficient"="Proficient", 
		"Advanced"="Advanced"))

load("Baseline_Coefficient_Matrices/WI_Baseline_Matrices.Rdata")
SGPstateData[["WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["MATHEMATICS.BASELINE"]] <- WI_Baseline_Matrices[["MATHEMATICS.BASELINE"]]
SGPstateData[["WI"]][["Baseline_splineMatrix"]][["Coefficient_Matrices"]][["READING.BASELINE"]] <- WI_Baseline_Matrices[["READING.BASELINE"]]
SGPstateData[["WI"]][["Variable_Name_Lookup"]] <- read.csv("Variable_Name_Lookup/WI_Variable_Name_Lookup.csv", colClasses=c(rep("character",4), "logical"))


### WYOMING

SGPstateData[["WY"]][["Achievement"]][["Knots_Boundaries"]] <- 
  list(MATHEMATICS=list(
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
         loss.hoss_8 = c(409, 939)))

SGPstateData[["WY"]][["Achievement"]][["Cutscores"]] <- 
  list(MATHEMATICS=list(
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
         GRADE_8 = c(624, 676, 749)))

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
         Content_Areas=c("Mathematics", "Reading"),
         Grades_Tested=c(3,4,5,6,7,8),
         Assessment_Years=c("2007_2008","2008_2009", "2009_2010", "2010_2011", "2011_2012", "2012_2013")))
       
SGPstateData[["WY"]][["Student_Report_Information"]] <- 
  list(
       Vertical_Scale="Yes",
       Content_Areas_Labels=list(MATHEMATICS="Mathematics", READING="Reading"),
       Grades_Reported=list(MATHEMATICS=c(3,4,5,6,7,8), READING=c(3,4,5,6,7,8)), 
       Achievement_Level_Labels=list(
          Below_Basic = "Below",
          Basic = "Basic",
          Proficient = "Proficient",
          Advanced = "Advanced"))		

######################################################
###
### Save the result
###
######################################################

save(SGPstateData, file="SGPstateData.rda", compress="xz")
