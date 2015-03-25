stat<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT3850.csv"))

SKintj<-subset(stat, Type=="INTJ")

table(SKintj$Gender)

pmale<-8/43
pfemale<-35/43

# Combining Subsets of Two Data Sets for Analysis
# Includes Creating a New Variable to Identify Group
# Last Updated 03/25/2015 @ 11:00am

STT1810 <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT1810.csv"))
STT3850 <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT3850.csv"))
PER.1810 <- subset(STT1810, select=c("Gender","Type"))
PER.1810$Class <- 1810
PER.3850 <- subset(STT3850, select=c("Gender","Type"))
PER.3850$Class <- 3850
STT.Comb <- rbind(PER.1810, PER.3850)

addmargins(table(STT.Comb$Class))
round(prop.table(table(STT.Comb$Type, STT.Comb$Class),2),2)

STT1810 <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT1810.csv"))

male<-subset(STT1810,select="Hight")
