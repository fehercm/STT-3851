berk <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/Berkeley.csv"))
sex <- berk$Sex
status <-berk$Status

addmargins(table(sex,status))

#test of independence

#expected counts
(1755/4526)*1835
(1755/4526)*2691
(2771/4526)*1835
(2771/4526)*2691
#in general any cell = (row total*column total)/total observed.
((557-711.54)^2)/711.54 #repeat for all cells then sum, this is the test statistic.
#if the two are identical the test stat would be 0.

# Chi-Square Test of Independence
# Berkeley Graduate Admissions Bias
# Are sex and status dependent?
# Data for largest six departments
# Last updated 03.30.2015 @ 07:00pm
# Update: edit comments, add links, edit histogram, add question

# Create a new function to compute the chi-squared test statistic
# The function's name is chisq, the required input is a data table 
# Obs(erved) is the observed data table; variables are defined later
# Exp(ected) is a contingency table computed from the Observed data
# Outer is the outer product of two vectors, which makes a matrix
# http://en.wikipedia.org/wiki/Outer_product
# http://calculator.vhex.net/calculator/linear-algebra/outer-product

chisq<-function(Obs)
{ 
  Exp <- outer(rowSums(Obs),colSums(Obs))/sum(Obs)
  sum((Obs-Exp)^2/Exp)
}

# Load the dataset
Berkeley <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/Berkeley.csv"))

#Select the two variables we want to test and make a table
Observed <- table(Berkeley$Sex,Berkeley$Status)

#Use function created above to calculate the chi-square test statistic
test.stat <- chisq(Observed)
Expected <- outer(rowSums(Observed),colSums(Observed))/sum(Observed)

# Resampling permutation test loop and graph of results
# Start with selecting the two variables to be analyzed

Sex <- subset(Berkeley, select=Sex, drop=T)
Status <- subset(Berkeley, select=Status,drop=T)

N <- 10^4-1
result<-numeric(N)
for (i in 1:N)
{
  STATUS.perm <-sample(Status)
  RANDOM.table <- table(Sex, STATUS.perm)
  result[i]<-chisq(RANDOM.table)
}
result

# Graph the null distribution of the test statistic

hist(result, prob=T,
     main="Null Distribution of Chi-Square Test Statistic",
     breaks=seq(0,UL,by=0.5),
     xlab="chi-square statistic", 
     xlim=c(0,max(max(result),test.stat)),
     ylim=c(0,1))
abline(v=test.stat,
       col="blue",
       lty=5)  

# Print observed counts, expected counts, test statistic, and p-value 
print(paste("The chi-square test statistic is ", round(test.stat,4), ".", sep=""),quote=F)
print(paste("The p-value for the chi-square test of independence is ", format((sum(result >= test.stat) + 1)/(N + 1),scientific=F), ".", sep=""),quote=F)
