library(datasets)
aq<-datasets::airquality
hist(aq$Ozone)
with(aq,plot(Wind,Ozone))
#annotation point charachter(PCH)
with(aq,plot(Wind~Ozone, pch=25))
with(aq,plot(Wind,Ozone, pch=15 ,col= 'red'))
par('pch')
str(aq)
airquality<-transform(airquality,Month=factor(Month))
str(airquality)
boxplot(Ozone~Month,airquality,xlab = "month",ylab = "Ozone", main='Month vs Ozone')
levels(airquality$Month)
airquality$Month

#annptaiton Regression
with(airquality,plot(Wind,Ozone))
title(main="ozone and wind in new york city", type='n')
with(subset(airquality,Month==5), points(Wind,Ozone,col='blue'))
with(subset(airquality,Month!=5), points(Wind,Ozone,col='red'))
legend("topright",pch=1,col=c('blue','red'),legend = c('may','other month'))
model<-lm(Ozone~Wind,airquality)
abline(model,lwd=2, col ="black", lty=5)
model

#multiple base plot
par(mfrow=c(1,3),mar=c(4,4,2,2),oma=c(0,0,2,0))
with(airquality,{
     plot(Wind,Ozone,main="Ozone and Wind")
     plot(Solar.R,Ozone,main='Ozone and solar Radiation')
     plot(Temp,Ozone,main='ozone and temperature')
     mtext("ozone and weather in new ork city", outer = TRUE)
})

