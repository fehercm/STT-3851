# Create the function
chisq<-function(Obs)
{ 
  Exp <- outer(rowSums(Obs),colSums(Obs))/sum(Obs)
  sum((Obs-Exp)^2/Exp)
}

# Load the dataset
STT3850 <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT3850.csv"))

# Select the two variables we want to test and make a table
Observed <- table(STT3850$Gender,STT3850$Type)

# Use function to calculate the chi-square test statistic (obs.diff)
obs.diff <- chisq(Observed)

# This computes the expected counts if we want to see them, but this
# step is not necessary for the hypothesis test; the function does it
Expected <- outer(rowSums(Observed),colSums(Observed))/sum(Observed)

# Resampling permutation test loop and graph of results
# Start with selecting the two variables to be analyzed
Sex    <- subset(STT3850, select=Gender, drop=T)
Type <- subset(STT3850, select=Type,drop=T)
set.seed(0)
N <- 10^4-1
random.diff<-numeric(N)
for (i in 1:N)
{
  TYPE.perm <-sample(Type)
  RANDOM.table <- table(Sex, TYPE.perm)
  random.diff[i]<-chisq(RANDOM.table)
}

# Graph the null distribution of the test statistic
hist(random.diff, prob=T,
     main="Null Distribution of Chi-Square Test Statistic",
     xlab="randomly generated chi-square statistics", 
     xlim=c(0,max(max(random.diff),obs.diff)),
     ylim=c(0,1))
abline(v=obs.diff,
       col="blue",
       lty=5)  

# Print the test statistic and p-value
# The p-value is (sum(random.diff >= obs.diff) + 1)/(N + 1) 
print(paste("The chi-square test statistic is ", round(obs.diff,4), ".", sep=""),quote=F)
print(paste("The p-value for the test of independence is ", format((sum(random.diff >= obs.diff) + 1)/(N + 1),scientific=F), ".", sep=""),quote=F)

chisq.test(table(STT3850$Gender,STT3850$Type),correct=F)

