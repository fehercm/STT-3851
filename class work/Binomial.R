# Generates the pmf and CDF for X ~ BIN(n,p)
# Last updated 01/15/2014 @ 10:45am

# Input your desired parameters n and p below

n<-10
p<-.9

# This command creates the sample space of X
# x is number of successes observed in n trials

x<-0:n

# This command computes the pmf, f(x) = P(X=x)
# Probabilities are rounded to 4 decimal places

pmf<-round(dbinom(x,n,p),4)

# This command computes the CDF, F(X) = P(X<=x), and 1-CDF, P(X>x)
# The pbinom function is a summation of the dbinom function
# In other words, pbinom(x,n,p) = sum(dbinom(0:x,n,p))
# Probabilities are rounded to 4 decimal places

CDF1<-round(pbinom(x,n,p),4)
CDF2<-round(pbinom(x,n,p,F),4)

# This command creates a table for the pmf, CDF, and 1-CDF

distribution<-data.frame(Num.Succ=x,
                         Prob.eq.x=pmf,
                         Prob.leq.x=CDF1,
                         Prob.grt.x=CDF2)

#These commands plot the pmf, CDF, and 1 - CDF
barplot(pmf,
        space=0,
        main="binomial pmf",
        names=x,
        xlab="x", 
        ylab="f(x) = P(X=x)")
# barplot(CDF1,
#         space=0,
#         main="binomial CDF",
#         names=x,
#         xlab="x", 
#         ylab="F(x) = P(X<=x)")
# barplot(CDF2,
#         space=0,
#         main="1 - binomial CDF",
#         names=x,
#         xlab="x", 
#         ylab="1 - F(x) = P(X>x)")
# 
# # This command prints out the probability table
# print(distribution, row.names=F)