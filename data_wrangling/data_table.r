library(data.table)
getwd()
df<-data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(df,4)
mean(df$x)
table(df$y)



dt=data.table(x=rnorm(18),y=rep(c("a","b","c"),each=3),z=rnorm(18))
head(dt,4)
tables()
dt[,list(mean(x),sum(z))]
dt[,table(y)]
#adding new column
dt[,w:=z^2]
head(dt)
#adding new column
dt[,w:=z^2]
head(dt)


#merge data table
DT1<-data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2.x)
merge(DT1,DT2)

