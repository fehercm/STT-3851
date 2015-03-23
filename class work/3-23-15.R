# Sampling Permutation Test
# Skull Breadths from Two Eras
# Is the maximal breadth of skulls from selected time periods different?
# What about other measurements (variables given below)?
# From: Thomson, A. and Randall-Maciver, R. (1905) Ancient Races of the 
#       Thebaid, Oxford: Oxford University Press.
# http://www.cixip.com/index.php/page/content/id/1207
# https://www.facebase.org/facial_norms/summary/measures/1/maxcranwidth
# MB: Maximal Breadth of Skull
# BH: Basibregmatic Height of Skull
# BL: Basialveolar Length of Skull
# NH: Nasal Height of Skull 
# Last Updated 03/22/2015 @ 01:00pm

Skulls <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/EgyptianSkulls.csv"))

#have these skulls mesurments changed from 4000bc to 200 bc.

SK200<-subset(Skulls, Time=="BCE.0200")
SK4000<-subset(Skulls, Time=="BCE.4000")
test.stat <- mean(SK200$BH) - mean(SK4000$BH)    
boxplot(SK200$BH, SK4000$BH, 
        horizontal=T, 
        xlab="Measurements (in mm)",
        names=c("200 BCE", "4000 BCE"))

# select observations and variable to be tested and drop all others
data <- subset(Skulls, Time=="BCE.0200" | Time=="BCE.4000", select=BH, drop=T)

# -----Change Variables or Time Periods Above to Perform a Different Test-----

# Uncomment seed command to get reproducible results
set.seed(0)

# Perform the peremutation resampling.
N <- 10^5-1
result <- numeric(N)
for(i in 1:N)
{
  index <- sample(60, 30)                             
  result[i] <- mean(data[index]) - mean(data[-index])
}

hist(result, prob=T, xlim=c(-6,6),
     main="Sampling Permutation Distribution",
     xlab="Randomly Resampled Differences")
abline(v=c(test.stat), col="blue",lty=5)

# Compute both of the one-sided p-values, based on the test statistic.
pvalue.upper<-(sum(result>=test.stat)+1)/(N+1)
pvalue.lower<-(sum(result<=test.stat)+1)/(N+1)

# Compute the two-sided p-value.
pvalue.choose <- min(pvalue.upper,pvalue.lower)
pvalue.two<-format(2*pvalue.choose, scientific=F)
print(paste("The two-sided p-value for Ha: Mean1 =/= Mean2 is ", pvalue.two, ".", sep=""),quote=F)

