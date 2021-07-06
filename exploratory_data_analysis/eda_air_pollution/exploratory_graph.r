getwd()
setwd("../")
setwd('./exploratory_data_analysis')
if(!dir.exists("eda_air_pollurion")){
     dir.create("eda_air_pollurion")
}
if(!dir.exists("eda_air_pollurion")){
     dir.create("eda_air_pollurion")
}else{
     dir.create("data")
}
setwd('./exploratory_data_analysis')
getwd()

pollution<- read.csv("./data/ad_viz_plotval_data.csv")
head(pollution)
str(pollution)

#removing colum
pollution1<-pollution[,c(-3,-6:-12)]
View(pollution1)

#five number summary
summary(pollution1$Daily.Mean.PM2.5.Concentration)

boxplot(pollution1$Daily.Mean.PM2.5.Concentration,col = "red")
abline(h=12)
hist(pollution1$Daily.Mean.PM2.5.Concentration,col = "green", breaks = 50, xlim = c(0,35))
abline(v=12,lwd=2)
abline(v=median(pollution1$Daily.Mean.PM2.5.Concentration), col = 'magenta',lwd=4)
rug(pollution1$Daily.Mean.PM2.5.Concentration)
rug(pollution1$pm25)

barplot(table(pollution1$COUNTY), col = "wheat",main = "pollution in county")

with(pollution1,plot(Date, Daily.Mean.PM2.5.Concentration, col=COUNTY))
abline(h=12,lwd=2,lty=5)

with(pollution1,plot(Date, Daily.Mean.PM2.5.Concentration))
abline(h=12,lwd=2,lty=5)

boxplot(Daily.Mean.PM2.5.Concentration ~ COUNTY, data=pollution1 , col='red')
abline(h=13, lwd=2)
