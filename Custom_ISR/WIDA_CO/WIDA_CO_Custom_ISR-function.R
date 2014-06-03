make.custom.isr <- function() {

		##  Push full report layout viewport
		pushViewport(custom.isr$Grid_Objects$report.vp)
		##  Push/pop content area report blocks
		for (vp in seq_along(content_areas)) {
			tmp_student_data <- as.data.frame(tmp_grade_data[ID==n & CONTENT_AREA==content_areas[vp]])
			pushViewport(eval(parse(text=paste("custom.isr$Grid_Objects$content_area_", vp, ".vp", sep=""))))
			studentGrowthPlot(
				Scale_Scores=as.numeric(subset(tmp_student_data, select=paste("SCALE_SCORE", rev(sgPlot.years), sep="."))),
				Plotting_Scale_Scores=as.numeric(subset(tmp_student_data, select=paste("TRANSFORMED_SCALE_SCORE", rev(sgPlot.years), sep="."))),
				Achievement_Levels=as.character(unlist(subset(tmp_student_data, select=paste("ACHIEVEMENT_LEVEL", rev(sgPlot.years), sep=".")))),
				SGP=as.numeric(subset(tmp_student_data, select=paste(my.sgp, rev(sgPlot.years), sep="."))),
				SGP_Levels=as.character(unlist(subset(tmp_student_data, select=paste(my.sgp.level, rev(sgPlot.years), sep=".")))),
				Grades=as.character(subset(tmp_student_data, select=paste("GRADE", rev(sgPlot.years), sep="."))),
				Content_Areas=as.character(subset(tmp_student_data, select=paste("CONTENT_AREA_LABELS", rev(sgPlot.years), sep="."))),
				Cuts=list(
					NY1=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_1", names(tmp_student_data))), grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY2=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_2", names(tmp_student_data))), grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY3=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_3", names(tmp_student_data))), grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
				Plotting_Cuts=list(
					NY1=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY2=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY3=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
				SGP_Targets=list(
					CUKU=tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], sep="_"), last.year, sep=".")]], 
					CUKU_Current=tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], "CURRENT", sep="_"), last.year, sep=".")]], 
					MUSU=tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], sep="_"), last.year, sep=".")]], 
					MUSU_Current=tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "CURRENT", sep="_"), last.year, sep=".")]]),
				SGP_Scale_Score_Targets=list(
					CUKU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3", sep="_")]])),
					MUSU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3", sep="_")]])),
					CUKU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep="_")]])),
					MUSU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep="_")]]))),
				Plotting_SGP_Scale_Score_Targets=list(
					CUKU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep="_")]])),
					MUSU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep="_")]])),
					CUKU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep="_")]])),
					MUSU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep="_")]]))),
				Cutscores=Cutscores[[content_areas[vp]]],
				Years=rev(sgPlot.years),
				Report_Parameters=list(Current_Year=last.year, Content_Area=content_areas[vp], State="WIDA_CO", SGP_Targets=sgPlot.sgp.targets,
					Content_Area_Title=tmp_student_data[[paste("CONTENT_AREA_LABELS", last.year, sep=".")]], Configuration= list(Font_Size="Small_1")))
	
			popViewport()
		} ## END loop over content_areas


		## Top Border/Banner
		pushViewport(custom.isr$Grid_Objects$top.student.name.vp)
		grid.rect(gp=gpar(fill="#8FC9C1", col="#8FC9C1"))
		grid.text(x=0.975, y=0.5, paste(FIRST_NAME, " ", LAST_NAME, sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1), just="right", default.units="native")
		popViewport()
		pushViewport(custom.isr$Grid_Objects$top.student.id.vp)
		grid.rect(gp=gpar(fill="#339933", col="#339933"))
		grid.text(x=0.125, y=0.5, paste("(", student_number, ")", sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1), just="left", default.units="native")
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$top.border.cde.vp)
		grid.raster(custom.isr$Report_Logo)
		popViewport()
#		
		##  Report Title
		pushViewport(custom.isr$Grid_Objects$report_title.vp)
		grid.text("English Language Proficiency and Student Growth Report",
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="black", cex=1.25), just="top", default.units="native")
		popViewport()
#		
		##  Color block 1		
		pushViewport(custom.isr$Grid_Objects$color_block_1.vp)
		grid.rect(gp=gpar(fill=sgPlot.header.footer.color, col=sgPlot.header.footer.color))
		popViewport()
