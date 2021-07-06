library(lattice)
library(datasets)
#simple scatterplot
xyplot(Ozone~Wind,data=airquality)
#already transform
#airquality<-transform(airquality,Month=factor(Month))
xyplot(Ozone~Wind | Month,data=airquality, layout=c(5,1))
p<-xyplot(Ozone~Wind,data=airquality)
print(p)
str(airquality)

set.seed(10)
x<-rnorm(100)
f<-rep(0:1, each=10)
f
y<-x+f-f*x+rnorm(100,sd=0.5)
y
f<-factor(f,labels = c("Group1","Group2"))
f
xyplot(y~x|f,layout=c(2,1))

#custom panel function
xyplot(y~x | f, panel = function(x,y,...){
  panel.xyplot(x,y,...)  #first call the default panel function for 'xyplot'
 # panel.abline(h=median(y),lty=2) # add horizontaline at median
  panel.lmline(x,y,col=2) #lnear model line
  
})
