personality <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT1810.csv"))
table(personality$Gender, personality$EorI)

addmargins(table(personality$Gender, personality$EorI),2)
prop.table(table(personality$Gender, personality$EorI),2)
addmargins(prop.table(table(personality$Gender, personality$EorI)))

addmargins(round(100*prop.table(table(personality$Gender, personality$SorN),1),2),2)