#
		##  Report Text
		pushViewport(custom.isr$Grid_Objects$report_text.vp)
		grid.text(x=0.025, y=0.5, custom.isr$Report_Text, gp=gpar(fontfamily="Helvetica-Narrow", col="black", cex=0.775), just="left", default.units="native")
		popViewport()
#
		##  Color block 2		
		pushViewport(custom.isr$Grid_Objects$color_block_2.vp)
		grid.rect(gp=gpar(fill=sgPlot.header.footer.color, col=sgPlot.header.footer.color))
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$report.student.name.vp)
		grid.rect(gp=gpar(fill="#8FC9C1", col="#8FC9C1"))
		grid.text(x= 0.125, y=0.5, paste(FIRST_NAME, " ", LAST_NAME, sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1.25), just="left", default.units="native")
		popViewport()
		pushViewport(custom.isr$Grid_Objects$report.school.name.vp)
		grid.rect(gp=gpar(fill="#339933", col="#339933"))
		grid.text(x= 0.125, y=0.5, tmp_school_name, gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1.25), just="left", default.units="native")
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$left.border.vp)
		grid.rect(gp=gpar(fill= sgPlot.header.footer.color, col= sgPlot.header.footer.color))
		grid.text("2014 English Language Proficiency and Student Growth Report",
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=2), rot=270, just="center", default.units="native")
		popViewport()
#
		## Bottom Legend
		pushViewport(custom.isr$Grid_Objects$bottom.border.vp)
		grid.text(x=0.02, y=0.65, paste("For more information please visit the", tmp.organization$Name, paste("(", tmp.organization$Abbreviation, ")", sep=""),
			"at", tmp.organization$URL, "or contact", tmp.organization$Contact), gp=gpar(cex=0.75, col="black"), default.units="native", just=c("left", "top"))
		copyright.text <- paste("Cooperatively developed by the ", tmp.organization$Abbreviation, " & the Center for Assessment, Inc.", sep="")
		grid.text(x=0.02, y=0.30, paste(copyright.text, " Distributed by the ", tmp.organization$Abbreviation, ".", sep=""), 
			gp=gpar(cex=0.75, col="black"), default.units="native", just=c("left", "top"))
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$left.legend.vp)
#
		# Interpretation
		interpretation.y <- 0.95
		achievement.level.region.colors <- paste("grey", round(seq(62, 91, length=number.achievement.level.regions)), sep="")
