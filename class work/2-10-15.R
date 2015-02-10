x<-rbinom(1000,10,.1)
x[800]
x[1:800]
x[0]
hist(x)

y<-runif(1000,0,1)
hist(y)

e<-rexp(1000,1)
hist(e)

n<-rnorm(100,5,1)
hist(n)