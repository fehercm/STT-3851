# Exploring the Normal distribution
# Requires added package "moments"
# Last Updated 03/02/2015 @ 10:30am


# Create curves to show standard Normal pdf and CDF, V1

x <- seq(-6,6,by=.1)
f.x <- dnorm(x)
ff.x <- pnorm(x)
plot(x, f.x, 
     type="l", 
     col="blue", 
     ylim=c(0,.5),
     main="standard normal pdf using plot function",
     ylab="f(x)")
#abline(v=c(-3,-2,-1,0,1,2,3), h=0, col="red")

pnorm(-3,0,1)
pnorm(-2)
pnorm(-1)-pnorm(-2)
pnorm(0)-pnorm(-1)

qnorm(.75,0,1)

plot(x, ff.x, 
     type="l", 
     col="blue", 
     ylim=c(0,1),
     main="standard normal CDF using plot function",
     ylab="F(x)")
#abline(v=c(-3,-2,-1,0,1,2,3), h=.5, col="red")
data.frame(x=x,f.x=round(f.x,4),ff.x=round(ff.x,4))


# Create curves to show standard Normal pdf and CDF, V2

curve(dnorm(x,100,15), 40, 160, 
      main="pdf using curve function")
abline(v=c(-3,-2,-1,0,1,2,3), h=0, col="red")
curve(pnorm(x,0,1), -6, 6, 
      main="CDF using curve function",col="blue")
abline(v=c(-3,-2,-1,0,1,2,3), h=.5, col="red")


# Create several Normal curves on the same axes

curve(dnorm(x,0,1), -10, 10, main="Normal Curves") 
curve(dnorm(x,0,2), add=T, col="red") 
curve(dnorm(x,0,3), add=T, col="blue")
curve(dnorm(x,1,1), add=T, col="green")
curve(dnorm(x,-2,2), add=T, col="orange")