#
		grid.roundrect(x=unit(0.5, "native"), y=unit(interpretation.y, "native"), width=unit(0.945, "native"), height=unit(0.1, "native"), 
			gp=gpar(fill=sgPlot.header.footer.color, col="black"))
		grid.text(x=0.5, y=interpretation.y+0.02, "How to interpret", gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", cex=0.75, col="white"))
		grid.text(x=0.5, y=interpretation.y-0.02, "this student report", gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", cex=0.75, col="white"))
#
		grid.roundrect(x=unit(0.15, "native"), y=unit(interpretation.y-0.14, "native"), width=unit(0.1, "native"), height=unit(0.05, "native"), r=unit(0.02, "inches"), 
			gp=gpar(fill=achievement.level.region.colors[1], lwd=1))
		grid.circle(x=0.15, y=interpretation.y-0.14, r=0.02, default.units="native", gp=gpar(fill="white"))
		grid.text(x=0.275, y=interpretation.y-0.1, tmp.abbreviation, gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.14, "Scale", gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.175, "Score", gp=gpar(cex=0.75), default.units="native", just="left")
#
		grid.polygon(x=c(0.1375, 0.1375, 0.12, 0.15, 0.18, 0.1625, 0.1625), y=interpretation.y-c(0.35, 0.3, 0.31, 0.27, 0.31, 0.3, 0.35), 
			default.units="native",gp=gpar(fill="grey50"))
		grid.text(x=0.275, y=interpretation.y-0.27, "Student", gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.31, "Growth", gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.35, "Percentile", gp=gpar(cex=0.75), default.units="native", just="left")
#
		tmp.rect.height <- 0.125/number.achievement.level.regions
		for (l in seq(number.achievement.level.regions)) {
			grid.rect(x=unit(0.15, "native"), y=unit(interpretation.y-0.45-(l-1)*tmp.rect.height, "native"), width=unit(0.1, "native"),
				height=unit(tmp.rect.height, "native"), gp=gpar(fill=rev(achievement.level.region.colors)[l], col="white", lwd=1), just=c("center", "top"))
		} 
		grid.roundrect(x=unit(0.15, "native"), y=interpretation.y-0.45, width=unit(0.1, "native"), height=unit(0.125, "native"),
			 r=unit(0.02, "inches"),gp=gpar(col="black", lwd=1.5), just=c("center", "top"))
		grid.text(x=0.275, y=interpretation.y-0.48, tmp.abbreviation, default.units="native", just="left", gp=gpar(cex=0.75))
		grid.text(x=0.275, y=interpretation.y-0.515, "Achievement", default.units="native", just="left", gp=gpar(cex=0.75))
		grid.text(x=0.275, y=interpretation.y-0.55, "Levels", default.units="native", just="left", gp=gpar(cex=0.75))
#
		if (!is.null(sgPlot.sgp.targets)) {
			grid.circle(x=0.15, y=interpretation.y-0.735, r=unit(c(0.08, 0.065, 0.045, 0.0225), "inches"),
				gp=gpar(col=c("black", "white", "black", "white"), lwd=0.01, fill=c("black", "white", "black", "white")), default.units="native")
			grid.text(x= 0.3, y=interpretation.y-0.665, "Catch Up/", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.7, "Keep Up &", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.735, "Move Up/", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.77, "Stay Up", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.805, "Targets", gp=gpar(cex=0.65), default.units="native", just="left")
		}
#
		# Extra stuff	
		grid.roundrect(x=unit(0.5, "native"), y=unit(0.5, "native"), width=unit(0.945, "native"), height=unit(0.8, "native"), r=unit(0.035, "inches"))
		popViewport()
		
#######################
##  Spanish Version  ##
#######################

		##  See changes to "Report_Parameters" argument in call to studentGrowthPlot
		grid.newpage()

		##  Push full report layout viewport
		pushViewport(custom.isr$Grid_Objects$report.vp)
		
		##  Push/pop content area report blocks
		for (vp in seq_along(content_areas)) {
			tmp_student_data <- as.data.frame(tmp_grade_data[ID==n & CONTENT_AREA==content_areas[vp]])
			pushViewport(eval(parse(text=paste("custom.isr$Grid_Objects$content_area_", vp, ".vp", sep=""))))
			studentGrowthPlot(
				Scale_Scores=as.numeric(subset(tmp_student_data, select=paste("SCALE_SCORE", rev(sgPlot.years), sep="."))),
				Plotting_Scale_Scores=as.numeric(subset(tmp_student_data, select=paste("TRANSFORMED_SCALE_SCORE", rev(sgPlot.years), sep="."))),
				Achievement_Levels=as.character(unlist(subset(tmp_student_data, select=paste("ACHIEVEMENT_LEVEL", rev(sgPlot.years), sep=".")))),
				SGP=as.numeric(subset(tmp_student_data, select=paste(my.sgp, rev(sgPlot.years), sep="."))),
				SGP_Levels=as.character(unlist(subset(tmp_student_data, select=paste(my.sgp.level, rev(sgPlot.years), sep=".")))),
				Grades=as.character(subset(tmp_student_data, select=paste("GRADE", rev(sgPlot.years), sep="."))),
				Content_Areas=as.character(subset(tmp_student_data, select=paste("CONTENT_AREA_LABELS", rev(sgPlot.years), sep="."))),
				Cuts=list(
					NY1=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_1", names(tmp_student_data))), grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY2=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_2", names(tmp_student_data))), grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY3=as.numeric(subset(tmp_student_data, select=setdiff(intersect(grep(trajectory.cuts, names(tmp_student_data)), 
						grep("YEAR_3", names(tmp_student_data))), grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
				Plotting_Cuts=list(
					NY1=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY2=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
					NY3=as.numeric(subset(tmp_student_data, select=intersect(grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
				SGP_Targets=list(
					CUKU=tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], sep="_"), last.year, sep=".")]], 
					CUKU_Current=tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], "CURRENT", sep="_"), last.year, sep=".")]], 
					MUSU=tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], sep="_"), last.year, sep=".")]], 
					MUSU_Current=tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "CURRENT", sep="_"), last.year, sep=".")]]),
				SGP_Scale_Score_Targets=list(
					CUKU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3", sep="_")]])),
					MUSU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3", sep="_")]])),
					CUKU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep="_")]])),
					MUSU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep="_")]]))),
				Plotting_SGP_Scale_Score_Targets=list(
					CUKU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep="_")]])),
					MUSU=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep="_")]])),
					CUKU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep="_")]])),
					MUSU_Current=list(
						NY1=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep="_")]]),
						NY2=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep="_")]]),
						NY3=as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep="_")]]))),
				Cutscores=Cutscores[[content_areas[vp]]],
				Years=rev(sgPlot.years),
				Report_Parameters=list(Current_Year=last.year, Content_Area=content_areas[vp], State="WIDA_CO_SPAN", SGP_Targets=sgPlot.sgp.targets,
					Content_Area_Title=tmp_student_data[[paste("CONTENT_AREA_LABELS", last.year, sep=".")]], Configuration= list(Language = "Spanish", Font_Size="Small_1")))
	
			popViewport()
		} ## END loop over content_areas


		## Top Border/Banner
		pushViewport(custom.isr$Grid_Objects$top.student.name.vp)
		grid.rect(gp=gpar(fill="#8FC9C1", col="#8FC9C1"))
		grid.text(x=0.975, y=0.5, paste(FIRST_NAME, " ", LAST_NAME, sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1), just="right", default.units="native")
		popViewport()
		pushViewport(custom.isr$Grid_Objects$top.student.id.vp)
		grid.rect(gp=gpar(fill="#339933", col="#339933"))
		grid.text(x=0.125, y=0.5, paste("(", student_number, ")", sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1), just="left", default.units="native")
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$top.border.cde.vp)
		grid.raster(custom.isr$Report_Logo)
		popViewport()
