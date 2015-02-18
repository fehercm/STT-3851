x<-rnorm(1000000,0,1)
require(moments)
skewness(x)
kurtosis(x)-3

x<-runif(1000,0,1)
require(moments)
skewness(x)
kurtosis(x)-3

x<-rexp(1000,1)
require(moments)
skewness(x)
kurtosis(x)-3

count<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/NCCounties2011.csv"))
x<-count$Population\
hist(x)
require(moments)
skewness(x)
kurtosis(x)-3

exam<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/ExamScoresS14.csv"))
y<-exam$Score
hist(y)
require(moments)
skewness(y)
kurtosis(y)-3

sd(y)/mean(y)

nc<-sort(x)
nc
mean(nc[50:51])
median(nc)
fivenum(x)
