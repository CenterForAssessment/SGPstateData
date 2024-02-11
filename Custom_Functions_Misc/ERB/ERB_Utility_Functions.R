ERB_Function_List <- list(

createSGPLookupTable = 
function(state,
    content_area_sequence,
    grade_sequence,
    year_sequence,
    sgp.config=NULL,
    csem_table,
    content_area_grade_modality_difficulty_combinations
) {

    ### Utility function
    convert_to_long <- function(wide.dt, content_area_sequence, year_sequence, grade_sequence) {
        tmp.dt <- rbind(
                    data.table(VALID_CASE="VALID_CASE", CONTENT_AREA=content_area_sequence[1], YEAR=year_sequence[1], GRADE=grade_sequence[1], ID=paste(seq(dim(wide.dt)[1]), paste(grade_sequence, collapse=""), sep="_"), SCALE_SCORE=as.numeric(wide.dt[['V1']])),
                    data.table(VALID_CASE="VALID_CASE", CONTENT_AREA=content_area_sequence[2], YEAR=year_sequence[2], GRADE=grade_sequence[2], ID=paste(seq(dim(wide.dt)[1]), paste(grade_sequence, collapse=""), sep="_"), SCALE_SCORE=as.numeric(wide.dt[['V2']]))
                )
        return(tmp.dt)
    }

    csem_content_area <- function(content_area) {
        tmp.dt <- data.table(
            CONTENT_AREA_ORIGINAL <- c('ALGEBRA', 'AUDITORY_COMPREHENSION', 'MATHEMATICS', 'QUANTITATIVE_REASONING', 'READING_COMPREHENSION', 'SCIENCE', 'VERBAL_REASONING', 'VOCABULARY', 'WORD_ANALYSIS', 'WRITING_CONCEPTS_&_SKILLS', 'WRITING_MECHANICS')
        )

    }
    if (is.null(sgp.config)) {
        prior_range <- SGP::SGPstateData[[state]][['Achievement']][['Knots_Boundaries']][[content_area_sequence[1]]][[paste("loss.hoss", grade_sequence[1], sep="_")]]
        current_range <- SGP::SGPstateData[[state]][['Achievement']][['Knots_Boundaries']][[content_area_sequence[2]]][[paste("loss.hoss", grade_sequence[2], sep="_")]]
        tmp.dt <- convernt_to_long(data.table::CJ(seq(prior_range[1], prior_range[2]), seq(current_range[1], current_range[2])), content_area_sequence, year_sequence, grade_sequence)
        return(tmp.dt)
    } else {
        tmp.dt.list <- list()
        content_area_sequence <- tail(sgp.config[[1]][['sgp.content.areas']], 2)
        year_sequence <- tail(sgp.config[[1]][['sgp.panel.years']], 2)
        for (grade_sequence.iter in seq_along(sgp.config[[1]][['sgp.grade.sequences']])) {
            grade_sequence <- tail(sgp.config[[1]][['sgp.grade.sequences']][grade_sequence.iter][[1]], 2)
            prior_range <- SGP::SGPstateData[[state]][['Achievement']][['Knots_Boundaries']][[content_area_sequence[1]]][[paste("loss.hoss", grade_sequence[1], sep="_")]]
            current_range <- SGP::SGPstateData[[state]][['Achievement']][['Knots_Boundaries']][[content_area_sequence[2]]][[paste("loss.hoss", grade_sequence[2], sep="_")]]
            tmp.dt.list[[grade_sequence.iter]] <- convert_to_long(data.table::CJ(seq(prior_range[1], prior_range[2]), seq(current_range[1], current_range[2])), content_area_sequence, year_sequence, grade_sequence)
        }
        tmp.dt <- rbindlist(tmp.dt.list)
    }

    ### Merge CSEMs
    tmp.list <- list()
    CONTENT_AREAS_ORIGINAL <- c('ALGEBRA', 'AUDITORY_COMPREHENSION', 'MATHEMATICS', 'QUANTITATIVE_REASONING', 'READING_COMPREHENSION', 'SCIENCE', 'VERBAL_REASONING', 'VOCABULARY', 'WORD_ANALYSIS', 'WRITING_CONCEPTS_&_SKILLS', 'WRITING_MECHANICS')
    tmp.dt[,CONTENT_AREA_CSEM_LABEL:=as.factor(CONTENT_AREA)]
    new.levels <- as.character(sapply(levels(tmp.dt[['CONTENT_AREA_CSEM_LABEL']]), function(y) names(unlist(sapply(CONTENT_AREAS_ORIGINAL, function(x) grep(x, y))))))
    setattr(tmp.dt[['CONTENT_AREA_CSEM_LABEL']], "levels", new.levels)
    for (levels.iter in new.levels) {
        tmp.list[[levels.iter]] <- tmp.dt[content_area_grade_modality_difficulty_combinations[CONTENT_AREA_CSEM_LABEL==levels.iter], on=c("CONTENT_AREA_CSEM_LABEL", "GRADE"), allow.cartesian=TRUE]
    }
    if (length(tmp.list)==1L) tmp.all <- tmp.list[[1]] else tmp.all <- rbindlist(tmp.list)
    tmp.final <- csem_table[tmp.all, on=c("CONTENT_AREA_CSEM_LABEL", "GRADE", "MODALITY", "DIFFICULTY", "SCALE_SCORE")]
    tmp.final[,ID:=paste(ID, MODALITY, DIFFICULTY, sep="_")]
    
    return(tmp.final[,c("VALID_CASE", "CONTENT_AREA", "YEAR", "ID", "GRADE", "SCALE_SCORE", "SCALE_SCORE_CSEM", "MODALITY", "DIFFICULTY", "CONTENT_AREA_CSEM_LABEL"), with=FALSE])
} ### END createSGPLookupTable

,

get.csem.lookup = 
function(SCALE_SCORE,
        CSEM
) {
        tmp.approx.fun <- approxfun(SCALE_SCORE, CSEM)
        tmp.sequence.scale.scores <- seq(min(SCALE_SCORE, na.rm=TRUE), max(SCALE_SCORE, na.rm=TRUE))

        my.tmp <- data.table(
            SCALE_SCORE=tmp.sequence.scale.scores,
            SCALE_SCORE_CSEM=tmp.approx.fun(tmp.sequence.scale.scores)
        )

        return(my.tmp)
} ### END get.csem.lookup 

)
