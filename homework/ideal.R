STT1810 <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/Anthropometric.csv"))

#the alternative hypotheses is that men where more likely to select a above average height than woman.
#the null hypotheses is that the chance of woman and men picking a above adverage heght size were the same.
#subseting the ideal data by gender
ideal<-na.omit(subset(STT1810, select="Ideal",drop=T))
Male<-subset(STT1810,select="Ideal", Gender=="Male",drop=T)
Female<-subset(STT1810,select="Ideal", Gender=="Female",drop=T)

#removing the na results
Female<-na.omit(Female)
Male<-na.omit(Male)

#difference in heights
Femdiff<-63.75-Female
Malediff<-69.5-Male



#number that had a geater ideal
Female.Count<-sum(Femdiff<0)
Male.Count<-sum (Malediff<0)

Test.Stat<-Male.Count-Female.Count

#simulation
N<-10^5-1
result <- numeric(N)
for(i in 1:N)
{
  male <- sample(265, 135) 
  female<- sample(265,130)
  result[i] <- sum((69.5-ideal[male])<0) - sum((63.75-ideal[female])<0)
}

hist(result)

p<-(sum(result >= Test.Stat) + 1)/(N + 1)
p
# with that we reject the null hypotheses