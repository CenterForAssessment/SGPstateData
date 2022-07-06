`make.custom.isr` = function() {
    ## Start pdf device
  report.width <- custom.isr$report.width
  report.height <- custom.isr$report.height

  pdf(file.path(path.to.pdfs, file_name),
      width = report.width, height = report.height, version = "1.4", onefile = TRUE)

  ##  Push full report layout viewport
  pushViewport(custom.isr$Grid_Objects$report.vp)
    ##  Push/pop content area report blocks
    vp <- 1 # for (vp in seq_along(content_areas)) {
    tmp_student_data <- as.data.frame(tmp_grade_data[ID == n & CONTENT_AREA == content_areas[vp]])
    BIRTH_DATE <- tmp_student_data[[grep("BIRTH_DATE", names(tmp_student_data), value = TRUE)]]

    pushViewport(custom.isr$Grid_Objects$content_area_1.vp)
    studentGrowthPlot(
        Scale_Scores = as.numeric(subset(tmp_student_data,
            select = paste("SCALE_SCORE", rev(sgPlot.years), sep = "."))),
        Plotting_Scale_Scores = as.numeric(subset(tmp_student_data,
            select = paste("TRANSFORMED_SCALE_SCORE", rev(sgPlot.years), sep = "."))),
        Achievement_Levels = as.character(unlist(subset(tmp_student_data,
            select = paste("ACHIEVEMENT_LEVEL", rev(sgPlot.years), sep = ".")))),
        SGP = as.numeric(subset(tmp_student_data, select = paste(my.sgp, rev(sgPlot.years), sep = "."))),
        SGP_Levels = as.character(unlist(subset(tmp_student_data,
            select = paste(my.sgp.level, rev(sgPlot.years), sep = ".")))),
        Grades = as.character(subset(tmp_student_data,
            select = paste("GRADE", rev(sgPlot.years), sep = "."))),
        Content_Areas = as.character(subset(tmp_student_data,
            select = paste("CONTENT_AREA_LABELS", rev(sgPlot.years), sep = "."))),
        Cuts = list(
            NY1 = as.numeric(subset(tmp_student_data,
            select = setdiff(intersect(
                grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_1", names(tmp_student_data))),
                grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
            NY2 = as.numeric(subset(tmp_student_data,
            select = setdiff(intersect(
                grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_2", names(tmp_student_data))),
                grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
            NY3 = as.numeric(subset(tmp_student_data,
            select = setdiff(intersect(
                grep(trajectory.cuts, names(tmp_student_data)), grep("YEAR_3", names(tmp_student_data))),
                grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
        Plotting_Cuts = list(
            NY1 = as.numeric(subset(tmp_student_data,
            select = intersect(grep(trajectory.cuts, names(tmp_student_data)),
                                grep("YEAR_1_CURRENT_TRANSFORMED", names(tmp_student_data))))),
            NY2 = as.numeric(subset(tmp_student_data,
            select = intersect(grep(trajectory.cuts, names(tmp_student_data)),
                                grep("YEAR_2_CURRENT_TRANSFORMED", names(tmp_student_data))))),
            NY3 = as.numeric(subset(tmp_student_data,
            select = intersect(grep(trajectory.cuts, names(tmp_student_data)),
                                grep("YEAR_3_CURRENT_TRANSFORMED", names(tmp_student_data)))))),
        # SGP_Targets = list(
        #     CUKU = tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], sep = "_"), last.year, sep = ".")]],
        #     CUKU_Current = tmp_student_data[[paste(paste(my.sgp.target.label[1], my.sgp.target.label[2], "CURRENT", sep = "_"), last.year, sep = ".")]],
        #     MUSU = tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], sep = "_"), last.year, sep = ".")]],
        #     MUSU_Current = tmp_student_data[[paste(paste(my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "CURRENT", sep = "_"), last.year, sep = ".")]]),
        # SGP_Scale_Score_Targets = list(
        #     CUKU = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3", sep = "_")]])),
        #     MUSU = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3", sep = "_")]])),
        #     CUKU_Current = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep = "_")]])),
        #     MUSU_Current = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT", sep = "_")]]))),
        # Plotting_SGP_Scale_Score_Targets = list(
        #     CUKU = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep = "_")]])),
        #     MUSU = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_TRANSFORMED", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_TRANSFORMED", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_TRANSFORMED", sep = "_")]])),
        #     CUKU_Current = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep = "_")]])),
        #     MUSU_Current = list(
        #     NY1 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_1_CURRENT_TRANSFORMED", sep = "_")]]),
        #     NY2 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_2_CURRENT_TRANSFORMED", sep = "_")]]),
        #     NY3 = as.numeric(tmp_student_data[[paste('SCALE_SCORE', my.sgp.target.label[1], "MOVE_UP_STAY_UP", my.sgp.target.label[2], "PROJ_YEAR_3_CURRENT_TRANSFORMED", sep = "_")]]))),
        Cutscores = sgPlot.cutscores[[content_areas[vp]]],
        Years = rev(sgPlot.years),
        Report_Parameters = list(
            Current_Year = last.year, Content_Area = content_areas[vp],
            State = "WIDA_GA", SGP_Targets = sgPlot.sgp.targets,
            Content_Area_Title = tmp_student_data[[paste("CONTENT_AREA_LABELS", last.year, sep = ".")]],
            Configuration = list(Language = custom.isr$Language,
                                Zero_to_K = custom.isr$Zero_to_K,
                                Font_Family = custom.isr$Font_Family,
                                Font_Size = list(
                                    title.ca.size = 1.6, legend.size = 0.6, legend.lheight = 0.7,
                                    left.vp.size = 0.75, bottom.right.vp.size = 1.2, bottom.left.vp.size = 0.6))))

    popViewport()

    ###   Top Border/Banner
    ##    Left Column
    pushViewport(custom.isr$Grid_Objects$top.student.fname.vp)
    # grid.rect(gp = gpar(fill = "#51B898", col = "#51B898"))
    grid.text(label = paste("First Name:", FIRST_NAME),
              x = 0.0125, y = 0.5, just = "left", default.units = "native",
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$top.student.lname.vp)
    # grid.rect(gp = gpar(fill = "#B8EADC", col = "#B8EADC"))
    grid.text(label = paste("Last Name:", LAST_NAME), # gsub(" ", "-", LAST_NAME)),
              x = 0.0125, y = 0.5, just = "left", default.units = "native", 
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$top.student.id.vp)
    # grid.rect(gp = gpar(fill = "#004331", col = "#004331"))
    grid.text(label = paste("GTID:", student_number),
              x = 0.0125, y = 0.5, just = "left", default.units = "native",
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    ##    Right Column
    pushViewport(custom.isr$Grid_Objects$top.student.bdate.vp)
    # grid.rect(gp = gpar(fill = "#004331", col = "#004331"))
    grid.text(label = paste("Birth Date:", BIRTH_DATE),
              x = 0.0125, y = 0.5, just = "left", default.units = "native", 
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$top.system.name.vp)
    # grid.rect(gp = gpar(fill = "#51B898", col = "#51B898"))
    grid.text(label = paste("System Name:", tmp_district_name),
              x = 0.0125, y = 0.5, just = "left", default.units = "native",
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$top.school.name.vp)
    # grid.rect(gp = gpar(fill = "#B8EADC", col = "#B8EADC"))
    grid.text(label = paste("School Name:", tmp_school_name),
              x = 0.0125, y = 0.5, just = "left", default.units = "native",
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "black", cex = 0.825))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$top.border.logo.vp)
    grid.raster(x = 0.075, y = 0.5, custom.isr$Report_Logo, width = unit(0.75, "npc"), just = "left")
    popViewport()

    ##  Report Title
    pushViewport(custom.isr$Grid_Objects$report_title.vp)
    grid.text(label = custom.isr$Report_Title,
              gp = gpar(fontface = "bold", fontfamily = "Helvetica", col = "black", cex = 1.25),
              just = "top", default.units = "native") # Helvetica-Narrow
    popViewport()

    ##  Color block 1
    pushViewport(custom.isr$Grid_Objects$color_block_1.vp)
    grid.rect(height = unit(0.5, "npc"), gp = gpar(fill = "#0066B2", col = "#0066B2"))
    popViewport()

    ##  Report Text
    pushViewport(custom.isr$Grid_Objects$report_text.vp)
    grid.text(label = custom.isr$Report_Text,
              x = 0.0125, y = 0.5, just = "left", default.units = "native",
              gp = gpar(fontfamily = custom.isr$Font_Family, col = "black", cex = 0.8)) # cex = 0.825
    popViewport()

    ##  Color block 2
    pushViewport(custom.isr$Grid_Objects$color_block_2.vp)
    grid.rect(height = unit(0.5, "npc"), gp = gpar(fill = "#0066B2", col = "#0066B2"))
    popViewport()

    pushViewport(custom.isr$Grid_Objects$left.border.vp)
    grid.rect(gp = gpar(fill = "#0066B2", col = "#0066B2"))
    grid.text(label = custom.isr$Report_Title, rot = 270, just = "center", default.units = "native",
              gp = gpar(fontface = "bold", fontfamily = custom.isr$Font_Family, col = "white", cex = 2))
    popViewport()

    ## Bottom Legend
    pushViewport(custom.isr$Grid_Objects$bottom.border.vp)
    copyright.text <- paste0("Cooperatively developed by the ", tmp.organization$Name, " (",
                             tmp.organization$Abbreviation, ") & the Center for Assessment, Inc.")
    # grid.text(label = "Copyright \u{00A9} 2022 Georgia Department of Education.", x = 0.29,
    grid.text(label = paste0(copyright.text, " Distributed by ", tmp.organization$Abbreviation, "."),
              x = 0.02, y = 0.75, default.units = "native", just = c("left", "top"),
              gp = gpar(cex = 0.85, col = "black", fontface = "bold", fontfamily = custom.isr$Font_Family))
    popViewport()

  popViewport()

  dev.off()
}
