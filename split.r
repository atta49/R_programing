x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)
x
lapply(split(x,f),mean)

library(datasets)
?datasets
#datasets::
head(DNase)
View(DNase)
head(airquality)
?airquality
s<-split(airquality,airquality$Month)
lapply(s,function(x),)
head(s$'5')
table(airquality$Month)
fc <- function(x) colSums(x,[,c("Ozone","Solar.R","wind")])
lapply(s,function(x) colSums(x[, c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = TRUE))
