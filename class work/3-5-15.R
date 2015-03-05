# Tests of normality for height and ideal height
# Last updated 03.01.2015 @ 09:00pm
# Update: ---

ship <- read.csv(file = url("http://www1.appstate.edu/~thomleyje/R-datafiles/Shipsanitation.csv"))

HT   <- ship$Score
ID   <- Anthro$Ideal
HTM  <-subset(, Gender=="Male", select="Height", drop=T)
HTF  <-subset(Anthro, Gender=="Female", select="Height", drop=T)
IDM  <-subset(Anthro, Gender=="Male", select="Ideal", drop=T)
IDF  <-subset(Anthro, Gender=="Female", select="Ideal", drop=T)
DIFF <- ID-HT


# Assessment for Height
hist(HT, prob=T,
     main="Score",
     col="#A0A0A0")
curve(dnorm(x,mean(HT,na.rm=T),sd(HT,na.rm=T)), 
      col="red", 
      add=TRUE)
qqnorm(HT,
       main="Score")
qqline(HT, col="red")
plot.ecdf(HT,
          main="ECDF of Score")
curve(pnorm(x,mean(HT),sd(HT)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(HT)
kurtosis(HT)-3


# Assessment for Ideal Height
hist(ID, prob=T,
     main="Ideal Height",
     col="#E0E0E0")
curve(dnorm(x,mean(ID,na.rm=T),sd(ID,na.rm=T)), 
      col="red", 
      add=TRUE)
qqnorm(ID,
       main="Ideal Height")
qqline(ID, col="red")
plot.ecdf(ID,
          main="ECDF of Ideal Height")
curve(pnorm(x,mean(ID,na.rm=T),sd(ID,na.rm=T)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(ID,na.rm=T)
kurtosis(ID,na.rm=T)-3


# Assessment for Male Height
hist(HTM, prob=T,
     main="Male Height",
     col="lightblue")
curve(dnorm(x,mean(HTM),sd(HTM)), 
      col="red", 
      add=TRUE)
qqnorm(HTM,
       main="Male Height")
qqline(HTM, col="red")
plot.ecdf(HTM,
          main="ECDF of Ideal Height")
curve(pnorm(x,mean(HTM),sd(HTM)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(HTM)
kurtosis(HTM)-3


# Assessment for Female Height
hist(HTF, prob=T,
     main="Female Height",
     col="pink")
curve(dnorm(x,mean(HTF),sd(HTF)), 
      col="red", 
      add=TRUE)
qqnorm(HTF,
       main="Female Height")
qqline(HTF, col="red")
plot.ecdf(HTF,
          main="ECDF of Ideal Height")
curve(pnorm(x,mean(HTF),sd(HTF)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(HTF)
kurtosis(HTF)-3


# Assessment for Male Ideal Height
hist(IDM, prob=T,
     main="Male Ideal Height",
     col="royalblue")
curve(dnorm(x,mean(IDM,na.rm=T),sd(IDM,na.rm=T)), 
      col="red", 
      add=TRUE)
qqnorm(IDM,
       main="Male Ideal Height")
qqline(IDM, col="red")
plot.ecdf(IDM,
          main="ECDF of Ideal Height")
curve(pnorm(x,mean(IDM,na.rm=T),sd(IDM,na.rm=T)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(IDM,na.rm=T)
kurtosis(IDM,na.rm=T)-3


# Assessment for Female Ideal Height
hist(IDF, prob=T,
     main="Female Ideal Height",
     col="deeppink")
curve(dnorm(x,mean(IDF,na.rm=T),sd(IDF,na.rm=T)), 
      col="red", 
      add=TRUE)
qqnorm(IDF,
       main="Female Ideal Height")
qqline(IDF, col="red")
plot.ecdf(IDF,
          main="ECDF of Ideal Height")
curve(pnorm(x,mean(IDF,na.rm=T),sd(IDF,na.rm=T)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(IDF,na.rm=T)
kurtosis(IDF,na.rm=T)-3


# Assessment for Difference in Height and Ideal Height
hist(DIFF, prob=T,
     main="Difference",
     col="deeppink")
curve(dnorm(x,mean(DIFF,na.rm=T),sd(DIFF,na.rm=T)), 
      col="red", 
      add=TRUE)
qqnorm(DIFF,
       main="Difference")
qqline(DIFF, col="red")
plot.ecdf(DIFF,
          main="Difference")
curve(pnorm(x,mean(DIFF,na.rm=T),sd(DIFF,na.rm=T)), 
      col="red", 
      add=TRUE)
require(moments)
skewness(DIFF,na.rm=T)
kurtosis(DIFF,na.rm=T)-3

