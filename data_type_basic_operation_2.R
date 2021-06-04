#Subset with Vector
a<-c("a","b","c","d","a")
a[1]
a[2]
a[1:3]
a[a>"a"]
#OR
u<-a>"a"
u
a[u]

#Subset with Martices
b<-matrix(1:6,2,3)
b
b[1,2]
b[2,3]
b[1,]
b[,2]
b[1, ,drop=FALSE] # output wii be in matrix form
x<-list(weekdays=1:4,rain_prob=0.6)
x[1]
x[[1]]
x['rain_prob']
x[['rain_prob']]

#SubSet With List
y<-list(weekday=1:4,rain_prob=0.6,item='umbrella')
y[c(1,3)]


name<-"weekday"
y[[name]]
y$name
x$weekday

#subset Nested element of List
z<-list(a=list(10,12,14),b<-c(2.12,3.24))
z[[c(1,3)]]
z[[1]][[3]]
z[[c(2,1)]]

#removing NA values
a<-c(1,2,NA,3,4,NA,NA,7)
b<-c("a",NA,"c","d",NA,"e",NA,"f")
bad<-is.na(a)
bad
a[!bad]

#using complete,cases function
good<-complete.cases(a,b) #argumentslength should be same
good
a[good]
b[good]

#airquality
#View((airquality))
#or
w<-airquality
View(w)
w[1:6, ]
View(w[1:6, ])
good<-complete.cases(w)
good
w[good,"Day"]
w[good,] [1:6, ]
