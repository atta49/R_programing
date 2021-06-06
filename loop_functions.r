#lapply
x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)
mean(x$a)
mean(x$b)
y<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
hist(y$d)
lapply(y,mean)
lapply(y,sd)
lapply(y,sum)
z=rnorm(10000)
hist(z)
x<-1:4
lapply(x,runif)
names(x)<-c("a","b","c","d")
runif(1)
runif(2)

#Sapply
x<-list(a=1:5,b=rnorm(10))
sapply(x,mean)#the diff b/t sapply and lapply is sapply show data in form of series except list 
lapply(x,mean)

x<-1:4
sapply(x,runif)# in this situation the sapply will return in form of list because every
#time the number of list is incresing and
#didnt know whaat to return wheather vector or martix 
#although matrix os not possible because vector contain fix nrow and ncol
lapply(x,runif)
names(x)<-c("a","b","c","d")

y<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(y,sum)
sapply(y,sum)


#apply
x<-matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,sum)
?quantile
apply(x,1,quantile)
apply(x,1,quantile,probs=c(.25,.50))

#tapply
?gl
x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
tapply(x,f,mean)
rnorm(10)
runif(10)
rnorm(10,1)
tapply(x,f,mean,simplify = FALSE)
tapply(x,f,range)

