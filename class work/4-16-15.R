#for any population with a finite mean u and veriance o^2, 
#if we have a sufficiently large sample size n, the sampling 
#distribution x we be approximatly normal with a mean u and 
#standard error 0/sqrt(n) 

#(central limit thereom)
#A plane flies from ny to chicago and back takes between 
#120 and 150 mins to make the trip. the distribution of 
#times is uniform

#less than 130 
punif(130,120,150)

#of the next 20 fight are less than 130mins.\
#for a symetric like unif n=20 is enough for the clt
#to work also no outliers.
#use the mean and the sample size to get sd

pnorm(130,135,2)

#between 132 and 138
pnorm(138,135,2)-pnorm(132,135,2)

#life expectancy of incandecant light bulbs is exponentialy
#dist with mean 1200h

#rate is mean inverse
#tipical betwen 1000 and 2000
#what percentange

pexp(2000,(1/1200))-pexp(1000,1/1200)

#if we buy a case of 1000 light bulbs chance of came life spane

pnorm(2000,1200,120)-pnorm(1000,1200,120)

#x~N(20,8^2) n=10
#y~N(16,7^2) n=15

#w=x+y

rnorm(10,20,8)
rnorm(15,16,7)

n=100
for (i in 1:n)
{
  x<-mean(rnorm(10,20,8))
  y<-mean(rnorm(15,16,7))
  w[i]<-x+y
}

hist(w)
