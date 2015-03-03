problem 3

stt3850<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT3850.csv"))
addmargins(table(stt3850$Gender))
sort(prop.table(table(stt3850$Major)))
barplot(sort(prop.table(table(stt3850$Major))),main="Students in each Major",xlab="Major",ylab="No. Students")
sort(prop.table(table(stt3850$Type)))
addmargins(table(stt3850$Gender,stt3850$Major))
barplot(table(stt3850$Gender,stt3850$Major),main="Students by Gender in each Major",xlab="Major",ylab="No. Students",col=c("deep pink","royal blue"))
#by looking at the table and graph there is a significant difference in males and females by major
round(100*prop.table(table(stt3850$Type,stt3850$Gender),2),2)
# Yes, the data in the table shows that there is no type that has roughly the same percentage between males and females

stt1810<-read.csv(file=url("http://www1.appstate.edu/~thomleyje/R-datafiles/PersonalitySTT1810.csv"))
addmargins(table(stt1810$Gender))
sort(prop.table(table(stt1810$Major)))
barplot(sort(prop.table(table(stt1810$Major))),main="Students in each Major",xlab="Major",ylab="No. Students")
sort(prop.table(table(stt1810$Type)))
addmargins(table(stt1810$Gender,stt1810$Major))
barplot(table(stt1810$Gender,stt1810$Major),main="Students by Gender in each Major",xlab="Major",ylab="No. Students",col=c("deep pink","royal blue"))
round(100*prop.table(table(stt1810$Type,stt1810$Gender),2),2)
#The 3850 has way fewer females to males while 1810 has around the same
#Two of the majors in 1810 communications and nurseing have more females while in 3850 all majors had a majority of males.
#In 3850 there are no percentage of females in the type ENTP,ESTJ,ESTP,ISTP while there is in 1810.