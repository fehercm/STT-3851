#are sex and dept related? and dept and admission status related?
sex <- Berkeley$Sex
status <-Berkeley$Status
dept<-Berkeley$Department


table(dept,sex)

chisq<-function(Obs)
{ 
  Exp <- outer(rowSums(Obs),colSums(Obs))/sum(Obs)
  sum((Obs-Exp)^2/Exp)
}

Observed <- table(dept,sex)
test.stat <- chisq(Observed)

Sex <- subset(Berkeley, select=Sex, drop=T)
Department <- subset(Berkeley, select=Department,drop=T)

N <- 10^4-1
result<-numeric(N)
for (i in 1:N)
{
  DEPT.perm <-sample(Department)
  RANDOM.table <- table(Sex, DEPT.perm)
  result[i]<-chisq(RANDOM.table)
}


# Print observed counts, expected counts, test statistic, and p-value 
print(paste("The chi-square test statistic is ", round(test.stat,4), ".", sep=""),quote=F)
print(paste("The p-value for the chi-square test of independence is ", format((sum(result >= test.stat) + 1)/(N + 1),scientific=F), ".", sep=""),quote=F)

prop.table(table(dept,status),1)

Observed <- table(dept,status)
test.stat <- chisq(Observed)

Status <- subset(Berkeley, select=Status, drop=T)
Department <- subset(Berkeley, select=Department,drop=T)

N <- 10^4-1
result<-numeric(N)
for (i in 1:N)
{
  DEPT.perm <-sample(Department)
  RANDOM.table <- table(Status, DEPT.perm)
  result[i]<-chisq(RANDOM.table)
}


# Print observed counts, expected counts, test statistic, and p-value 
print(paste("The chi-square test statistic is ", round(test.stat,4), ".", sep=""),quote=F)
print(paste("The p-value for the chi-square test of independence is ", format((sum(result >= test.stat) + 1)/(N + 1),scientific=F), ".", sep=""),quote=F)
n=6
1="A"
2="B" 
3="c"
4="D"
5="E"
6="F"
for (j in 1:n)
{
  bydept
  Observed <- table(bydept$sex,bydept%status )
  test.stat <- chisq(Observed)

  Sex <- subset(bydept, select=Sex, drop=T)
  Status <- subset(bydept, select=Status,drop=T)

  N <- 10^4-1
  result<-numeric(N)
  for (i in 1:N)
  {
    DEPT.perm <-sample(Status)
    RANDOM.table <- table(Sex, DEPT.Status)
    result[i]<-chisq(RANDOM.table)
  }
  result[j]

  # Print observed counts, expected counts, test statistic, and p-value 
  print(paste("The chi-square test statistic is ", round(test.stat,4), ".", sep=""),quote=F)
  print(paste("The p-value for the chi-square test of independence is ", format((sum(result >= test.stat) + 1)/(N + 1),scientific=F), ".", sep=""),quote=F)
  
  result[j]<-sum(result >= test.stat) + 1)/(N + 1)
}