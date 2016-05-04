################################################################################
###
### Scale Score and Theta Cutscores for PARCC
###
################################################################################

PARCC_Cutscores <- list(
    ELA_SS =list(
        GRADE_3=c(700, 725, 750, 810),
        GRADE_4=c(700, 725, 750, 790),
        GRADE_5=c(700, 725, 750, 799),
        GRADE_6=c(700, 725, 750, 790),
        GRADE_7=c(700, 725, 750, 785),
        GRADE_8=c(700, 725, 750, 794),
        GRADE_9=c(700, 725, 750, 791),
        GRADE_10=c(700, 725, 750, 794),
        GRADE_11=c(700, 725, 750, 792)),
    MATHEMATICS_SS =list(
        GRADE_3=c(700, 725, 750, 790),
        GRADE_4=c(700, 725, 750, 796),
        GRADE_5=c(700, 725, 750, 790),
        GRADE_6=c(700, 725, 750, 788),
        GRADE_7=c(700, 725, 750, 786),
        GRADE_8=c(700, 725, 750, 801)),
    ALGEBRA_I_SS =list(
        GRADE_EOCT=c(700, 725, 750, 805)),
    ALGEBRA_II_SS =list(
        GRADE_EOCT=c(700, 725, 750, 808)),
    GEOMETRY_SS=list(
        GRADE_EOCT=c(700, 725, 750, 783)),
    INTEGRATED_MATH_1_SS=list(
        GRADE_EOCT=c(700, 725, 750, 799)),
    INTEGRATED_MATH_2_SS=list(
        GRADE_EOCT=c(700, 725, 750, 785)),
    INTEGRATED_MATH_3_SS=list(
        GRADE_EOCT=c(700, 725, 750, 804)),

    ELA_THETA =list(
        GRADE_3=c(-0.9769, -0.2867, 0.4034, 2.0598),
        GRADE_4=c(-1.3276, -0.5156, 0.2965, 1.5958),
        GRADE_5=c(-1.3768, -0.5285, 0.3199, 1.9827),
        GRADE_6=c(-1.3649, -0.4946, 0.3757, 1.7682),
        GRADE_7=c(-1.1752, -0.4374, 0.3004, 1.3333),
        GRADE_8=c(-1.1431, -0.4148, 0.3134, 1.5951),
        GRADE_9=c(-1.0779, -0.3481, 0.3817, 1.5786),
        GRADE_10=c(-0.8354, -0.2465, 0.3423, 1.3787),
        GRADE_11=c(-1.0889, -0.4065, 0.2759, 1.4223)),
    MATHEMATICS_THETA =list(
        GRADE_3=c(-1.2403, -0.4553, 0.3296, 1.5855),
        GRADE_4=c(-1.2763, -0.4305, 0.4153, 1.9716),
        GRADE_5=c(-1.2730, -0.4103, 0.4523, 1.8325),
        GRADE_6=c(-1.2700, -0.3977, 0.4747, 1.8007),
        GRADE_7=c(-1.3483, -0.3747, 0.5989, 2.0009),
        GRADE_8=c(-0.8417, -0.0968, 0.6481, 2.1677)),
    ALGEBRA_I_THETA =list(
        GRADE_EOCT=c(-1.1045, -0.2802, 0.5442, 2.3578)),
    ALGEBRA_II_THETA =list(
        GRADE_EOCT=c(-0.5384, 0.1635, 0.8654, 2.4938)),
    GEOMETRY_THETA=list(
        GRADE_EOCT=c(-1.2478, -0.2558, 0.7362, 2.0456)),
    INTEGRATED_MATH_1_THETA=list(
        GRADE_EOCT=c(-0.8966, -0.145, 0.6066, 2.0797)),
    INTEGRATED_MATH_2_THETA=list(
        GRADE_EOCT=c(-0.9298, -0.0769, 0.776, 1.9701)),
    INTEGRATED_MATH_3_THETA=list(
        GRADE_EOCT=c(-0.4075, 0.2249, 0.8574, 2.2235)))

save(PARCC_Cutscores, file="PARCC_Cutscores.Rdata")
