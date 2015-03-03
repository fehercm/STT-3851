# Assessing the Normal distribution
# Requires added package "moments"
# Last Updated 03/02/2015 @ 10:00am


# Random normal variate generation, with statistics and graphs

# set parameters for simulated normal data and generate sample
n  <- 100
mu <- 0
sd <- 1
x.r=rnorm(n,mu,sd)

# mean(x.r)
# sd(x.r)
# 
# sum(x.r<(mean(x.r)-(0*sd(x.r))))
# 
# quant<-c(.05,.1,.2,.25,.3,.4,.5,.6,.7,.75,.8,.9,.95)
# 
# th.q<-qnorm(quant,mean(x.r),sd(x.r))
# em.q<-quantile(x.r,quant)
# em.q
# th.q
# 
# plot(th.q,em.q)
# 


# create a histogram with overlaid normal curve for comparison
hist(x.r, 
     prob=T, 
     xlim=c(mu-6*sd,mu+6*sd), 
     col="lightblue")
curve(dnorm(x,mean(x.r),sd(x.r)), 
      col="red", 
      add=TRUE)

# create normal quantile plot with straight line for comparison
qqnorm(x.r)
qqline(x.r)

# create empirical cumulative distribution with theoretical CDF
plot.ecdf(x.r)
curve(pnorm(x,mu,sd), 
      col="red", 
      add=TRUE)
abline(v=mu, h=.5, col="blue")

# compute skewness and kurtosis
require(moments)
skewness(x.r)
kurtosis(x.r)-3


# Random uniform variate generation, with statistics and graphs

# set parameters for simulated uniform data and generate sample
n  <- 100000
a <- 0
b <- 1
EX <-(a+b)/2
SX <-sqrt((a-b)^2/12)
x.r=runif(n,a,b)

# create a histogram with overlaid normal curve for comparison
hist(x.r, 
     prob=T, 
     xlim=c(EX-6*SX,EX+6*SX), 
     col="lightblue")
curve(dnorm(x,mean(x.r),sd(x.r)), 
      col="red", 
      add=TRUE)

# create normal quantile plot with straight line for comparison
qqnorm(x.r)
qqline(x.r)

# create empirical cumulative distribution with theoretical CDF
plot.ecdf(x.r)
curve(pnorm(x,EX,SX), 
      col="red", 
      add=TRUE)

# compute skewness and kurtosis
require(moments)
skewness(x.r)
kurtosis(x.r)-3


# Random exponential variate generation, with statistics and graphs

# set parameters for simulated uniform data and generate sample
n  <- 100
rt <- 1
EX <-1/rt
SX <-sqrt(1/rt^2)
x.r=rexp(n,rt)

# create a histogram with overlaid normal curve for comparison
hist(x.r, 
     prob=T, 
     xlim=c(EX-6*SX,EX+6*SX), 
     col="lightblue")
curve(dnorm(x,EX,SX), 
      col="red", 
      add=TRUE)

# create normal quantile plot with straight line for comparison
qqnorm(x.r)
qqline(x.r)

# create empirical cumulative distribution with theoretical CDF
plot.ecdf(x.r)
curve(pnorm(x,EX,SX), 
      col="red", 
      add=TRUE)

# compute skewness and kurtosis
require(moments)
skewness(x.r)
kurtosis(x.r)-3
