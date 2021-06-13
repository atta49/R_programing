dt=data.table(x=rnorm(18),y=rep(c("a","b","c"),each=3),z=rnorm(18))
dt
View(dt)
dt[order(dt$x)]
dt[order(-dt$y),]#descending order
dt[order(-dt$y,dt$x),]

set.seed(1234)
X<-data.frame('var1'=sample(1:5),'var2'=sample(6:10),'var3'=sample(11:15))
X<-X[sample(1:5),]
X$var2[c(1,3)]=NA
X

Y<-data.table('var1'=sample(1:5),'var2'=sample(6:10),'var3'=sample(11:15))
Y<-Y[sample(1:5),]
Y$var2[c(1,3)]=NA
Y

X[,1]
X[,"var1"]
X[1:2,"var2"]


X[(X$var1<=3 & X$var3>6),]
X[(X$var1<=3 | X$var3>11),]

#sorting
sort(X$var1)
sort(X$var1,decreasing = TRUE)
sort(X$var2,na.last = TRUE)


#datafram updating
X[order(X$var1),]
X[order(X$var1,X$var3),]