#		
		##  Report Title
		pushViewport(custom.isr$Grid_Objects$report_title.vp)
		grid.text("Reporte del Crecimiento Estudiantil en el Dominio del Idioma Inglés",
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="black", cex=1.25), just="top", default.units="native")
		popViewport()
#		
		##  Color block 1		
		pushViewport(custom.isr$Grid_Objects$color_block_1.vp)
		grid.rect(gp=gpar(fill=sgPlot.header.footer.color, col=sgPlot.header.footer.color))
		popViewport()
#
		##  Report Text
		pushViewport(custom.isr$Grid_Objects$report_text.vp)
		# grid.draw(splitTextGrob(custom.isr$Report_Text_SPANISH, gp=gpar(fontfamily="Helvetica-Narrow", col="black", cex=0.75), hjust="top", vjust="left", default.units="native"))
		grid.text(x=0.025, y=0.5, custom.isr$Report_Text_SPANISH, gp=gpar(fontfamily="Helvetica-Narrow", col="black", cex=0.775), just="left", default.units="native")
		popViewport()
#
		##  Color block 2		
		pushViewport(custom.isr$Grid_Objects$color_block_2.vp)
		grid.rect(gp=gpar(fill=sgPlot.header.footer.color, col=sgPlot.header.footer.color))
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$report.student.name.vp)
		grid.rect(gp=gpar(fill="#8FC9C1", col="#8FC9C1"))
		grid.text(x= 0.125, y=0.5, paste(FIRST_NAME, " ", LAST_NAME, sep=""),
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1.25), just="left", default.units="native")
		popViewport()
		pushViewport(custom.isr$Grid_Objects$report.school.name.vp)
		grid.rect(gp=gpar(fill="#339933", col="#339933"))
		grid.text(x= 0.125, y=0.5, tmp_school_name, gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=1.25), just="left", default.units="native")
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$left.border.vp)
		grid.rect(gp=gpar(fill= sgPlot.header.footer.color, col= sgPlot.header.footer.color))
		grid.text("2014 Reporte del Crecimiento Estudiantil en el Dominio del Idioma Inglés",
			gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", col="white", cex=2), rot=270, just="center", default.units="native")
		popViewport()
#
		## Bottom Legend
		pushViewport(custom.isr$Grid_Objects$bottom.border.vp)
		grid.text(x=0.02, y=0.65, "Para obtener más información visite www.schoolview.org o llamar El Departamento de Educación de Colorado (CDE): 303-866-6600",
			gp=gpar(cex=0.75, col="black"), default.units="native", just=c("left", "top"))
		copyright.text <- "Producido por El Departamento de Educación de Colorado y El Center for Assessment, Inc."
		grid.text(x=0.02, y=0.30, copyright.text, 
			gp=gpar(cex=0.75, col="black"), default.units="native", just=c("left", "top"))
		popViewport()
#
		pushViewport(custom.isr$Grid_Objects$left.legend.vp)
#
		# Interpretation
#
		grid.roundrect(x=unit(0.5, "native"), y=unit(interpretation.y, "native"), width=unit(0.945, "native"), height=unit(0.1, "native"), 
			gp=gpar(fill=sgPlot.header.footer.color, col="black"))
		grid.text(x=0.5, y=interpretation.y+0.02, "Para interpretar el", gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", cex=0.75, col="white"))
		grid.text(x=0.5, y=interpretation.y-0.02, "reporte studiantil", gp=gpar(fontface="bold", fontfamily="Helvetica-Narrow", cex=0.75, col="white"))
#
		grid.roundrect(x=unit(0.15, "native"), y=unit(interpretation.y-0.13, "native"), width=unit(0.1, "native"), height=unit(0.05, "native"), r=unit(0.02, "inches"), 
			gp=gpar(fill=achievement.level.region.colors[1], lwd=1))
		grid.circle(x=0.15, y=interpretation.y-0.13, r=0.02, default.units="native", gp=gpar(fill="white"))
		grid.text(x=0.275, y=interpretation.y-0.11, tmp.abbreviation, gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.15, "Escala", gp=gpar(cex=0.75), default.units="native", just="left")
#
		grid.polygon(x=c(0.1375, 0.1375, 0.12, 0.15, 0.18, 0.1625, 0.1625), y=interpretation.y-c(0.35, 0.3, 0.31, 0.27, 0.31, 0.3, 0.35), 
			default.units="native",gp=gpar(fill="grey50"))
		grid.text(x=0.275, y=interpretation.y-0.27, "Crecimiento", gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.31, "Estudiantil", gp=gpar(cex=0.75), default.units="native", just="left")
		grid.text(x=0.275, y=interpretation.y-0.35, "Porcentaje", gp=gpar(cex=0.75), default.units="native", just="left")
#
		tmp.rect.height <- 0.125/number.achievement.level.regions
		for (l in seq(number.achievement.level.regions)) {
			grid.rect(x=unit(0.15, "native"), y=unit(interpretation.y-0.44-(l-1)*tmp.rect.height, "native"), width=unit(0.1, "native"),
				height=unit(tmp.rect.height, "native"), gp=gpar(fill=rev(achievement.level.region.colors)[l], col="white", lwd=1), just=c("center", "top"))
		} 
		grid.roundrect(x=unit(0.15, "native"), y=interpretation.y-0.44, width=unit(0.1, "native"), height=unit(0.125, "native"),
			 r=unit(0.02, "inches"),gp=gpar(col="black", lwd=1.5), just=c("center", "top"))
		grid.text(x=0.275, y=interpretation.y-0.47, tmp.abbreviation, default.units="native", just="left", gp=gpar(cex=0.75))
		grid.text(x=0.275, y=interpretation.y-0.505, "Niveles de", default.units="native", just="left", gp=gpar(cex=0.75))
		grid.text(x=0.275, y=interpretation.y-0.54, "Capacitación", default.units="native", just="left", gp=gpar(cex=0.75))
#
		if (!is.null(sgPlot.sgp.targets)) {
			grid.circle(x=0.15, y=interpretation.y-0.735, r=unit(c(0.08, 0.065, 0.045, 0.0225), "inches"),
				gp=gpar(col=c("black", "white", "black", "white"), lwd=0.01, fill=c("black", "white", "black", "white")), default.units="native")
			grid.text(x= 0.3, y=interpretation.y-0.665, "Las Metas de", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.7, "Alcanzar/", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.735,"Guadar &", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.77, "Avanzar/", gp=gpar(cex=0.65), default.units="native", just="left")
			grid.text(x= 0.3, y=interpretation.y-0.805, "Mantener", gp=gpar(cex=0.65), default.units="native", just="left")
		}
#
		# Extra stuff	
		grid.roundrect(x=unit(0.5, "native"), y=unit(0.5, "native"), width=unit(0.945, "native"), height=unit(0.8, "native"), r=unit(0.035, "inches"))
		popViewport()
}
