personality <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT1810.csv"))
table(personality$Gender, personality$EorI)

c<-subset(personality,Major=="Criminal Justice")

addmargins(round(100*prop.table(table(c$Gender, c$JorP),1),2),2)

barplot(table(c$TorF,c$Gender),
        main="Gender of STT1810",
        sub="class",
        ylab="Frequency",
        ylim=c(0,150),
        col=c("red","blue"),
        legend=rownames(table(c$TorF,c$Gender)))
