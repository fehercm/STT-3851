# Descriptive analysis of the TitanicA dataset, Sex vs. survival
# Bar charts (called barplots in R)
# Last updated 02/04/2015 @ 04:00pm
# Update: changed url in read.csv

# Read in the dataset! In R Studio, I  can do this manually via Environemnt>Import Dataset.

TitanicA <- read.csv(file = url("http://www1.appstate.edu/~thomleyje/R-datafiles/TitanicA.csv"))

# I will name my variables something easier to type later.

sex<-(TitanicA$Sex)
survival<-(TitanicA$Survival)

# I will make bar charts of the frequency tables for my variables sex and survival.

barplot(table(sex), 
        main="Sex of People on the Titanic",
        sub="Total of n = 2201 Passenegrs and Crew",
        ylim=c(0,2201),
        ylab="Count",
        col="lightblue")
barplot(table(survival), 
        main="Survival Status of People on the Titanic",
        sub="Total of n = 2201 Passenegrs and Crew",
        ylim=c(0,2201),
        ylab="Count",
        col="lightyellow")

# I will make bar charts of the relative frequency tables for my two variables.

barplot(prop.table(table(sex)), 
        main="Sex of People on the Titanic",
        sub="Total of n = 2201 Passenegrs and Crew",
        ylab="Proportion")
barplot(prop.table(table(survival)), 
        main="Status of People on the Titanic",
        sub="Total of n = 2201 Passenegrs and Crew",
        xlab="Alive or Dead",
        ylab="Proportion")

# I will make a comparitive bar chart of my crosstabulated data, using counts.

mytable1<-table(sex,survival)
barplot(mytable1, 
        main="Survival Status by Sex for Titanic Passengers and Crew",
        ylim=c(0,2201),
        ylab="Count",
        col=c("pink","#99ffff"),
        legend=rownames(mytable1))

# I will make comparitive bar charts of my crosstabulated data, using proportions.

mytable2<-prop.table(mytable1)
barplot(mytable2, 
        main="TITLE",
        ylim=c(0,1),
        ylab="Proportion",
        col=c("pink","#99ffff"),
        legend=rownames(mytable2))

mytable3<-prop.table((mytable1),2)
barplot(mytable3, 
        main="TITLE",
        ylim=c(0,1),
        ylab="Proportion",
        col=c("pink","#99ffff"),
        legend=rownames(mytable3))

mytable4<-prop.table(table(survival,sex),2)
barplot(mytable4, 
        main="TITLE",
        ylim=c(0,1),
        ylab="Proportion",
        col=c("#707070","#C0C0C0"),
        legend=rownames(mytable4))

mytable5<-prop.table(table(survival,sex),2)
barplot(mytable5, 
        main="TITLE",
        ylim=c(0,1),
        ylab="Proportion",
        col=c("#909090","#E0E0E0"),
        legend=rownames(mytable5),
        beside=TRUE)