set.seed(0)
x1<-1
x2<-rgeom(10000,5/6) + 1
x3<-rgeom(10000,4/6) + 1
x4<-rgeom(10000,3/6) + 1
x5<-rgeom(10000,2/6) + 1
x6<-rgeom(10000,1/6) + 1

total <- x1+x2+x3+x4+x5+x6
min(total)