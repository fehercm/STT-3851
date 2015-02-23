A<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/Anthropometric.csv"))
fivenum(A$Ideal)
mean(A$Ideal,na.rm=T)
tapply(A$Height,A$Gender,range,na.rm=T)

median(A$Height)
median(A$Ideal,na.rm=T)
fivenum(A$Height,na.rm=T)

# Boxplots coparing height and ideal height
# Last updated 02.22.2015 @ 11:45pm
# Update: ---

Anthro <- read.csv(file = url("http://www1.appstate.edu/~thomleyje/R-datafiles/Anthropometric.csv"))

boxplot(Anthro$Height,Anthro$Ideal,
        main="Measured Heights vs. Selected Ideal Heights",
        ylab="Inches",
        names=c("Height","Ideal Height"),
        col=c("#A0A0A0","#E0E0E0"))

boxplot(Height ~ Gender, data=Anthro,
        main="Measured Heights by Gender*",
        sub="*featuring obnoxious gender-stereotyped colors",
        ylab="Inches",
        names=c("Female","Male"),
        col=c("#FFC0CB","#ADD8E6"))

boxplot(Ideal ~ Gender, data=Anthro,
        main="Ideal Heights by Gender",
        ylab="Inches",
        names=c("Height","Ideal Height"),
        col=c("#FF1493","#4169E1"))

HTM<-subset(Anthro, Gender=="Male", select="Height", drop=T)
HTF<-subset(Anthro, Gender=="Female", select="Height", drop=T)
IDM<-subset(Anthro, Gender=="Male", select="Ideal", drop=T)
IDF<-subset(Anthro, Gender=="Female", select="Ideal", drop=T)
boxplot(HTF,IDF,HTM,IDM,
        main="Actual Heights vs. Ideal Heights, by Gender",
        sub="*Guys really want to be tall, don't they?",
        ylab="Inches",
        names=c("Female Ht","Female Ideal","Male Ht","Male Ideal"),
        col=c("pink","deeppink","lightblue","royalblue"))

data.frame(Fence=c("Female Height",
                   "Female Ideal",
                   "Male Height",
                   "Male Ideal"),
           Fence.L=c(quantile(HTF,.25,na.rm=T)-1.5*IQR(HTF,na.rm=T),
                     quantile(IDF,.25,na.rm=T)-1.5*IQR(IDF,na.rm=T),
                     quantile(HTM,.25,na.rm=T)-1.5*IQR(HTM,na.rm=T),
                     quantile(IDM,.25,na.rm=T)-1.5*IQR(IDM,na.rm=T)),
           Fence.U=c(quantile(HTF,.75,na.rm=T)+1.5*IQR(HTF,na.rm=T),
                     quantile(IDF,.75,na.rm=T)+1.5*IQR(IDF,na.rm=T),
                     quantile(HTM,.75,na.rm=T)+1.5*IQR(HTM,na.rm=T),
                     quantile(IDM,.75,na.rm=T)+1.5*IQR(IDM,na.rm=T))
)