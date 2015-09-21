##############################################################################
###
### Function to load, group and save matrices by RLI_UK testing window
###
##############################################################################

groupMatrices <- function(year) {
	tmp <- unlist(strsplit(year, '[.]'))
	tmp.year <- tmp[1]
	tmp.window <- tmp[2]

	if (tmp.window==1) {
		tmp.year.current <- SGP:::yearIncrement(tmp.year, 0)
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "1", "Rdata", sep="."), sep=""))
		tmp.1 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "1", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "2", "Rdata", sep="."), sep=""))
		tmp.2 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "2", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", "Rdata", sep="."), sep=""))
		tmp.3 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", sep="."), sep=""))
		assign(paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""), list(
			EARLY_LITERACY.BASELINE=c(tmp.1[['EARLY_LITERACY.BASELINE']], tmp.2[['EARLY_LITERACY.BASELINE']], tmp.3[['EARLY_LITERACY.BASELINE']]),
			READING.BASELINE=c(tmp.1[['READING.BASELINE']], tmp.2[['READING.BASELINE']], tmp.3[['READING.BASELINE']]),
			MATHEMATICS.BASELINE=c(tmp.1[['MATHEMATICS.BASELINE']], tmp.2[['MATHEMATICS.BASELINE']], tmp.3[['MATHEMATICS.BASELINE']])))
		save(list=paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""),
			file=paste("RLI_UK_SGPt_Baseline_matrices_", paste(tmp.year, tmp.window, "Rdata", sep="."), sep=""))
	}

	if (tmp.window==2) {
		tmp.year.forward <- SGP:::yearIncrement(tmp.year, 1)
		tmp.year.current <- SGP:::yearIncrement(tmp.year, 0)
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "1", "Rdata", sep="."), sep=""))
		tmp.1 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "1", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "2", "Rdata", sep="."), sep=""))
		tmp.2 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "2", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", "Rdata", sep="."), sep=""))
		tmp.3 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", sep="."), sep=""))
		assign(paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""), list(
			EARLY_LITERACY.BASELINE=c(tmp.1[['EARLY_LITERACY.BASELINE']], tmp.2[['EARLY_LITERACY.BASELINE']], tmp.3[['EARLY_LITERACY.BASELINE']]),
			READING.BASELINE=c(tmp.1[['READING.BASELINE']], tmp.2[['READING.BASELINE']], tmp.3[['READING.BASELINE']]),
			MATHEMATICS.BASELINE=c(tmp.1[['MATHEMATICS.BASELINE']], tmp.2[['MATHEMATICS.BASELINE']], tmp.3[['MATHEMATICS.BASELINE']])))
		save(list=paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""),
			file=paste("RLI_UK_SGPt_Baseline_matrices_", paste(tmp.year, tmp.window, "Rdata", sep="."), sep=""))
	}

	if (tmp.window==3) {
		tmp.year.forward <- SGP:::yearIncrement(tmp.year, 1)
		tmp.year.current <- SGP:::yearIncrement(tmp.year, 0)
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "1", "Rdata", sep="."), sep=""))
		tmp.1 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "1", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "2", "Rdata", sep="."), sep=""))
		tmp.2 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.forward, "2", sep="."), sep=""))
		load(file=paste("../RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", "Rdata", sep="."), sep=""))
		tmp.3 <- get(paste("RLI_UK_Baseline_Matrices_", paste(tmp.year.current, "3", sep="."), sep=""))
		assign(paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""), list(
			EARLY_LITERACY.BASELINE=c(tmp.1[['EARLY_LITERACY.BASELINE']], tmp.2[['EARLY_LITERACY.BASELINE']], tmp.3[['EARLY_LITERACY.BASELINE']]),
			READING.BASELINE=c(tmp.1[['READING.BASELINE']], tmp.2[['READING.BASELINE']], tmp.3[['READING.BASELINE']]),
			MATHEMATICS.BASELINE=c(tmp.1[['MATHEMATICS.BASELINE']], tmp.2[['MATHEMATICS.BASELINE']], tmp.3[['MATHEMATICS.BASELINE']])))
		save(list=paste("RLI_UK_SGPt_Baseline_Matrices_", paste(tmp.year, tmp.window, sep="."), sep=""),
			file=paste("RLI_UK_SGPt_Baseline_matrices_", paste(tmp.year, tmp.window, "Rdata", sep="."), sep=""))
	}
} ### END groupMatrices
