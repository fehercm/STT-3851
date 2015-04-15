# Chi-Square Test of Independence
# Berkeley Graduate Admissions Bias
# Are sex and status dependent?
# Using summary counts vs. raw data 
# All applicants, not top six depts.
# Chi-square command vs. simulation
# Last updated 04.01.2015 @ 11:00pm
# Update: added "Another Example"

# Create the observed data table from the counts.
# Of 12,1763 total applicants, 5232 were accepted.
# of 4321 female applicants, 1494 were accepted.
# of 8442 male applicants, 3738 were accepted.

#-----Table Creation, Version 1-----

Observed1 <- matrix(c(1494, 3738, 4321-1494, 8442-3738), ncol=2)
rownames(Observed1) <- c("Female","Male")
colnames(Observed1) <- c("Accepted","Rejected")
addmargins(Observed1)
round(100*prop.table(Observed1,1),2)
chisq.test(Observed1,correct=F)

#-----Table Creation, Version 2-----

Female <- c(1494, 4321-1494)
Male <- c(3738, 8442-3738)
Observed2 <- rbind(Female,Male)
colnames(Observed2) <- c("Accepted","Rejected")
addmargins(Observed2)
round(100*prop.table(Observed2,1),2)
chisq.test(Observed2,correct=F)

#-----Another Example-----

# We can also use chisq.test for table created from raw data
# The Berkeley.csv datset contains a subset of the data above

Berkeley <- read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/Berkeley.csv"))
chisq.test(table(Berkeley$Sex,Berkeley$Status),correct=F)
